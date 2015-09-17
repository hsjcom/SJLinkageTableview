//
//  ViewController.m
//  SJLinkageTableview
//
//  Created by Soldier on 15/9/16.
//  Copyright (c) 2015年 Shaojie Hong. All rights reserved.
//

#import "ViewController.h"

#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SJLinkageTableview";
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGRect viewBounds = self.view.bounds;
    float navBarHeight = self.navigationController.navigationBar.frame.size.height + 20;
    viewBounds.size.height = ([[UIScreen mainScreen] bounds].size.height) - navBarHeight;
    self.view.bounds = viewBounds;
    
    [self loadData];
    [self leftTableView];
    [self rightTableView];
    
    _isRelate = YES;
}

- (void)loadData {
    _dataArray = @[
                   @{@"title" : @"00",
                     @"list" : @[@"Soldier", @"aaa0", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa1", @"aaa"]
                     },
                   @{@"title" : @"01",
                     @"list" : @[@"Soldier", @"aaa1", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa1", @"aaa"]
                     },
                   @{@"title" : @"02",
                     @"list" : @[@"Soldier", @"aaa2", @"aaa"]
                     },
                   @{@"title" : @"03",
                     @"list" : @[@"Soldier", @"aaa3", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa1", @"aaa"]
                     },
                   @{@"title" : @"04",
                     @"list" : @[@"Soldier", @"aaa4", @"aaa"]
                     },
                   @{@"title" : @"05",
                     @"list" : @[@"Soldier", @"aaa5", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa1", @"aaa"]
                     },
                   @{@"title" : @"06",
                     @"list" : @[@"Soldier", @"aaa6", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa"]
                     },
                   @{@"title" : @"07",
                     @"list": @[@"Soldier", @"aaa7", @"aaa"]
                     },
                   @{@"title": @"08",
                     @"list": @[@"Soldier" ,@"aaa8", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa"]
                     },
                   @{@"title" : @"09",
                     @"list" : @[@"Soldier", @"aaa9", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa"]
                     },
                   @{@"title" : @"10",
                     @"list" : @[@"Soldier", @"aaa10", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa"]
                     },
                   @{@"title" : @"11",
                     @"list" : @[@"Soldier", @"aaa11", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa"]
                     },
                   @{@"title" : @"12",
                     @"list" : @[@"Soldier", @"aaa12", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa1", @"aaa"]
                     },
                   @{@"title" : @"13",
                     @"list" : @[@"Soldier", @"aaa13", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa1", @"aaa"]
                     },
                   @{@"title" : @"14",
                     @"list" : @[@"Soldier", @"aaa14", @"aaa", @"aaa", @"aaa1", @"aaa", @"aaa", @"aaa", @"aaa"]
                     },
                   @{@"title" : @"15",
                     @"list" : @[@"Soldier", @"aaa15", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa1", @"aaa"]
                     },
                   @{@"title" : @"16",
                     @"list" : @[@"Soldier", @"aaa16", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa", @"aaa"]
                     }
                   ];
}

- (UITableView *)leftTableView {
    if (nil == _leftTableView){
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, self.view.frame.size.height)];
        _leftTableView.backgroundColor = [UIColor whiteColor];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        [self.view addSubview:_leftTableView];
    }
    return _leftTableView;
}

- (UITableView *)rightTableView{
    if (nil == _rightTableView){
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(100, 0, self.view.frame.size.width - 100, self.view.frame.size.height)];
        _rightTableView.backgroundColor = [UIColor whiteColor];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        [self.view addSubview:_rightTableView];
    }
    return _rightTableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.leftTableView) {
        return 1;
    } else {
        return [_dataArray count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *item = [_dataArray objectAtIndex:section];
    if (tableView == self.leftTableView) {
        return [_dataArray count];
    } else {
        return [[item objectForKey:@"list"] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (tableView == self.leftTableView) {
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        selectedBackgroundView.backgroundColor = RGBACOLOR(217, 217, 217, 0.5);
        cell.selectedBackgroundView = selectedBackgroundView;
        
        UIView *liner = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 5, 60)];
        liner.backgroundColor = [UIColor orangeColor];
        [selectedBackgroundView addSubview:liner];
        
        cell.textLabel.text = [_dataArray[indexPath.row] objectForKey:@"title"];
        
    } else {
        NSDictionary *item = [_dataArray objectAtIndex:indexPath.section];
        cell.textLabel.text = [item objectForKey:@"list"][indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        return 60;
    } else {
        return 90;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
        return 0;
    } else {
        return 30;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
        return 0;
    } else {
        //重要,或者0.01
        return CGFLOAT_MIN;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView == self.rightTableView) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
        view.backgroundColor = RGBACOLOR(217, 217, 217, 0.7);
        
        UILabel *lable = [[UILabel alloc]initWithFrame:view.bounds];
        NSDictionary *item = [_dataArray objectAtIndex:section];
        NSString *title = [item objectForKey:@"title"];
        lable.text = [NSString stringWithFormat:@"   %@", title];
        [view addSubview:lable];
        
        return view;
        
    } else {
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (_isRelate) {
        NSInteger topCellSection = [[[tableView indexPathsForVisibleRows] firstObject] section];
        if (tableView == self.rightTableView) {
            [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:topCellSection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        }
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
    if (_isRelate) {
        NSInteger topCellSection = [[[tableView indexPathsForVisibleRows] firstObject] section];
        if (tableView == self.rightTableView) {
            [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:topCellSection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        _isRelate = NO;
        [self.leftTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        [self.rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    } else {
        [self.rightTableView deselectRowAtIndexPath:indexPath animated:NO];
        
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _isRelate = YES;
}


@end
