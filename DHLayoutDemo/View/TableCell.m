//
//  TableCell.m
//  DHLayoutDemo
//
//  Created by 张小刚 on 13-11-25.
//  Copyright (c) 2013年 duohuo. All rights reserved.
//

#import "TableCell.h"
NSString * const TableCellId = @"TableCellId";

@interface TableCell()
{
    IBOutlet DHVerticalLayoutView *_verticalLayout;
    IBOutlet DHHorizontalLayoutView *_horizonLayout;
    IBOutlet UILabel *_usernameLabel;
    IBOutlet UILabel *_dateLabel;
    IBOutlet UILabel *_desLabel;
}
@end

@implementation TableCell


- (void)setData: (NSDictionary *)data
{
    /*
     username
     pubdate
     des
     */
    _usernameLabel.text = data[@"username"];
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[data[@"pubdate"] doubleValue]];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _dateLabel.text = [formatter stringFromDate:date];
    [formatter release];
    [_usernameLabel sizeToFit];
    [_dateLabel sizeToFit];
    _horizonLayout.width += 1;
    [_horizonLayout layoutIfNeeded];
    _desLabel.text = data[@"des"];
    CGSize bestSize  = [_desLabel sizeThatFits:CGSizeMake(240.0f, 0)];
    _desLabel.size = bestSize;
    _verticalLayout.height += 1;
    [_verticalLayout layoutIfNeeded];
    self.height = _verticalLayout.height;
}

+ (CGFloat)heightForData : (NSDictionary *)data
{
    static TableCell * cell = nil;
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0] retain];
    }
    [cell setData:data];
    return cell.height;
}

- (void)dealloc {
    [_verticalLayout release];
    [_horizonLayout release];
    [_usernameLabel release];
    [_dateLabel release];
    [_desLabel release];
    [super dealloc];
}
@end






