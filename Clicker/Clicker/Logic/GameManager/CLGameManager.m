//
//  CLGameManager.m
//  Clicker
//
//  Created by PaRaDoX on 27.08.15.
//  Copyright (c) 2015 PaRaDoX. All rights reserved.
//

#import "CLGameManager.h"
#import "CLGameConstants.h"

static NSString* const LAST_TOTAL_POINTS = @"lastTotalPoints";
static NSString* const LAST_SAVED_LEVEL  = @"lastSavedLevel";
static NSString* const LAST_POINTS_BY_CLICK  = @"lastPointsByClick";

@implementation CLGameManager

@synthesize userDefaults;
@synthesize lastTotalPoints, lastSavedLevel;
@synthesize currentPoints, currentLevel, currentPointsByClick;
@synthesize levelsArray;

+ (id)shared
{
    static CLGameManager *sharedInstance;
    static dispatch_once_t done;
    dispatch_once(&done, ^
                  {
                      sharedInstance = [[CLGameManager alloc] init];
                  });
    return sharedInstance;
}

- (id)init
{
    if (self = [super init])
    {
        userDefaults = [NSUserDefaults standardUserDefaults];
        if ([userDefaults integerForKey:LAST_TOTAL_POINTS])
        {
            lastTotalPoints = [userDefaults integerForKey:LAST_TOTAL_POINTS];
            lastSavedLevel = [userDefaults integerForKey:LAST_SAVED_LEVEL];
            currentPointsByClick = [userDefaults integerForKey:LAST_POINTS_BY_CLICK];
            currentLevel = lastSavedLevel;
            currentPoints = lastTotalPoints;
        }
        else
        {
            lastTotalPoints = currentPoints = 0;
            lastSavedLevel = currentLevel = 1;
            currentPointsByClick = LEVEL_1_CLICK_POINTS;
        }
       self.levelsArray = @[
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_2_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_1_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_2_CLICK_POINTS]},
  
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_3_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_2_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_3_CLICK_POINTS]},
  
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_4_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_3_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_4_CLICK_POINTS]},
  
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_5_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_4_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_5_CLICK_POINTS]},
  
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_6_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_5_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_6_CLICK_POINTS]},
  
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_7_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_6_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_7_CLICK_POINTS]},
  
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_8_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_7_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_8_CLICK_POINTS]},
  
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_9_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_8_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_9_CLICK_POINTS]},
  
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_10_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_9_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_10_CLICK_POINTS]},
  
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_11_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_10_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_11_CLICK_POINTS]},
  
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_12_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_11_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_12_CLICK_POINTS]},
  
                            @{@"pointsToNextLevel": [NSNumber numberWithInteger:LEVEL_13_POINTS],
                              @"currentLevelPoints": [NSNumber numberWithInteger:LEVEL_12_CLICK_POINTS],
                              @"nextLevelPoints": [NSNumber numberWithInteger:LEVEL_13_CLICK_POINTS]},
                            ];
    }
    return self;
}
// Процедура начисления поинтов
- (void) addPointsByClick
{
    NSDictionary *dictionary = [self.levelsArray objectAtIndex:(currentLevel-1)];
    NSNumber* pointsToNextLevel = [dictionary valueForKey:@"pointsToNextLevel"];
    NSNumber* points = [dictionary valueForKey:@"currentLevelPoints"];
    NSNumber* nextPoints = [dictionary valueForKey:@"nextLevelPoints"];
    currentPoints +=points.intValue;
    if (currentPoints>=pointsToNextLevel.intValue)
    {
        currentLevel+=1;
        currentPointsByClick = nextPoints.intValue;
    }
}
// Процедрура созранения данных по игре в NSUserDefaults
- (void)savePointsLevel
{
    lastTotalPoints = currentPoints;
    lastSavedLevel = currentLevel;
    
    [userDefaults setInteger:lastTotalPoints forKey:LAST_TOTAL_POINTS];
    [userDefaults setInteger:lastSavedLevel forKey:LAST_SAVED_LEVEL];
    [userDefaults setInteger:currentPointsByClick forKey:LAST_POINTS_BY_CLICK];
    [userDefaults synchronize];
}
// Сброс данных  в начальное значение
- (void) clear
{
    currentLevel = 1;
    currentPoints = 0;
    currentPointsByClick = 1;
    
    [self savePointsLevel];
}


@end
