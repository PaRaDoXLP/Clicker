//
//  ViewController.m
//  Clicker
//
//  Created by PaRaDoX on 25.08.15.
//  Copyright (c) 2015 PaRaDoX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
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
    UILabel * testLabel = [[UILabel alloc] initWithFrame:CGRectMake((arc4random() % width), self.view.frame.size.height/2 - 25, 100, 50)];
    [testLabel setText:@"+20"];
    [self.view addSubview:testLabel];
    
    testLabel.alpha = 0.0;
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         testLabel.alpha = 1.0;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.0
                                               delay:1.0
                                             options: UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              testLabel.alpha = 0.0;
                                              
                                          }
                                          completion:^(BOOL finished){
                                              NSLog(@"Done!");
                                              [testLabel removeFromSuperview];
                                          }];
                     }];
}
@end
