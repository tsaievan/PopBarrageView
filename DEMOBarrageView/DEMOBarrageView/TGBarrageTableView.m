//
//  TGBarrageTableView.m
//  TradeBook
//
//  Created by tsaievan on 22/11/2018.
//  Copyright © 2018 ethan. All rights reserved.
//

#import "TGBarrageTableView.h"
#import "TGBarrageCell.h"

@implementation TGBarrageTableView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isKindOfClass:[TGBarrageCell class]]) {
        return view;
    }
    return nil;
}

@end
