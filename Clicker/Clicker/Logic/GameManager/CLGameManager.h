//
//  CLGameManager.h
//  Clicker
//
//  Created by PaRaDoX on 27.08.15.
//  Copyright (c) 2015 PaRaDoX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLGameManager : NSObject

@property (nonatomic, strong) NSUserDefaults * userDefaults;

@property (nonatomic) NSInteger lastTotalPoints;
@property (nonatomic) NSInteger lastSavedLevel;

@property (nonatomic) NSInteger currentPoints;
@property (nonatomic) NSInteger currentLevel;

@property (nonatomic) NSInteger currentPointsByClick;

+ (instancetype)shared;

- (id) init;
- (void) addPointsByClick;
- (void)savePointsLevel;
- (void) clear;

@end
