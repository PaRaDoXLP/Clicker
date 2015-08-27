//
//  animatedLabel.m
//  Clicker
//
//  Created by PaRaDoX on 26.08.15.
//  Copyright (c) 2015 PaRaDoX. All rights reserved.
//

#import "CLAnimatedLabel.h"

@implementation CLAnimatedLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code Halo
}
*/

- (void)layoutSubviews
{
    self.textAlignment = NSTextAlignmentCenter;
    self.font = [UIFont fontWithName:@"Halo" size:35];
    self.backgroundColor = [UIColor clearColor];
    
    CGFloat redLevel    = rand() / (float) RAND_MAX;
    CGFloat greenLevel  = rand() / (float) RAND_MAX;
    CGFloat blueLevel   = rand() / (float) RAND_MAX;
    self.textColor = [UIColor colorWithRed: redLevel
                                          green: greenLevel
                                           blue: blueLevel
                                          alpha: 1.0];
}


- (void) setAnimation
{
    self.alpha = 0.0;
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.alpha = 1.0;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.0
                                               delay:1.0
                                             options: UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              self.alpha = 0.0;
                                              
                                          }
                                          completion:^(BOOL finished){
                                              [self removeFromSuperview];
                                          }];
                     }];
}

@end
