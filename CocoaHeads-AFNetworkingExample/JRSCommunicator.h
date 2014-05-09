//
//  JRSCommunicator.h
//  Serializers
//
//  Created by Jon Shier on 5/8/14.
//  Copyright (c) 2014 Jon Shier. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface JRSCommunicator : AFHTTPRequestOperationManager

- (AFHTTPRequestOperation *)getTextWithCompletionHandler:(void (^)(NSError *error, NSArray *array))completionHandler;

@end
