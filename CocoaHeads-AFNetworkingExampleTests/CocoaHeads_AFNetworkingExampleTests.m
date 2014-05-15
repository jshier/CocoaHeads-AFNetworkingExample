//
//  CocoaHeads_AFNetworkingExampleTests.m
//  CocoaHeads-AFNetworkingExampleTests
//
//  Created by Jon Shier on 5/8/14.
//  Copyright (c) 2014 Jon Shier. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHHTTPStubsResponse+HTTPMessage.h>

#import "JRSCommunicator.h"

SPEC_BEGIN(SerializerTests)
describe(@"JRSSpaceDelimitedResponseSerializer", ^{
    __block NSArray *returnedArray;
    __block NSError *returnedError;
    __block JRSCommunicator *communicator;
    beforeAll(^{
        [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
            return YES;
        } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
            return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFileInBundle(@"test.txt", nil) statusCode:200 headers:@{@"Content-Type": @"text/plain"}];
        }];
        
        communicator = [[JRSCommunicator alloc] init];
        [communicator getTextWithCompletionHandler:^(NSError *error, NSArray *array) {
            returnedArray = array;
            returnedError = error;
        }];
    });
    
    afterAll(^{
        [OHHTTPStubs removeAllStubs];
    });
    
    it(@"should return successfully", ^{
        [[expectFutureValue(returnedArray) shouldEventually] beNonNil];
        [[expectFutureValue(returnedError) shouldEventually] beNil];
        
        [[expectFutureValue(returnedArray) shouldEventually] equal:@[@[@"one", @"two", @"three"], @[@"four", @"five", @"six"]]];
    });
});


SPEC_END
