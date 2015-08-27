//
//  ViewController.m
//  Clicker
//
//  Created by PaRaDoX on 25.08.15.
//  Copyright (c) 2015 PaRaDoX. All rights reserved.
//

#import "CLGameViewController.h"

@interface CLGameViewController ()

@end

@implementation CLGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scoreLabel setText:[NSString stringWithFormat:@"%li", (long)[CLGameManager shared].currentPoints]];
    [self.levelLabel setText:[NSString stringWithFormat:@"%li", (long)[CLGameManager shared].currentLevel]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
//    [self.clickButton.titleLabel setFont:[UIFont fontWithName:@"Halo" size:35]];
    [self.clickButton setTitle:[NSString stringWithFormat:@"+%li", (long)[CLGameManager shared].currentPointsByClick] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)levelsInfo:(UIButton *)sender
{
}

- (IBAction)clickAction:(UIButton *)sender
{
    int width = self.view.frame.size.width;
    CLAnimatedLabel * testLabel = [[CLAnimatedLabel alloc] initWithFrame:CGRectMake((arc4random() % (width-80)), self.view.frame.size.height/2 - 35, 100, 70)];
    [[CLGameManager shared]addPointsByClick];
    [testLabel setText:[NSString stringWithFormat:@"+%li", (long)[CLGameManager shared].currentPointsByClick]];
    [self.scoreLabel setText:[NSString stringWithFormat:@"+%li", (long)[CLGameManager shared].currentPoints]];
    [self.view addSubview:testLabel];
    [testLabel setAnimation];
    
    [RACObserve([CLGameManager shared], currentLevel) subscribeNext:^(NSNumber* x){
        [self.clickButton setTitle:[NSString stringWithFormat:@"%li", (long)[CLGameManager shared].currentPointsByClick] forState:UIControlStateNormal];
        [self.levelLabel setText:[NSString stringWithFormat:@"%li", (long)[CLGameManager shared].currentLevel]];
    }];
}
@end
