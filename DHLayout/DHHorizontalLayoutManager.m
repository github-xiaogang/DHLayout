//
//  HorizontalLayoutManager.m
//  Layout
//
//  Created by xiaogang zhang on 13-6-26.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//
#ifndef IS_FLOAT_ZERO
#define IS_FLOAT_ZERO(f) (ABS(f) <= FLT_EPSILON)
#endif
#import "DHHorizontalLayoutManager.h"

@implementation DHHorizontalLayoutManager
@synthesize enableAutoChangeLine = _enableAutoChangeLine;
@synthesize lineHeight = _lineHeight;

- (void) layout
{
    float xOffset = 0.0f;
    float yOffset = 0.0f;
    int currentLine = 0;
    BOOL isNewLine = NO;
    int validaCount = 0;  //有效subview个数

    
    xOffset += _paddingLeft;
    yOffset += _paddingTop;
    
    isNewLine = YES;
    for (int i=0; i<self.view.subviews.count; i++) {
        UIView * view = [self.view.subviews objectAtIndex:i];
        if(!view.shouldBeLayout) continue;
        validaCount ++;
        if(!isNewLine && (!IS_FLOAT_ZERO(_space) && IS_FLOAT_ZERO(view.marginLeft))){
            xOffset += _space;
        }else{
            xOffset += view.marginLeft;
        }
        view.left = xOffset;
        view.top = yOffset + view.marginTop;
        xOffset += view.width + view.marginRight;
        if(_enableAutoChangeLine){
            if(i < self.view.subviews.count-1){
                UIView * nextView = [self.view.subviews objectAtIndex:i+1];
                if(!nextView.shouldBeLayout) continue;
                float totalWidth = xOffset + ((!IS_FLOAT_ZERO(_space) && IS_FLOAT_ZERO(nextView.marginLeft)) ? _space : nextView.marginLeft)  + nextView.width + nextView.marginRight + _paddingRight;
                if(totalWidth > self.view.width){
                    currentLine ++;
                    yOffset += _lineHeight;
                    xOffset = _paddingLeft;
                    isNewLine = YES;
                }else{
                    isNewLine = NO;
                }
            }
        }else{
            isNewLine = NO;
        }
    }
    float realWidth = xOffset + _paddingRight;
    float realHeight = _paddingTop + (currentLine + 1) * _lineHeight + _paddingBottom;
    if(validaCount == 0){ //没有任何元素.
        realHeight = 0;
        realWidth = 0;
    }
    _contentSize.width = realWidth;
    _contentSize.height = realHeight;
    
    if(_enableAutoChangeLine) {
        self.view.height = realHeight;
    }
    else{
        self.view.width = realWidth;
    }
}


@end














