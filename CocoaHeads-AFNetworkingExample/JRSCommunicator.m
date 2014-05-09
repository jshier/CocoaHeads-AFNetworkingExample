//
//  JRSCommunicator.m
//  Serializers
//
//  Created by Jon Shier on 5/8/14.
//  Copyright (c) 2014 Jon Shier. All rights reserved.
//

#import "JRSCommunicator.h"
#import "JRSSpaceDelimitedResponseSerializer.h"

@implementation JRSCommunicator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.responseSerializer = [JRSSpaceDelimitedResponseSerializer serializer];
    }
    
    return self;
}

- (AFHTTPRequestOperation *)getTextWithCompletionHandler:(void (^)(NSError *, NSArray *))completionHandler
{
    return [self GET:@"http://jonshier.apiary-mock.com/test" parameters:nil
             success:^(AFHTTPRequestOperation *operation, NSArray *array) {
                 NSLog(@"Succeeded.");
                 if (completionHandler) {
                     completionHandler(nil, array);
                 }
             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Failed.");
                 if (completionHandler) {
                     completionHandler(error, nil);
                 }
             }];
}

@end
