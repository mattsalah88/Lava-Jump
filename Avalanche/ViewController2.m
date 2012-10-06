//
//  ViewController2.m
//  Avalanche
//
//  Created by iD Student on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

@synthesize melon, delta;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
    accel.delegate = self;
    accel.updateInterval = 1.0f/60.0f;
    continuebutton.hidden = YES;
    gameover.hidden = YES;
    menu.hidden = YES;
    scorefinallabel.hidden = YES;
    scorelabel.hidden = YES;
    checkCollison = YES;
    checkBlockg = YES;
    checkBlockb = YES;
    checkBlocky = YES;
    

    diff = 0.1;
    
	mainint = 0;
    randomMain = [NSTimer scheduledTimerWithTimeInterval:(1.0/1.0) target:self selector:@selector(randomMainVoid) userInfo: nil repeats:(YES)];
    fall = [NSTimer scheduledTimerWithTimeInterval:(1.0/(50 + (diff*20))) target:self selector:@selector(blockFall) userInfo: nil repeats:(YES)];
    rise = [NSTimer scheduledTimerWithTimeInterval:(1.0/(diff+2.5)) target:self selector:@selector(lavaRise) userInfo: nil repeats:(YES)];
    difflab.text= [NSString stringWithFormat:@"%d",diff];
}

- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    
    NSLog(@"x : %g", acceleration.x);
    NSLog(@"y : %g", acceleration.y);
    NSLog(@"z : %g", acceleration.z);
    
    delta.x = acceleration.x*10;
    
    melon.center = CGPointMake(melon.center.x + delta.x, melon.center.y);
    
    if (melon.center.x < 0) {
       melon.center = CGPointMake(320, melon.center.y);
    }
    if (melon.center.x > 320) {
        melon.center = CGPointMake(0, melon.center.y);
    }
}

- (void) randomMainVoid {
    mainint++;
    score.text = [NSString stringWithFormat:@"%d", mainint];
    diff++;
}

- (void) blockFall {
    
    if (checkCollison) {
        blueblock.center = CGPointMake(blueblock.center.x, blueblock.center.y + 1);
    }
    if (blueblock.center.y > 390) {
        blueblock.center = CGPointMake(blueblock.center.x, 392);
        checkBlockb = NO;
    }
    if (CGRectIntersectsRect(blueblock.frame, yellowblock.frame)){
        checkCollison=NO;
    }
    
    if (checkCollison) {
        yellowblock.center = CGPointMake(yellowblock.center.x, yellowblock.center.y + 1);
    }
    if (yellowblock.center.y > 400) {
        yellowblock.center = CGPointMake(yellowblock.center.x, 402);
        checkBlocky = NO;
        
    }
    if (CGRectIntersectsRect(blueblock.frame, greenblock.frame)){
        checkCollison=NO;
    }
    
    if (checkCollison) {
        greenblock.center = CGPointMake(greenblock.center.x, greenblock.center.y + 1);
    }
    if (greenblock.center.y > 393) {
        greenblock.center = CGPointMake(greenblock.center.x, 395);
        checkBlockg = NO;
        
    }
    if (CGRectIntersectsRect(greenblock.frame, yellowblock.frame)){
        checkCollison=NO;
    }
    
    
    if (checkBlockb) {
        
        if (CGRectIntersectsRect(melon.frame, blueblock.frame)){
            [self collision];
            
        }
    }
    //blue
    if (checkBlocky) {
        
        if (CGRectIntersectsRect(melon.frame, yellowblock.frame)){
            [self collision];
            
        }
    }
    //yellow
    if (checkBlockg) {
        
        if (CGRectIntersectsRect(melon.frame, greenblock.frame)){
            [self collision];
            
        }
    }
    //green
}

- (void) lavaRise {
    lava.center = CGPointMake(lava.center.x, lava.center.y - 1);
    if (CGRectIntersectsRect(lava.frame, melon.frame)){
        [self collision];
    }
}

- (IBAction)jumpButtonClicked:(id)sender {
    [UIView animateWithDuration:0.6f animations:^{
        CGRect currentRect=self.melon.frame;
        currentRect.origin.y-=100;
        
        [self.melon setFrame:currentRect];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.6f animations:^{
            CGRect currentRect=self.melon.frame;
            
            currentRect.origin.y+=100;
            
            [self.melon setFrame:currentRect];
            
        }];
    }];
}

- (void) collision {
    
    [randomMain invalidate];
    scorefinal = [NSMutableString stringWithFormat: @"%d", mainint];
    scorefinallabel.text = scorefinal;
    gameover.text = @"Game Over";
    gameover.hidden = NO;
    continuebutton.hidden = NO;
    menu.hidden = NO;
    scorelabel.hidden = NO;
    score.hidden = YES;
    scorefinallabel.hidden = NO;
    melon.hidden = YES;
    blueblock.hidden = YES;
    ground.hidden = YES;
    ground2.hidden = YES;
    yellowblock.hidden = YES;
    greenblock.hidden = YES;
    lava.hidden = YES;
    jump.hidden = YES;
    [self.view setBackgroundColor:[UIColor brownColor]];
    checkCollison = NO;
    
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
