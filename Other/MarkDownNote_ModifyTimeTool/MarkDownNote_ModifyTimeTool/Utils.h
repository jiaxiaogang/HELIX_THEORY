//
//  Utils.h
//  MarkDownNote_ModifyTimeTool
//
//  Created by 贾  on 2017/8/2.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (NSString *)getAppPath;
+ (NSString *)getAppRootPath ;
+(NSRange) rangeOfString:(NSString*)findStr fromStr:(NSString*)fromStr location:(NSUInteger)location length:(NSUInteger)length;

@end
