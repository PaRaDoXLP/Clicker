//
//  ViewController.m
//  Clicker
//
//  Created by PaRaDoX on 25.08.15.
//  Copyright (c) 2015 PaRaDoX. All rights reserved.
//

#import "CLGameViewController.h"

@interface CLGameViewController () <UIAlertViewDelegate>

@end

@implementation CLGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//  Установка значений из хранилища в label's
    [self.scoreLabel setText:[NSString stringWithFormat:@"%li", (long)[CLGameManager shared].currentPoints]];
    [self.levelLabel setText:[NSString stringWithFormat:@"%li", (long)[CLGameManager shared].currentLevel]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
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
    [[CLGameManager shared]addPointsByClick];
    
    int width = self.view.frame.size.width;
    CLAnimatedLabel * testLabel = [[CLAnimatedLabel alloc] initWithFrame:CGRectMake((arc4random() % (width-80)), self.view.frame.size.height/2 - 35, 100, 70)];
    [testLabel setText:[NSString stringWithFormat:@"+%li", (long)[CLGameManager shared].currentPointsByClick]];
    [self.scoreLabel setText:[NSString stringWithFormat:@"%li", (long)[CLGameManager shared].currentPoints]];
    [self.view addSubview:testLabel];
    [testLabel setAnimation];
    
//  Запуск "наблюдателя" за изменениями уровня в игре
    [RACObserve([CLGameManager shared], currentLevel) subscribeNext:^(NSNumber* x){
        switch ([CLGameManager shared].currentLevel)
        {
            case 13:
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Final"
                                                                message:@"Вы прошли игру"
                                                               delegate:self
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"Начать заново", nil];
                [alert show];
            }
                break;
            default:
            {
                [self.clickButton setTitle:[NSString stringWithFormat:@"+%li", (long)[CLGameManager shared].currentPointsByClick] forState:UIControlStateNormal];
                [self.levelLabel setText:[NSString stringWithFormat:@"%li", (long)[CLGameManager shared].currentLevel]];
            }
                break;
        }
    }];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.cancelButtonIndex != buttonIndex)
    {
//      Сброс значений
        [[CLGameManager shared] clear];
        
        [self.clickButton setTitle:[NSString stringWithFormat:@"+%li", (long)[CLGameManager shared].currentPointsByClick] forState:UIControlStateNormal];
        [self.levelLabel setText:[NSString stringWithFormat:@"%li", (long)[CLGameManager shared].currentLevel]];
        [self.scoreLabel setText:[NSString stringWithFormat:@"%li", (long)[CLGameManager shared].currentPoints]];
    }
}

@end
