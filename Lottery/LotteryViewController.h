//
//  LotteryViewController.h
//  Lottery
//
//  Created by jetspeed4 on 12-6-8.
//  Copyright 2012年 jetspeed4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenerateRandom.h"
#import <AVFoundation/AVFoundation.h>

@interface LotteryViewController : UIViewController<AVAudioPlayerDelegate> {
    IBOutlet UILabel *ball1;
    IBOutlet UILabel *ball2;
    IBOutlet UILabel *ball3;
    IBOutlet UILabel *ball4;
    IBOutlet UILabel *ball5;
    IBOutlet UILabel *ball6;
    
    AVAudioPlayer *player;
}


@property (nonatomic, retain)  IBOutlet UILabel *ball1;
@property (nonatomic, retain)  IBOutlet UILabel *ball2;
@property (nonatomic, retain)  IBOutlet UILabel *ball3;
@property (nonatomic, retain)  IBOutlet UILabel *ball4;
@property (nonatomic, retain)  IBOutlet UILabel *ball5;
@property (nonatomic, retain)  IBOutlet UILabel *ball6;

@property (nonatomic, retain) AVAudioPlayer *player;

@end
