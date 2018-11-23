//
//  TGGZDConstant.m
//  TradeBook
//
//  Created by tsaievan on 20/10/2018.
//  Copyright © 2018 ethan. All rights reserved.
//

#import "TGGZDConstant.h"

#ifdef _BUILD_FOR_UAT_
NSString *const TGCZDTokenBaseURL = @"http://192.168.0.85:8080";
NSString *const TGCZDBaseURL = @"http://192.168.0.85:8900/guess";
#else
NSString *const TGCZDTokenBaseURL = @"http://CloudAPI.iqdii.com";
NSString *const TGCZDBaseURL = @"http://CloudAPI.iqdii.com/guess";
#endif

NSString *const TGCZDGetTokenURL = @"/token";

NSString *const TGCZDTokenString = @"TGCZDTokenString";

NSString *const TGCZDBarrageURL = @"/guess/record/queryNewestGuessRecord";

NSString *const TGCZDNewRangeListURL = @"/guess/record/queryAllGuessRecordByPage";

NSString *const TGCZDUserRankInfoURL = @"/guess/record/userRankInfo";

NSString *const TGCZDGuessDistURL = @"/guess/dist/guessDist";

NSString *const TGCZDUserGuessPOSTURL = @"/guess/record/userGuess";

NSString *const TGCZDRankTopFiveURL = @"/guess/record/rankTop5";

NSString *const TGCZDRankTopAllURL = @"/guess/record/rankTop";

NSString *const TGCZDQueryGuessRecordCountByStockIdURL = @"/guess/record/queryGuessRecordCountByStockId";

NSString *const TGCZDSurplusStockCountURL = @"/stock/surplusStockCount";

NSString *const TGCZDQueryStockStatus = @"/stock/status";

#ifdef _BUILD_FOR_UAT_
NSString *const TGCZDProtocolURL = @"http://192.168.0.85/guessLift/ruler";
NSString *const TGCZDBonusURL = @"http://192.168.0.85/guessLift";
NSString *const TGCZDShareBaseURL = @"http://192.168.0.85/guess/#";
#else
NSString *const TGCZDProtocolURL = @"http://cloudh5.iqdii.com/guessLift/ruler";
NSString *const TGCZDBonusURL = @"http://cloudh5.iqdii.com/guessLift";
NSString *const TGCZDShareBaseURL = @"http://cloudh5.iqdii.com/guess/";
#endif


NSString *const TGCZDShowGuideViewKey = @"TGCZDShowGuideViewKey";
