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
    }
    return self;
}

- (void) addPointsByClick
{
    switch (currentLevel)
    {
        case 1:
            currentPoints += LEVEL_1_CLICK_POINTS;
            if (currentPoints>=LEVEL_2_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_2_CLICK_POINTS;
            }
            break;
        case 2:
            currentPoints += LEVEL_2_CLICK_POINTS;
            if (currentPoints>=LEVEL_3_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_3_CLICK_POINTS;
            }
            break;
        case 3:
            currentPoints += LEVEL_3_CLICK_POINTS;
            if (currentPoints>=LEVEL_4_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_4_CLICK_POINTS;
            }
            break;
        case 4:
            currentPoints += LEVEL_4_CLICK_POINTS;
            if (currentPoints>=LEVEL_5_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_5_CLICK_POINTS;
            }
            break;
        case 5:
            currentPoints += LEVEL_5_CLICK_POINTS;
            if (currentPoints>=LEVEL_6_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_6_CLICK_POINTS;
            }
            break;
        case 6:
            currentPoints += LEVEL_6_CLICK_POINTS;
            if (currentPoints>=LEVEL_7_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_7_CLICK_POINTS;
            }
            break;
        case 7:
            currentPoints += LEVEL_7_CLICK_POINTS;
            if (currentPoints>=LEVEL_8_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_8_CLICK_POINTS;
            }
            break;
        case 8:
            currentPoints += LEVEL_8_CLICK_POINTS;
            if (currentPoints>=LEVEL_9_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_9_CLICK_POINTS;
            }
            break;
        case 9:
            currentPoints += LEVEL_9_CLICK_POINTS;
            if (currentPoints>=LEVEL_10_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_10_CLICK_POINTS;
            }
            break;
        case 10:
            currentPoints += LEVEL_10_CLICK_POINTS;
            if (currentPoints>=LEVEL_11_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_11_CLICK_POINTS;
            }
            break;
        case 11:
            currentPoints += LEVEL_11_CLICK_POINTS;
            if (currentPoints>=LEVEL_12_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_12_CLICK_POINTS;
            }
            break;
        case 12:
            currentPoints += LEVEL_12_CLICK_POINTS;
            if (currentPoints>=LEVEL_13_POINTS)
            {
                currentLevel+=1;
                currentPointsByClick = LEVEL_13_CLICK_POINTS;
            }
            break;
        case 13:
            currentPoints += LEVEL_13_CLICK_POINTS;
            if (currentPoints>=LEVEL_2_POINTS)
            {
                currentLevel+=1;
            }
            break;
    }
}

- (void)savePointsLevel
{
    lastTotalPoints = currentPoints;
    lastSavedLevel = currentLevel;
    
    [userDefaults setInteger:lastTotalPoints forKey:LAST_TOTAL_POINTS];
    [userDefaults setInteger:lastSavedLevel forKey:LAST_SAVED_LEVEL];
    [userDefaults synchronize];
}

- (void) clear
{
    currentLevel = 1;
    currentPoints = 0;
    
    [self savePointsLevel];
}


@end
