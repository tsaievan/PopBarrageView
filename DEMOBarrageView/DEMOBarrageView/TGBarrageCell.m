//
//  TGBarrageCell.m
//  TGBarrageViewDemo
//
//  Created by tsaievan on 21/10/2018.
//  Copyright © 2018 tsaievan. All rights reserved.
//

#import "TGBarrageCell.h"
#import "TGCZDMacro.h"
#import "UIView+Extensions.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@interface TGBarrageCell ()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *rangeLabel;

@end

@implementation TGBarrageCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    UIImage *image = [UIImage imageNamed:@"barrage_gradient.png"];
    [image drawInRect:rect];
}

- (void)setupUI {
    self.backgroundColor = UIColor.clearColor;
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    [self addSubview:self.iconImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.rangeLabel];
    [self makeConstraints];
}

- (void)makeConstraints {
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(7);
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(20);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(3);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.rangeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel.mas_right).offset(3);
        make.centerY.mas_equalTo(self);
    }];
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = 10;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:12];
    }
    return _nameLabel;
}

- (UILabel *)rangeLabel {
    if (!_rangeLabel) {
        _rangeLabel = [[UILabel alloc] init];
        _rangeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _rangeLabel;
}

- (void)setAttendModel:(TGCZDAttenderModel *)attendModel {
    _attendModel = attendModel;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:attendModel.imgUrl] placeholderImage:[UIImage imageNamed:@"mor_toux"]];
    NSString *name = attendModel.userName;
//    if (name.length <= 0) {
//        name = @"* * * *";
//    }else if (name.length == 1) {
//        name = [NSString stringWithFormat:@"%@ * * *", [name substringWithRange:NSMakeRange(0, 1)]];
//    }else {
//        name = [NSString stringWithFormat:@"%@ * * %@", [name substringWithRange:NSMakeRange(0, 1)], [name substringWithRange:NSMakeRange(name.length - 1, 1)]];
//    }
    NSString *nameString = [NSString stringWithFormat:@"%@ 猜", name];
    self.nameLabel.text = nameString;
    NSString *range = @"+500.99%";
    if (attendModel.guessNum >= 0) { ///< 表明猜的是正数(涨)
        _rangeLabel.textColor = TG_HEX(0xFF3E18);
        range = [NSString stringWithFormat:@"+%.1f%%", attendModel.guessNum];
        _rangeLabel.text = range;
    }else { ///< 表明猜的是负数(跌)
        _rangeLabel.textColor = TG_HEX(0x2BE75B);
        range = [NSString stringWithFormat:@"%.1f%%", attendModel.guessNum];
        _rangeLabel.text = range;
    }
    CGFloat cellWidth = 0.f;
    CGFloat nameWidth = [nameString sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}].width;
    CGFloat rangeWidth = [range sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}].width;
    CGFloat endMargin = 7;
    CGFloat margin = 3;
    CGFloat iconWidth = 20;
    cellWidth = endMargin + iconWidth + margin + nameWidth  + margin + rangeWidth + endMargin;
    if (self.delegate && [self.delegate respondsToSelector:@selector(barrageCell:updateConstraintsWithWidth:)]) {
        [self.delegate barrageCell:self updateConstraintsWithWidth:cellWidth];
    }
}

@end
