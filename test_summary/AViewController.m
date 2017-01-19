//
//  AViewController.m
//  test_summary
//
//  Created by hc on 2017/1/19.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end
static NSString *cellId = @"Cell";
@implementation AViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     [self setStatusBarColor:[UIColor whiteColor]];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self setStatusBarColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    [self.view addSubview:_tableView];

    
    
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self setStatusBarColor:[UIColor whiteColor]];
}

- (void)setStatusBarColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

#pragma mark UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 99;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"0%ld",indexPath.row + 1]];
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%f",offsetY);
    if (offsetY > 3000) {
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        
    } else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
         [self setStatusBarColor:[UIColor whiteColor]];
    }
    
}



@end
