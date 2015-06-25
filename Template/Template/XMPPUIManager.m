//
//  XMPPUIManager.m
//  Template
//
//  Created by summer.zhu on 25/6/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "XMPPUIManager.h"
#import <Common/XMPPHelper.h>
#import <Common/XMPPStream.h>

@implementation XMPPUIManager

DEFINE_SINGLETON(XMPPUIManager);

- (id)init{
    if (self = [super init]) {
        _arrStates = [NSMutableArray arrayWithObjects:@"在线", @"离线", nil];
    }
    return self;
}

- (NSArray *)friends{
    return [XMPPHelper shareInstance].friends;
}

- (void)connectXMPPServer{
    [[XMPPHelper shareInstance] setupStream];
    __weak XMPPUIManager *wSelf = self;
    [[XMPPHelper shareInstance] connect:@"nxjwalqyh@win-p3hh36c8kuq/XMPPIOS" password:@"123456" willConnect:^(NSString *errorDescription, XMPPStream *xmppStream) {
        NSLog(@"%@", xmppStream);
    } didConnect:^(NSString *errorDescription, XMPPStream *xmppStream) {
        if (errorDescription.length > 0) {
            NSLog(@"%@", errorDescription);
        }
    } didAuthenticate:^(NSString *errorDescription, XMPPStream *xmppStream) {
        if (errorDescription.length > 0) {
            NSLog(@"%@", errorDescription);
        }else{
            [wSelf.xmppMainVC showConnnectView];
        }
    } receiveIQ:^(NSString *errorDescription, XMPPStream *xmppStream) {
        [wSelf.xmppMainVC refreshFriendsList];
    }];
}

- (void)disconnectXMPPServer{
    [[XMPPHelper shareInstance] teardownStream];
    [_xmppMainVC showDisconnectView];
}

- (void)goOnLine{
    [[XMPPHelper shareInstance] goOnline];
}

- (void)goOffLine{
    [[XMPPHelper shareInstance] goOffline];
}

@end
