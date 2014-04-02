//
//  DHHorizontalLayoutView.m
//  IvoryerTeam
//
//  Created by 张 小刚 on 13-7-26.
//  Copyright (c) 2013年 duohuo. All rights reserved.
//

#import "DHHorizontalLayoutView.h"
#import "DHHorizontalLayoutManager.h"
@interface DHHorizontalLayoutView ()

@end

@implementation DHHorizontalLayoutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //setup vertical layout manager
        [self setupLayoutManager];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    //setup vertical layout manager
    [self setupLayoutManager];
}

- (void)setupLayoutManager
{
    DHHorizontalLayoutManager * layoutManager = [[DHHorizontalLayoutManager alloc] init];
    layoutManager.enableAutoChangeLine = _enableAutoChangeLine;
    layoutManager.lineHeight = _lineHeight;
    layoutManager.space = _space;
    [self setLayoutManager:layoutManager];
    [layoutManager release];
}

- (void)setLineHeight:(float)lineHeight
{
    _lineHeight = lineHeight;
    [(DHHorizontalLayoutManager *)_layoutManager setLineHeight:_lineHeight];
}

- (void)setEnableAutoChangeLine:(BOOL)enableAutoChangeLine
{
    _enableAutoChangeLine = enableAutoChangeLine;
    [(DHHorizontalLayoutManager *)_layoutManager setEnableAutoChangeLine:_enableAutoChangeLine];
}

- (void)setSpace:(float)space
{
    _space = space;
    [(DHHorizontalLayoutManager *)_layoutManager setSpace:_space];
}

@end


















