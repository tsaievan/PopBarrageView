//
//  ViewController.m
//  DEMOBarrageView
//
//  Created by tsaievan on 21/11/2018.
//  Copyright © 2018 tsaievan. All rights reserved.
//

#import "ViewController.h"
#import "TGBarrageTableView.h"
#import "TGBarrageTableViewCell.h"
#import "TGCZDAttenderModel.h"
#import <Masonry.h>

static CGFloat const _cellHeight = 32;

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) TGBarrageTableView *tableView;

@property (nonatomic, strong) NSMutableArray <TGCZDAttenderModel *> *dataArray;

@property (nonatomic, strong) NSMutableArray *mtArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(100);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(_cellHeight * 10);
    }];
    self.view.backgroundColor = [UIColor purpleColor];
    
    ///< 读取json数据
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"czd_top5_data.json" ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath options:kNilOptions error:nil];

    NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil][@"data"];
    
    NSMutableArray *mtArr = @[].mutableCopy;
    for (NSDictionary *dict  in dataArray) {
        TGCZDAttenderModel *model = [[TGCZDAttenderModel alloc] initWithDictionary:dict];
        [mtArr addObject:model];
    }
    self.dataArray = mtArr;
    NSMutableArray *mtArray = @[].mutableCopy;
    __block NSMutableArray *datas = self.dataArray;
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSDictionary *first = datas.firstObject;
        [mtArray addObject:first];
        [datas removeObjectAtIndex:0];
        [datas addObject:first];
        self.mtArray = mtArray;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.mtArray.count - 1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        for (UIView *view in self.tableView.subviews) {
            if ([view isKindOfClass:[UITableViewCell class]]) {
                UITableViewCell *cell = (UITableViewCell *)view;
                NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
                CGFloat alpha = (11 - (self.mtArray.count - indexPath.row))  * 0.1;
                cell.alpha = alpha;
            }
        }
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


- (TGBarrageTableView *)tableView {
    if (!_tableView) {
        _tableView = [[TGBarrageTableView alloc] init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.scrollEnabled = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.center = self.view.center;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(_cellHeight * 9, 0, 0, 0);
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mtArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TGBarrageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[TGBarrageTableViewCell alloc] init];
    }
    cell.attendModel = self.mtArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cellHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CGPoint animationPoint = CGPointMake(0, 0);
    CGFloat offsetX = animationPoint.x - cell.frame.size.width / 2;
    CGFloat offsetY = animationPoint.y - cell.frame.size.height / 2;
    cell.contentView.transform = CGAffineTransformMake(0.01, 0, 0, 0.01, offsetX, offsetY);
    [UIView animateWithDuration:.5f animations:^{
        cell.contentView.transform = CGAffineTransformMake(1.05f, 0, 0, 1.0f, 0, 0);
    } completion:^(BOOL finished) {
    }];
}

@end
