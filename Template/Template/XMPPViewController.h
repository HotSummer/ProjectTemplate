//
//  XMPPViewController.h
//  Template
//
//  Created by summer.zhu on 19/6/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMPPViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate
>

- (void)showConnnectView;

- (void)showDisconnectView;

- (void)refreshFriendsList;

@end
