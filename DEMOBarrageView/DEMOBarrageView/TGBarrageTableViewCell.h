//
//  TGBarrageTableViewCell.h
//  TradeBook
//
//  Created by tsaievan on 22/11/2018.
//  Copyright © 2018 ethan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TGCZDAttenderModel.h"

NS_ASSUME_NONNULL_BEGIN
@class TGBarrageTableViewCell;
@protocol TGBarrageTableViewCellDelegate <NSObject>

- (void)barrageTableViewCell:(TGBarrageTableViewCell *)cell didTouchAction:(UIControl *)sender;

@end

@interface TGBarrageTableViewCell : UITableViewCell

@property (nonatomic, strong) TGCZDAttenderModel *attendModel;

@property (nonatomic, weak) id <TGBarrageTableViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
