//
//  ViewController.m
//  test_summary
//
//  Created by hc on 2017/1/19.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end
static NSString *cellId = @"Cell";
@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];

    [self.view addSubview:_tableView];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(next:)];
    
    [self setStatusBarColor:[UIColor whiteColor]];
}


- (void)next:(id)sender {
    AViewController *AVC = [[AViewController alloc] init];
    [self.navigationController pushViewController:AVC animated:YES];
}
//- (UITableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
//    }
//    return _tableView;
//}

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



#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%f",offsetY);
    
//    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (offsetY>44 * 5 && offsetY < 44 * 10) {
        
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
        
        
        [self setStatusBarColor:[UIColor whiteColor]];
        
        self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        [self.navigationController.navigationBar setTranslucent:NO];
    } else if (offsetY > 44 * 10) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.navigationController.navigationBar.barTintColor = [UIColor brownColor];
        [self setStatusBarColor:[UIColor brownColor]];
    
        
        NSLog(@".......");
    } else {
//        self.extendedLayoutIncludesOpaqueBars = YES;
        self.navigationController.navigationBar.translucent = NO;  //去除毛玻璃效果
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        
        [self setStatusBarColor:[UIColor whiteColor]];
    }
}


- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
    return UIStatusBarStyleDefault;
}


- (void)setStatusBarColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}



@end
