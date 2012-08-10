//
//  STHTTPRequestDemoTests.m
//  STHTTPRequestDemoTests
//
//  Created by Nicolas Seriot on 8/10/12.
//  Copyright (c) 2012 Nicolas Seriot. All rights reserved.
//

#import "STHTTPRequestDemoTests.h"

#import "STHTTPRequest.h"

#import "STHTTPRequestTestResponse.h"
#import "STHTTPRequestTestResponseQueue.h"

#import "STHTTPRequest+UnitTests.h"

@implementation STHTTPRequestDemoTests

- (void)setUp {
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown {
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample {
    
    STHTTPRequestTestResponseQueue *queue = [STHTTPRequestTestResponseQueue sharedInstance];

    STHTTPRequestTestResponse *tr = [STHTTPRequestTestResponse testResponseWithBlock:^(STHTTPRequest *r){
        r.responseStatus = 200;
    }];
    
    [queue enqueue:tr];
    
    STHTTPRequest *r = [STHTTPRequest requestWithURLString:@"http://www.google.com"];

    [r startAsynchronous]; // will actually get executed sychronously for tests

    STAssertEquals(r.responseStatus, 200, @"bad response status");
    
    [queue release];
}

@end
