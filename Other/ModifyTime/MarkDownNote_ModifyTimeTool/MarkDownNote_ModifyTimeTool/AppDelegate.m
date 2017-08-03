//
//  AppDelegate.m
//  MarkDownNote_ModifyTimeTool
//
//  Created by 贾  on 2017/8/2.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "AppDelegate.h"
#import "Utils.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSView *containerView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self initView];
    [self initData];
    [self initRun];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {}

-(void) initView{}

-(void) initData{}

-(void) initRun{
    [self startScanDotM:nil];
    [self.window close];
    [[NSApplication sharedApplication] stop:nil];
}

/**
 *  MARK:--------------------method--------------------
 */
//1,.m选取文件夹
-(void) startScanDotM:(NSArray*)files{
    //1,读取README.md
    NSString *appRootPath = [Utils getAppRootPath];
    if (appRootPath == nil) return;
    
    NSString *readmePath = [NSString stringWithFormat:@"%@README.md",appRootPath];
    NSString *readmeMD = [self openDotMD:readmePath];
    if (readmeMD == nil) return;
    
    //2,生成新字符串
    NSMutableString *mStr = [[NSMutableString alloc] init];
    
    //3,分行遍历执行
    NSMutableArray *lines = [NSMutableArray arrayWithArray:[readmeMD componentsSeparatedByString:@"\n"]];
    for (int i = 0; i < lines.count; i++) {
        //4,找出README.md中的链接地址
        NSString *line = lines[i];
        NSRange leftRange = [Utils rangeOfString:@"[" fromStr:line location:0 length:0];
        NSRange centerRange = [Utils rangeOfString:@"](" fromStr:line location:leftRange.location length:leftRange.length];
        NSRange rightRange = [Utils rangeOfString:@")" fromStr:line location:centerRange.location length:centerRange.length];
        NSRange lHtmlRange = [Utils rangeOfString:@"<font size=\"1\" color=\"#888888\">" fromStr:line location:rightRange.location length:rightRange.length];
        NSRange rHtmlRange = [Utils rangeOfString:@"</font>" fromStr:line location:lHtmlRange.location length:lHtmlRange.length];
        
        if (leftRange.location != NSNotFound && centerRange.location != NSNotFound && rightRange.location != NSNotFound) {
            NSMutableString *mLine = [[NSMutableString alloc] initWithString:line];
            //5,去掉旧的时间
            if (lHtmlRange.location != NSNotFound && rHtmlRange.location != NSNotFound) {
                [mLine replaceCharactersInRange:NSMakeRange(lHtmlRange.location, rHtmlRange.location + rHtmlRange.length - lHtmlRange.location) withString:@""];
            }
            //6,取文件路径
            NSRange fileRange = NSMakeRange(centerRange.location + centerRange.length, rightRange.location - centerRange.location - centerRange.length);
            NSString *filePath = [NSString stringWithFormat:@"%@%@",appRootPath,[line substringWithRange:fileRange]];
            //7,添加新的时间
            NSString *modifyDesc = [self getDotMDModifyTime:filePath];
            if (modifyDesc) {
                [mLine appendString:[NSString stringWithFormat:@"<font size=\"1\" color=\"#888888\"> 修改时间:%@</font>",modifyDesc]];
            }
            [mStr appendString:[NSString stringWithFormat:@"%@\n",mLine]];
        }else{
            [mStr appendString:[NSString stringWithFormat:@"%@\n",line]];
        }
    }
    
    //8,写入新文件
    [self saveDotMD:readmePath withContents:mStr];
}

//3,.md筛选所有.md文件
-(NSArray*) filterDotMD:(NSArray*)fileArr{
    NSMutableArray *mArr = [[NSMutableArray alloc] init];
    if (fileArr == nil || ![fileArr isKindOfClass:[NSArray class]]) {
        return mArr;
    }
    for (NSString *file in fileArr) {
        if (file && file.length > 1 && [@".md" isEqualToString:[file substringFromIndex:file.length - 2]]) {
            [mArr addObject:file];
        }
    }
    return mArr;
}

//4,.md打开.md文件
-(NSString*) openDotMD:(NSString*)filePath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    NSArray *pathArr = [fileManager componentsToDisplayForPath:filePath];
    NSString *fileName = pathArr[pathArr.count - 1];
    if (fileName) {
        NSString *filePathName = [filePath stringByReplacingOccurrencesOfString:fileName withString:@""];
        NSString *fileStr = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
        return fileStr;
    }else{
        return nil;
    }
}

//5,取.md修改时间
-(NSString*) getDotMDModifyTime:(NSString*)filePath{
    if (filePath == nil) return nil;
    
    NSError *error = nil;
    NSDictionary *fileAttrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&error];
    NSDate *modifyDate = [fileAttrs objectForKey:NSFileModificationDate];
    return [Utils getModifyTimeDesc:modifyDate];
}

//6,.m保存.m文件
-(void) saveDotMD:(NSString*)filePath withContents:(NSString*)contents{
    if (contents && contents.length > 0 && filePath) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createFileAtPath:filePath
                             contents:[contents dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    }
}

@end










