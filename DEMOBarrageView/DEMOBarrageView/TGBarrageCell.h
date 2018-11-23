//
//  TGBarrageCell.h
//  TGBarrageViewDemo
//
//  Created by tsaievan on 21/10/2018.
//  Copyright © 2018 tsaievan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TGCZDAttenderModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TGBarrageCell;
@protocol TGBarrageCellDelegate <NSObject>

- (void)barrageCell:(TGBarrageCell *)barrageCell updateConstraintsWithWidth:(CGFloat)width;

@end

@interface TGBarrageCell : UIControl

@property (nonatomic, strong) TGCZDAttenderModel *attendModel;

@property (nonatomic, weak) id <TGBarrageCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
