//
//  CellFriend.m
//  Template
//
//  Created by summer.zhu on 25/6/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "CellFriend.h"

@interface CellFriend ()

@property (weak, nonatomic) IBOutlet UILabel *lblFriendName;

@end

@implementation CellFriend

- (void)setFriendName:(NSString *)friendName{
    _friendName = friendName;
    _lblFriendName.text = _friendName;
}

@end
