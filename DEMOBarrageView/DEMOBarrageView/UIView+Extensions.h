//
//  UIView+Extensions.h
//  LXCircleAnimationView
//
//  Created by Leexin on 15/12/18.
//  Copyright © 2015年 Garden.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<QuartzCore/QuartzCore.h>

@interface UIView (Extensions)

@property CGPoint tg_origin;
@property CGSize tg_size;

@property (readonly) CGPoint tg_bottomLeft;
@property (readonly) CGPoint tg_bottomRight;
@property (readonly) CGPoint tg_topRight;

@property CGFloat tg_height;
@property CGFloat tg_width;

@property CGFloat tg_top;
@property CGFloat tg_left;

@property CGFloat tg_bottom;
@property CGFloat tg_right;

@end


