//
//  ViewController.h
//  Clicker
//
//  Created by PaRaDoX on 25.08.15.
//  Copyright (c) 2015 PaRaDoX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLAnimatedLabel.h"

@interface CLGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *clickButton;


- (IBAction)levelsInfo:(UIButton *)sender;
- (IBAction)clickAction:(UIButton *)sender;

@end
