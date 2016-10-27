//
//  XYMLabel.m
//  healthcoming
//
//  Created by jack xu on 16/10/26.
//  Copyright © 2016年 Franky. All rights reserved.
//

#import "XYMLabel.h"

@implementation XYMLabel

- (instancetype)init {
    if (self = [super init]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}


@end
