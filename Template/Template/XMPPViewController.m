//
//  XMPPViewController.m
//  Template
//
//  Created by summer.zhu on 19/6/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "XMPPViewController.h"
#import <Common/XMPPHelper.h>
#import <Common/XMPPStream.h>

@interface XMPPViewController ()

- (IBAction)didPressedBtnConnect:(id)sender;

@end

@implementation XMPPViewController

- (IBAction)didPressedBtnConnect:(id)sender {
    [[XMPPHelper shareInstance] setupStream];
    [[XMPPHelper shareInstance] connect:@"nxjwalqyh@win-p3hh36c8kuq/XMPPIOS" password:@"123456" willConnect:^(NSString *errorDescription, XMPPStream *xmppStream) {
        NSLog(@"%@", xmppStream);
    } didConnect:^(NSString *errorDescription, XMPPStream *xmppStream) {
        if (errorDescription.length > 0) {
            NSLog(@"%@", errorDescription);
        }
    } didAuthenticate:^(NSString *errorDescription, XMPPStream *xmppStream) {
        if (errorDescription.length > 0) {
            NSLog(@"%@", errorDescription);
        }
    }];
}
@end
