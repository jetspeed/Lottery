//
//  LotteryViewController.m
//  Lottery
//
//  Created by jetspeed4 on 12-6-8.
//  Copyright 2012年 jetspeed4. All rights reserved.
//

#import "LotteryViewController.h"

@implementation LotteryViewController
@synthesize ball1;
@synthesize ball2;
@synthesize ball3;
@synthesize ball4;
@synthesize ball5;
@synthesize ball6;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        GenerateRandom *r = [[GenerateRandom alloc] init];
        NSMutableArray *result = [r generate];

        [ball1 setText:[[result objectAtIndex:0] stringValue]];
        [ball2 setText:[[result objectAtIndex:1] stringValue]];
        
        [ball3 setText:[[result objectAtIndex:2] stringValue]];
        [ball4 setText:[[result objectAtIndex:3] stringValue]];
        
        [ball5 setText:[[result objectAtIndex:4] stringValue]];
        [ball6 setText:[[result objectAtIndex:5] stringValue]];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self resignFirstResponder];
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
