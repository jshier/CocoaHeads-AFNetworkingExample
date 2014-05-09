//
//  JRSSpaceDelimitedResponseSerializer.m
//  Serializers
//
//  Created by Jon Shier on 5/8/14.
//  Copyright (c) 2014 Jon Shier. All rights reserved.
//

#import "JRSSpaceDelimitedResponseSerializer.h"

@implementation JRSSpaceDelimitedResponseSerializer

+ (instancetype)serializer
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"text/plain", nil];
    }
    
    return self;
}

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error
{
    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
        return nil;
    }
    
    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray *lines = [responseString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSMutableArray *decodedArrays = [NSMutableArray array];
    for (NSString *line in lines) {
        [decodedArrays addObject:[line componentsSeparatedByString:@" "]];
    }
    
    return [decodedArrays copy];
}

@end
