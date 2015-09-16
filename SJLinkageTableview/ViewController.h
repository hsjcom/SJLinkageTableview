//
//  ViewController.h
//  SJLinkageTableview
//
//  Created by Soldier on 15/9/16.
//  Copyright (c) 2015年 Shaojie Hong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    NSArray *_dataArray;
    BOOL _isRelate;
}

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;

@end

