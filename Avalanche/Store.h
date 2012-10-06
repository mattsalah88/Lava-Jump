//
//  Store.h
//  Avalanche
//
//  Created by Christine Salah on 8/30/12.
//
//

#import <UIKit/UIKit.h>

@interface Store : NSObject {

    NSNumber *diff;
}

@property (nonatomic, strong) NSNumber *diff;

+ (Store *) sharedStore;


@end
