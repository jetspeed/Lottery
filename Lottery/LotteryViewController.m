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
@synthesize blueBall;

@synthesize player;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - Play Sound
- (void) playBackgroundSoundEffect {
    NSString *soundFilePath = 
    [[NSBundle mainBundle] pathForResource: @"shake" 
                                    ofType: @"wav"]; 
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath]; 
    AVAudioPlayer *p = 
    [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL
                                           error: nil];
    self.player = p;
    [self.player prepareToPlay];
    
    [self.player setDelegate: self];
    //self.player.numberOfLoops = -1;    // Loop playback until invoke stop method    
    [self.player play];
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self playBackgroundSoundEffect];
        sleep(8);
        GenerateRandom *r = [[GenerateRandom alloc] init];
        NSMutableArray *result = [r generateRed];

        [ball1 setText:[[result objectAtIndex:0] stringValue]];
        [ball2 setText:[[result objectAtIndex:1] stringValue]];
        
        [ball3 setText:[[result objectAtIndex:2] stringValue]];
        [ball4 setText:[[result objectAtIndex:3] stringValue]];
        
        [ball5 setText:[[result objectAtIndex:4] stringValue]];
        [ball6 setText:[[result objectAtIndex:5] stringValue]];
        
        [blueBall setText:[NSString stringWithFormat:@"%d", [r generateBlue]]];
    }
}



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // 在屏幕底部创建标准尺寸的视图。
    bannerView_ = [[GADBannerView alloc]
                   initWithFrame:CGRectMake(0.0,
                                            self.view.frame.size.height -
                                            GAD_SIZE_320x50.height,
                                            GAD_SIZE_320x50.width,
                                            GAD_SIZE_320x50.height)];
    
    // 指定广告的“单元标识符”，也就是您的 AdMob 发布商 ID。
    bannerView_.adUnitID = @"a14fd4c5a357653";
    
    // 告知运行时文件，在将用户转至广告的展示位置之后恢复哪个 UIViewController 
    // 并将其添加至视图层级结构。
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];
    
    // 启动一般性请求并在其中加载广告。
    [bannerView_ loadRequest:[GADRequest request]];

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
