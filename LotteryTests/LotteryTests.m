//
//  LotteryTests.m
//  LotteryTests
//
//  Created by jetspeed4 on 12-6-8.
//  Copyright 2012年 jetspeed4. All rights reserved.
//

#import "LotteryTests.h"
#import "GenerateRandom.h"

@implementation LotteryTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    //STFail(@"Unit tests are not implemented yet in LotteryTests");
}

- (void) testGenerateRandom
{
    GenerateRandom *r = [[GenerateRandom alloc] init];
    NSMutableArray *result = [r generate];
    
    for (int i = 0; i < 6; i++) {
        NSLog(@"result %@", [result objectAtIndex:i]);
    }
}

@end
