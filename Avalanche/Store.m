//
//  Store.m
//  Avalanche
//
//  Created by Christine Salah on 8/30/12.
//
//

#import "Store.h"

@interface Store ()

@end

@implementation Store
@synthesize diff;

static Store *sharedStore = nil;

// Store* myStore = [Store sharedStore];
+ (Store*) sharedStore {
    @synchronized (self) {
        if (sharedStore == nil) {
            sharedStore = [[self alloc] init];
        }
    }
    
    return sharedStore;
}

@end
