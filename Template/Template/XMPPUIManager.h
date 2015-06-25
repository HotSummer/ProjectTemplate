//
//  XMPPUIManager.h
//  Template
//
//  Created by summer.zhu on 25/6/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Common/CommonDefine.h>
#import "XMPPViewController.h"

@interface XMPPUIManager : NSObject

@property(nonatomic, weak) XMPPViewController *xmppMainVC;

@property(nonatomic, strong) NSMutableArray *arrStates;

DECLARE_AS_SINGLETON(XMPPUIManager);

/**
 *  好友列表
 *
 *  @return 好友列表
 */
- (NSArray *)friends;

/**
 *  链接XMPP服务器
 */
- (void)connectXMPPServer;

/**
 *  断开XMPP服务器
 */
- (void)disconnectXMPPServer;

/**
 *  上线
 */
- (void)goOnLine;

/**
 *  下线
 */
- (void)goOffLine;

@end
