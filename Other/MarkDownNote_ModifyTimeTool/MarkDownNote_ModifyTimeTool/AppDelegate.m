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

-(void) initView{
    
}

-(void) initData{
    
}

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
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSArray *fileList2 = [fileManager contentsOfDirectoryAtPath:@"README.md" error:&error];
    
    
    NSArray *fileList3 = [self subPathWithPath:@"README.md"];
    NSString *docPath = NSHomeDirectory();
    NSString *str = [Utils getAppPath];
    NSString *duoyv = @"MarkDownNote_ModifyTimeTool.app/Contents/MacOS/MarkDownNote_ModifyTimeTool";
    if ([str rangeOfString:duoyv].location != NSNotFound && str.length > duoyv.length) {
        str = [str substringToIndex:(str.length - duoyv.length)];
        str = [NSString stringWithFormat:@"%@README.md",str];
    }
    NSString *readmeMD = [self openDotMD:str];
    
    NSLog(@"");
    if (files) {
        for(int i = 0; i < [files count]; i++ ){
            NSString* fileName = [files objectAtIndex:i];
            
            //收集子文件
            NSArray *fileList = [self subPathWithPath:fileName];
            NSLog(@"共有文件==%lu个",(unsigned long)fileList.count);
            NSArray *dotMList = [self filterDotM:fileList];
            NSLog(@"共有.m文件==%lu个",(unsigned long)dotMList.count);
            
            if (dotMList && dotMList.count > 0) {
                
                for (NSString *filePath in dotMList) {
                    NSString *fileStr = [self openDotM:filePath];
                    NSString *contents = [self addLocalizal_Key:fileStr];
                    [self saveDotM:filePath withContents:contents];
                }
            }
            
            
        }
    }
}
//2,.m取所有子文件
-(NSArray*) subPathWithPath:(NSString*)path{
    NSMutableArray *mArr = [NSMutableArray new];
    if (path == nil || ![path isKindOfClass:[NSString class]]) {
        return mArr;
    }
    //收集子文件
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:path error:&error];
    if (fileList && fileList.count > 0) {//有子文件
        for (NSString *fileName in fileList) {
            NSArray *subArr = [self subPathWithPath:[NSString stringWithFormat:@"%@/%@",path,fileName]];
            [mArr addObjectsFromArray:subArr];
        }
    }else{//无子文件
        NSLog(@"添加路径:%@",path);
        [mArr addObject:path];
    }
    return mArr;
}
//3,.m筛选所有.m文件
-(NSArray*) filterDotM:(NSArray*)fileArr{
    NSMutableArray *mArr = [[NSMutableArray alloc] init];
    if (fileArr == nil || ![fileArr isKindOfClass:[NSArray class]]) {
        return mArr;
    }
    for (NSString *file in fileArr) {
        if (file && file.length > 1 && [@".m" isEqualToString:[file substringFromIndex:file.length - 2]]) {
            [mArr addObject:file];
        }
    }
    return mArr;
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
//4,.m打开.m文件
-(NSString*) openDotM:(NSString*)filePath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    NSArray *pathArr = [fileManager componentsToDisplayForPath:filePath];
    NSString *fileName = pathArr[pathArr.count - 1];
    NSString *filePathName = [filePath stringByReplacingOccurrencesOfString:fileName withString:@""];
    //处理源文件
    NSString *fileStr = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
    return fileStr;
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
//5,.m处理.m文件
-(NSString*)addLocalizal_Key:(NSString*)fileStr{
    if (fileStr == nil || ![fileStr isKindOfClass:[NSString class]]) {
        fileStr = @"";
    }
    NSMutableString *mHtml = [NSMutableString stringWithString:fileStr];
    NSInteger curSumIndex = 0;
    while (curSumIndex < mHtml.length) {
        NSString *findHtml = [mHtml substringFromIndex:curSumIndex];
        //1,获取startIndex
        NSInteger startIndex = NSNotFound;
        NSInteger curStartSumIndex = 0;//当前检查到找到哪了；
        while (curStartSumIndex < findHtml.length) {
            NSString *checkMHtml = [findHtml substringFromIndex:curStartSumIndex];
            startIndex = [checkMHtml rangeOfString:@"@\""].location;//startIndex_1:当前checkHtml位置;
            if (startIndex == NSNotFound) {
                curSumIndex = mHtml.length;
                break;
            }
            //判断@"前面是否为(
            BOOL checkValid = true;
            for (NSInteger i = startIndex - 1; i >= 0; i--) {
                unichar c = [checkMHtml characterAtIndex:i];
                if(c != 32){//非" "
                    checkValid = (c != 40) && (c != 37);//判断是否为"("或"%"
                    break;
                }
            }
            //有效a标签则记录startIndex
            if (checkValid) {
                startIndex = startIndex + curStartSumIndex;//startIndex_2:当前findHtml位置;
                break;
            }else{
                curStartSumIndex += startIndex + 1;
                startIndex = NSNotFound;
            }
        }
        
        //2,获取endIndex
        NSInteger endIndex = NSNotFound;
        if (startIndex != NSNotFound) {
            NSInteger curEndSumIndex = startIndex + 2;//从开始位置结束的地方开始
            while (curEndSumIndex < findHtml.length) {
                NSString *checkMHtml = [findHtml substringFromIndex:curEndSumIndex];
                endIndex = [checkMHtml rangeOfString:@"\""].location;//endIndex_1:当前checkHtml位置;
                if (endIndex == NSNotFound) {
                    curSumIndex = mHtml.length;
                    break;
                }
                //判断"前面是否为\;
                BOOL checkValid = true;
                if (endIndex > 0) {
                    unichar c = [checkMHtml characterAtIndex:endIndex - 1];
                    checkValid = (c != 92);//判断是否为"("
                }
                //有效a标签则记录startIndex
                if (checkValid) {
                    endIndex = endIndex + curEndSumIndex;//endIndex_2:当前findHtml位置;
                    break;
                }else{
                    curEndSumIndex += endIndex + 1;
                    endIndex = NSNotFound;
                }
            }
        }
        
        //3,去掉标签内内容
        if (startIndex != NSNotFound && endIndex != NSNotFound) {
            startIndex += curSumIndex;
            endIndex += curSumIndex;
            curSumIndex = endIndex + 1;
            if (mHtml.length >= endIndex + 1 && endIndex > startIndex) {
                //startIndex_3:当前mHtml位置;
                NSString *replaceStr = [mHtml substringWithRange:NSMakeRange(startIndex, endIndex + 1 - startIndex)];
                if ([self containsChinese:replaceStr]) {
                    [mHtml replaceCharactersInRange:NSMakeRange(startIndex, endIndex + 1 - startIndex) withString:[NSString stringWithFormat:@"LOCALIZE_KEY(%@)",replaceStr]];
                    curSumIndex += 14;
                    if (replaceStr.length > 2) {
                        NSString *keyStr = [replaceStr substringWithRange:NSMakeRange(2, replaceStr.length - 3)];
                        
                    }
                }
            }
        }else{
            curSumIndex = mHtml.length;
        }
        NSLog(@"mHtml总长度:%lu",(unsigned long)mHtml.length);
    }
    return mHtml;
}
//6,.m保存.m文件
-(void) saveDotM:(NSString*)filePath withContents:(NSString*)contents{
    if (contents && contents.length > 0 && filePath) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createFileAtPath:filePath
                             contents:[contents dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    }
}
-(BOOL)containsChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}



@end










