//
//  ViewController2.h
//  Avalanche
//
//  Created by iD Student on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"

@interface ViewController2 : UIViewController <UIAccelerometerDelegate>
{
    UIImageView *melon;
    CGPoint delta;
    IBOutlet UIImageView *yellowblock;
    IBOutlet UIImageView *ground;
     IBOutlet UIImageView *ground2;
    IBOutlet UIImageView *blueblock;
    IBOutlet UIImageView *greenblock;
    IBOutlet UIImageView *lava;
    bool checkCollison;
    bool checkBlockb;
    bool checkBlockg;
    bool checkBlocky;
    int mainint;
    IBOutlet UILabel *score;
    NSTimer *randomMain;
    NSTimer *fall;
    NSTimer *rise;
    IBOutlet UILabel *gameover;
    IBOutlet UIButton *continuebutton;
    IBOutlet UIButton *jump;
    IBOutlet UIButton *menu;
    IBOutlet UILabel *scorefinallabel;
    IBOutlet UILabel *difflab;
    int finalscore;
    IBOutlet UILabel *scorelabel;
    NSMutableString *scorefinal;
    NSString *diffstr;
    int diff;
}

@property(nonatomic,retain)IBOutlet UIImageView *melon;
@property CGPoint delta;

@end
