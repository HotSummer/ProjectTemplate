//
//  CellState.m
//  Template
//
//  Created by summer.zhu on 25/6/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "CellState.h"

@interface CellState ()

@property (weak, nonatomic) IBOutlet UILabel *lblStateName;

@end

@implementation CellState

- (void)setStateName:(NSString *)stateName{
    _stateName = stateName;
    
    _lblStateName.text = _stateName;
}

@end
