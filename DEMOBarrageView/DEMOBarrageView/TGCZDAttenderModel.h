//
//  TGCZDAttenderModel.h
//  DEMO
//
//  Created by tsaievan on 17/10/2018.
//  Copyright © 2018 tsaievan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TGCZDAttenderModel : NSObject

///< 参与者姓名
@property (nonatomic, strong) NSString *userName;

///< 头像url
@property (nonatomic, strong) NSString *imgUrl;

///< 排名
@property (nonatomic, assign) NSInteger guessRankNum;

///< 猜涨跌的幅度
@property (nonatomic, assign) CGFloat guessNum;

///< 误差
@property (nonatomic, assign) CGFloat guessErrorNum;

///< 数据的创建时间
@property (nonatomic, copy) NSString *createtime;

///< recordId
@property (nonatomic, copy) NSString *recordId;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
