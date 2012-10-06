//
//  ViewController4.h
//  Avalanche
//
//  Created by Christine Salah on 8/29/12.
//
//

#import <UIKit/UIKit.h>
#import "Store.h"

@interface ViewController4 : UIViewController{
    IBOutlet UISlider *diff;
    IBOutlet UILabel *difflabel;
    int diffint;
}

- (IBAction)diffslider:(id)sender;


@end
