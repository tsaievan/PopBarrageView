//
//  TGBarrageCell.m
//  TGBarrageViewDemo
//
//  Created by tsaievan on 21/10/2018.
//  Copyright © 2018 tsaievan. All rights reserved.
//

#import "TGBarrageTableViewCell.h"
#import "TGCZDMacro.h"
#import "TGBarrageCell.h"
#import "UIView+Extensions.h"
#import <Masonry.h>

@interface TGBarrageTableViewCell () <TGBarrageCellDelegate>

@property (nonatomic, strong) TGBarrageCell *contentCell;

@end

@implementation TGBarrageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = UIColor.clearColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.contentCell];
    [self makeConstraints];
}

- (void)makeConstraints {
    [self.contentCell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.centerY.mas_equalTo(self.contentView);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
}

- (TGBarrageCell *)contentCell {
    if (!_contentCell) {
        _contentCell = [[TGBarrageCell alloc] init];
        _contentCell.delegate = self;
        [_contentCell addTarget:self action:@selector(didTouchContentCellAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _contentCell;
}

- (void)setAttendModel:(TGCZDAttenderModel *)attendModel {
    _attendModel = attendModel;
    _contentCell.attendModel = attendModel;
}
 
- (void)barrageCell:(TGBarrageCell *)barrageCell updateConstraintsWithWidth:(CGFloat)width {
    [barrageCell mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
}

- (void)didTouchContentCellAction:(UIControl *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(barrageTableViewCell:didTouchAction:)]) {
        [self.delegate barrageTableViewCell:self didTouchAction:sender];
    }
}


@end

