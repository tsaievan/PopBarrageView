//
//  TGGZDConstant.h
//  TradeBook
//
//  Created by tsaievan on 20/10/2018.
//  Copyright © 2018 ethan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


/*************************请求的url**************************/

///< 猜涨跌获取token的baseURL
FOUNDATION_EXTERN NSString *const TGCZDTokenBaseURL;

///< 猜涨跌baseURL
FOUNDATION_EXTERN NSString *const TGCZDBaseURL;

///< 获取token
FOUNDATION_EXTERN NSString *const TGCZDGetTokenURL;

///< token
FOUNDATION_EXTERN NSString *const TGCZDTokenString;

///< 弹幕数据
FOUNDATION_EXTERN NSString *const TGCZDBarrageURL;

///< 猜涨跌数据列表(时间顺序, 不排名)
FOUNDATION_EXTERN NSString *const TGCZDNewRangeListURL;

///< 查询用户排名信息
FOUNDATION_EXTERN NSString *const TGCZDUserRankInfoURL;

///< 查询个股竞猜分部
FOUNDATION_EXTERN NSString *const TGCZDGuessDistURL;

///< 用户提交猜涨跌
FOUNDATION_EXTERN NSString *const TGCZDUserGuessPOSTURL;

///< 猜涨跌排行榜前5
FOUNDATION_EXTERN NSString *const TGCZDRankTopFiveURL;

///< 猜涨跌全部排行榜
FOUNDATION_EXTERN NSString *const TGCZDRankTopAllURL;

///< 查询总参与人数
FOUNDATION_EXTERN NSString *const TGCZDQueryGuessRecordCountByStockIdURL;

///< 查询未参与竞猜股票列表
FOUNDATION_EXTERN NSString *const TGCZDSurplusStockCountURL;

///< 猜涨跌规则的web页面url
FOUNDATION_EXTERN NSString *const TGCZDProtocolURL;

///< 奖品web页面url
FOUNDATION_EXTERN NSString *const TGCZDBonusURL;

///< 首页和柱状图的分享的baseUrl
FOUNDATION_EXTERN NSString *const TGCZDShareBaseURL;

///< 查询股票的状态 
FOUNDATION_EXTERN NSString *const TGCZDQueryStockStatus;

/***********************************************************/

/*************************其他的一些常量**************************/

///< 是否显示了猜涨跌引导
FOUNDATION_EXTERN NSString *const TGCZDShowGuideViewKey;

/***********************************************************/

/*************************定义该模块需要用到的一些枚举**************************/
typedef NS_ENUM(NSUInteger, TGCZDBonusType) {
    TGCZDBonusTypeCash = 1,
    TGCZDBonusTypeLv2,
    TGCZDBonusTypeSubscribe,
};

typedef NS_ENUM(NSUInteger, TGCZDIsRankingType) {
    TGCZDIsRankingTypeTrue,
    TGCZDIsRankingTypeFalse,
};

typedef NS_ENUM(NSUInteger, TGCZDDataType) {
    TGCZDDataTypeUnknown = 0, ///< 未排名
    TGCZDDataTypeFirst, ///< 第一名
    TGCZDDataTypeSencond, ///< 第二名
    TGCZDDataTypeToTen, ///< 三到十
    TGCZDDataTypeToTwenty, ///< 11-20
    TGCZDDataTypeToOneHundred, ///< 21-100
    TGCZDDataTypeToTwoHundred, ///< 101-200
};

typedef NS_ENUM(NSUInteger, TGCZDRankType) {
    TGCZDRankType_Miss,
    TGCZDRankType_1,
    TGCZDRankType_2,
    TGCZDRankType_3,
    TGCZDRankType_4_10,
    TGCZDRankType_11_100,
    TGCZDRankType_101_200,
    TGCZDRankType_201_Infinity,
    TGCZDRankType_NoRanking,
};
