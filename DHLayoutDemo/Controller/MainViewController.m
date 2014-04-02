//
//  MainViewController.m
//  DHLayoutDemo
//
//  Created by 张小刚 on 13-11-25.
//  Copyright (c) 2013年 duohuo. All rights reserved.
//

#import "MainViewController.h"
#import "TableCell.h"
@interface MainViewController ()
{
    IBOutlet UITableView *_tableView;
    IBOutlet DHHorizontalLayoutView *_horizonLayout;
    IBOutlet UIView *_lineHeightLayout;
    IBOutlet UILabel *_lineHeightLabel;
    
    NSArray * _list;
}
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableCell class]) bundle:nil] forCellReuseIdentifier:TableCellId];
    // Do any additional setup after loading the view from its nib.
    _list = [@[
               @{
                   @"username" : @"user A",
                   @"pubdate" : @"1387445952",
                   @"des" : @"This id des, it may be very long ,long long long long long",
                   },
               @{
                   @"username" : @"user AA",
                   @"pubdate" : @"1387445952",
                   @"des" : @"This id des",
                   },
               @{
                   @"username" : @"user AAAA",
                   @"pubdate" : @"1387445952",
                   @"des" : @"This id des, it may be very long",
                   },
               @{
                   @"username" : @"user AAAAAAAAAAAA",
                   @"pubdate" : @"1387445952",
                   @"des" : @"This id des, it may be very long ,long long long long long long long long long long long long long long long long long",
                   },
               
               ] copy];
}

- (void)viewWillLayoutSubviews
{
    _horizonLayout.height += 1;
    [_horizonLayout layoutIfNeeded];
}

#pragma mark -----------------   tableview datasouce & delegate   ----------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _list.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TableCell heightForData:_list[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableCell * cell = [tableView dequeueReusableCellWithIdentifier:TableCellId];
    [cell setData:_list[indexPath.row]];
    return cell;
}

- (IBAction)enableChangeLineValueChanged:(UISwitch *)sender {
    if(sender.isOn){
        _horizonLayout.width = 285.0f;
        _lineHeightLayout.hidden = NO;
        [_horizonLayout setEnableAutoChangeLine:YES];
        _horizonLayout.height += 1;
        [_horizonLayout layoutIfNeeded];
    }else{
        _lineHeightLayout.hidden = YES;
        [_horizonLayout setEnableAutoChangeLine:NO];
        _horizonLayout.width += 1;
        [_horizonLayout layoutIfNeeded];
    }
}

- (IBAction)lineHeightStepperValueChanged:(UIStepper *)sender {
    _lineHeightLabel.text = [NSString stringWithFormat:@"%.f",sender.value];
    [_horizonLayout setLineHeight:sender.value];
    _horizonLayout.height += 1;
    [_horizonLayout layoutIfNeeded];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_list release];
    [_tableView release];
    [_horizonLayout release];
    [_lineHeightLayout release];
    [_lineHeightLabel release];
    [super dealloc];
}
- (void)viewDidUnload {
    [_tableView release];
    _tableView = nil;
    [_horizonLayout release];
    _horizonLayout = nil;
    [_lineHeightLayout release];
    _lineHeightLayout = nil;
    [_lineHeightLabel release];
    _lineHeightLabel = nil;
    [super viewDidUnload];
}
@end
