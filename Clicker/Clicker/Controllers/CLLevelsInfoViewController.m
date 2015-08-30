//
//  levelsDetailViewController.m
//  Clicker
//
//  Created by PaRaDoX on 26.08.15.
//  Copyright (c) 2015 PaRaDoX. All rights reserved.
//

#import "CLLevelsInfoViewController.h"

@interface CLLevelsInfoViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation CLLevelsInfoViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor clearColor];

    self.tableArray = [[NSMutableArray alloc]initWithContentsOfURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/PaRaDoXLP/Clicker/master/Clicker/Clicker/Resources/LevelsList.plist"]];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.tableArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dictionary = [self.tableArray objectAtIndex:section];
    return dictionary.allKeys.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName = [NSString stringWithFormat:@"Уровень %i", (section+1)];
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str;
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    [cell setUserInteractionEnabled:NO];//отключение отклика ячейки таблицы на касания
    
    NSDictionary *dictionaryOfArray = [self.tableArray objectAtIndex:indexPath.section];
    NSArray *keysArray = dictionaryOfArray.allKeys;
    switch (indexPath.row)
    {
        case 0:
            str = @"Кол-во очков для перехода на уровень";
            break;
        case 1:
            str = @"Кол-во очков за один клик";
    }
    //Настройка текстовой строки на перенос по словам
    NSMutableAttributedString *titleAttributedString;
    NSMutableParagraphStyle *titleParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    [titleParagraphStyle setLineSpacing:-5];
    titleAttributedString = [[NSMutableAttributedString alloc] initWithString:str];
    [titleAttributedString addAttribute:NSParagraphStyleAttributeName value:titleParagraphStyle range:NSMakeRange(0, [str length])];
    cell.textLabel.attributedText = titleAttributedString;
    [cell.textLabel setNumberOfLines:2];
    
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    
    cell.detailTextLabel.text = [dictionaryOfArray valueForKey:[keysArray objectAtIndex:indexPath.row]];
    cell.detailTextLabel.textAlignment = NSTextAlignmentRight;
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:17];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
