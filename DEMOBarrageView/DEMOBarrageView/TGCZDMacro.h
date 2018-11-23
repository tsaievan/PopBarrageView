//
//  TGCZDMacro.h
//  TradeBook
//
//  Created by tsaievan on 19/10/2018.
//  Copyright © 2018 ethan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 懒加载
 */
#define TGLazyGetMethod(type, attribute)            \
- (type *)attribute                                 \
{                                                   \
if (!_##attribute) {                            \
_##attribute = [[type alloc] init];         \
}                                               \
return _##attribute;                            \
}

#define RGB(r,g,b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0]

#define TG_HEXA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0x0000FF)) / 255.0 \
alpha:alphaValue]

#define TG_HEX(rgbValue) TG_HEXA(rgbValue, 1.0)

///< 适配
#define TG_SIZE_CONVERT(A)  ([UIScreen mainScreen].bounds.size.width / 414 * A)

///< 是否是iPhone X以上机型
#define TG_DEVICE_IPHONEX_HIGHER ([UIScreen mainScreen].bounds.size.height >= 812 ? YES : NO)

#define TG_BOUNCE_Y TG_SIZE_CONVERT(40)

#define TG_SCREEN_WIDTH UIScreen.mainScreen.bounds.size.width
#define TG_SCREEN_HEIGHT UIScreen.mainScreen.bounds.size.height




