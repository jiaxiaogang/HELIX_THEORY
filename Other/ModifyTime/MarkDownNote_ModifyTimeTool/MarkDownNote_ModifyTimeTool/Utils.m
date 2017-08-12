//
//  Utils.m
//  MarkDownNote_ModifyTimeTool
//
//  Created by 贾  on 2017/8/2.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "Utils.h"
#include <mach-o/dyld.h>
#import "NSDate+Escort.h"

@implementation Utils

char g_path[MAXPATHLEN+1];
+ (NSString *)getAppPath {
    uint32_t size = sizeof(g_path);
    if (_NSGetExecutablePath(g_path, &size) == 0){
        printf("executable path is %s\n", g_path);
        return [NSString stringWithFormat:@"%s",g_path];
    }else{
        printf("buffer too small; need size %u\n", size);
    }
    
    if(strlen(g_path))
    {
        int end,count = 0;
        for(int i = strlen(g_path) - 1; i>0; i--)
        {
            if(g_path[i] == '/')
            {
                count++;
            }
            if(count == 4)
            {
                end = i;
                break;
            }
        }
        if(end > 0)
        {
            memset(g_path+end,0,strlen(g_path)-end);
        }
    }
    return nil;
}

+ (NSString *)getAppRootPath {
    NSString *appPath = [Utils getAppPath];
    NSString *duoyv = @"MarkDownNote_ModifyTimeTool.app/Contents/MacOS/MarkDownNote_ModifyTimeTool";
    if ([appPath rangeOfString:duoyv].location != NSNotFound && appPath.length > duoyv.length) {
        appPath = [appPath substringToIndex:(appPath.length - duoyv.length)];
        return appPath;
    }
    return appPath;
}

+(NSRange) rangeOfString:(NSString*)findStr fromStr:(NSString*)fromStr location:(NSUInteger)location length:(NSUInteger)length {
    if (location != NSNotFound && findStr && fromStr && fromStr.length > (location + length)) {
        NSString *checkStr = [fromStr substringFromIndex:(location + length)];
        NSRange range = [checkStr rangeOfString:findStr];
        if (range.location != NSNotFound) {
            range.location += (location + length);
            return range;
        }
    }
    return NSMakeRange(NSNotFound, 0);
}

+(NSString*) getModifyTimeDesc:(NSDate*)date{
    if (date == nil) return nil;
    //取今天时间
    NSDate *endDate = [[NSDate date] dateAtEndOfDay];
    
    //取time
    long tartetTime = [date timeIntervalSince1970];
    long todayZeroTime = [endDate timeIntervalSince1970]; //今天24点时间
    long distanceTime = todayZeroTime - tartetTime;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    /*if (distanceTime < 86400) {
        [dateFormatter setDateFormat:@"今天 HH:mm:ss"];
        return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:(tartetTime)]];
    }else if (distanceTime < 86400 * 2) {
        [dateFormatter setDateFormat:@"昨天 HH:mm:ss"];
        return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:(tartetTime)]];
    }else */if (date.year == [NSDate date].year) {
        [dateFormatter setDateFormat:@"MM月dd日 HH:mm:ss"];
        return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:(tartetTime)]];
    }else{
        [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
        return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:(tartetTime)]];
    }
}



@end
