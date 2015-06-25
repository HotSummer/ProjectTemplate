//
//  XMPPViewController.m
//  Template
//
//  Created by summer.zhu on 19/6/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "XMPPViewController.h"
#import <Common/FriendModel.h>
#import "XMPPUIManager.h"
#import "CellFriend.h"
#import "CellState.h"

@interface XMPPViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnConnect;
@property (weak, nonatomic) IBOutlet UIButton *btnDisconnect;
@property (weak, nonatomic) IBOutlet UILabel *lblConnectState;
@property (weak, nonatomic) IBOutlet UITableView *tableState;
@property (weak, nonatomic) IBOutlet UITableView *tableFriends;

- (IBAction)didPressedBtnConnect:(id)sender;
- (IBAction)didPressedBtnDisconnect:(id)sender;

@end

@implementation XMPPViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [XMPPUIManager shareInstance].xmppMainVC = self;
    
    _btnConnect.enabled = YES;
    _btnDisconnect.enabled = NO;
    _lblConnectState.hidden = YES;
    _tableState.hidden = YES;
    _tableFriends.hidden = YES;
}

- (IBAction)didPressedBtnConnect:(id)sender {
    [[XMPPUIManager shareInstance] connectXMPPServer];
}

- (IBAction)didPressedBtnDisconnect:(id)sender {
    [[XMPPUIManager shareInstance] disconnectXMPPServer];
}

- (void)showConnnectView{
    _btnConnect.enabled = NO;
    _btnDisconnect.enabled = YES;
    _lblConnectState.hidden = NO;
    _tableState.hidden = NO;
    _tableFriends.hidden = NO;
    [_tableFriends reloadData];
}

- (void)showDisconnectView{
    _btnConnect.enabled = YES;
    _btnDisconnect.enabled = NO;
    _lblConnectState.hidden = YES;
    _tableState.hidden = YES;
    _tableFriends.hidden = YES;
}

- (void)refreshFriendsList{
    [_tableFriends reloadData];
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _tableState) {
        return [XMPPUIManager shareInstance].arrStates.count;
    }else{
        return [[XMPPUIManager shareInstance] friends].count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _tableState) {
        static NSString *cellIndentifier = @"CellStateIndentifier";
        CellState *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        cell.stateName = [XMPPUIManager shareInstance].arrStates[indexPath.row];
        return cell;
    }else{
        static NSString *cellIndentifier = @"CellFriendIndentifier";
        CellFriend *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        FriendModel *friend = (FriendModel *)([[XMPPUIManager shareInstance] friends][indexPath.row]);
        cell.friendName = friend.name;
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _tableState) {
        if (indexPath.row == 0) {
            [[XMPPUIManager shareInstance] goOnLine];
        }else{
            [[XMPPUIManager shareInstance] goOffLine];
        }
    }
}

@end
