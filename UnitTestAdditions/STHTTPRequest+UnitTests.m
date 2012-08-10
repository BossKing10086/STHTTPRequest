//
//  STHTTPRequest+UnitTests.m
//
//  Created by Nicolas Seriot on 8/8/12.
//
//

#import "STHTTPRequest+UnitTests.h"
#import "STHTTPRequestTestResponse.h"
#import "STHTTPRequestTestResponseQueue.h"

@implementation STHTTPRequest (UnitTests)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)startAsynchronous {

    STHTTPRequestTestResponse *tr = [[STHTTPRequestTestResponseQueue sharedInstance] dequeue];
    
    NSAssert(tr.block != nil, @"block needed");

    tr.block(self);
}

- (NSString *)startSynchronousWithError:(NSError **)error {

    NSAssert(self.completionBlock != nil, @"completion block is nil");
    NSAssert(self.errorBlock != nil, @"error block is nil");
    
    STHTTPRequestTestResponse *tr = [[STHTTPRequestTestResponseQueue sharedInstance] dequeue];

    tr.block(self);
    
    *error = nil;// TODO: set error
    return [self responseString];
}

#pragma clang diagnostic pop

@end
