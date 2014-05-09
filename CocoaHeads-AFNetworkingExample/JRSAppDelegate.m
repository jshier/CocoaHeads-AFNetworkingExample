//
//  JRSAppDelegate.m
//  Serializers
//
//  Created by Jon Shier on 5/8/14.
//  Copyright (c) 2014 Jon Shier. All rights reserved.
//

#import "JRSAppDelegate.h"
#import "JRSCommunicator.h"
#import "JRSSpaceDelimitedResponseSerializer.h"

@implementation JRSAppDelegate

- (IBAction)makeRequestButtonPressed:(NSButton *)sender
{
    JRSCommunicator *communicator = [[JRSCommunicator alloc] init];
    [communicator getTextWithCompletionHandler:^(NSError *error, NSArray *array) {
        if (error) {
            NSLog(@"%@", error);
        }
        else {
            NSLog(@"%@", array);
        }
    }];
}

@end
