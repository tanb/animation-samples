//
//  ViewController.m
//  animation
//
//  Created by tanB on 12/16/14.
//  Copyright (c) 2014 tanb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) UIView *cardView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cardView = [UIView new];
    self.cardView.frame = CGRectMake(0, 0, 30, 40);
    self.cardView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.cardView];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CALayer *cardLayer = self.cardView.layer;
    CGPoint layerCenter = CGPointMake(self.cardView.frame.size.width / 2,
                                 self.cardView.frame.size.height/ 2);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 3;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(layerCenter.x, layerCenter.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300 + layerCenter.x, layerCenter.y)];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;

    // init animations and start x-move animation
    [cardLayer removeAllAnimations];
    [cardLayer addAnimation:animation forKey:@"x_move_animation"];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CALayer *cardLayer = self.cardView.layer;
    CGPoint layerCenter = CGPointMake(self.cardView.frame.size.width / 2,
                                      self.cardView.frame.size.height/ 2);
    
    // presentationLayer returns a copy of the layer containing all properties with any active animations applied.
    CGPoint stoppedPosition = ((CALayer *)[cardLayer presentationLayer]).position;

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 3;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(stoppedPosition.x, stoppedPosition.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(stoppedPosition.x, 300 + layerCenter.y)];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    // stop x-move animation and start y-move animation
    [cardLayer removeAnimationForKey:@"x_move_animation"];
    [cardLayer addAnimation:animation forKey:@"y_move_animation"];

}

@end
