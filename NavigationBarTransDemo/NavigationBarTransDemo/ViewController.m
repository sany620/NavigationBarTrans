//
//  ViewController.m
//  NavigationBarTransDemo
//
//  Created by apple on 2020/2/21.
//  Copyright © 2020 duanmu. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+Transparency.h"
#import "MacroDefine.h"
#define NAVBAR_CHANGE_POINT 50


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar dm_setBackgroundColor:[UIColor clearColor]];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.layer.shadowOpacity = 0.f;
    [self.navigationController.navigationBar dm_reset];
    [self addDefaultNavigationBarAttributes];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.navigationItem.title = @"XXXX";
    [self addChangeNavigationBarAttributes];
    [self.view addSubview:self.tableView];
}

- (void)addDefaultNavigationBarAttributes{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:UIColor.blackColor}];
}
- (void)addChangeNavigationBarAttributes{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:UIColor.blueColor}];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Cell--%ld",indexPath.row];
    return cell;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UIColor * color = UIColor.blueColor;
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + MANavBarHeight - offsetY) / MANavBarHeight));
        [self.navigationController.navigationBar dm_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
        self.navigationItem.title =@"YYYY";
        [self addDefaultNavigationBarAttributes];
    } else {
        [self.navigationController.navigationBar dm_setBackgroundColor:[color colorWithAlphaComponent:0]];
        self.navigationItem.title = @"XXXX";
        [self addChangeNavigationBarAttributes];
    }
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, MANavBarHeight, kScreenW,kScreenH-MANavBarHeight) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 80;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, CGFLOAT_MIN)];
        _tableView.backgroundColor = UIColor.clearColor;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 45, 0);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
