//
//  GenerateRandom.m
//  Lottery
//
//  Created by jetspeed4 on 12-6-9.
//  Copyright 2012年 jetspeed4. All rights reserved.
//

#import "GenerateRandom.h"

@implementation GenerateRandom

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSMutableArray*) generate
{
    int container[33];
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:6];
    
    for (int i = 1; i <= 33; i++) {
        container[i - 1] = i;
    }
    
    int r;
    int value;
    for (int j = 0; j < 6; j++) {
        r = arc4random_uniform(33 - j);
        value = container[r];
        [result addObject:[NSNumber numberWithInt:value]];
        container[r] = container[33 - j - 1];
        container[33 - j - 1] = value;
    }
    return result;
}

@end
