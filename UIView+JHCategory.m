//
//  UIView+JHCategory.m
//  JHKit
//
//  Created by HaoCold on 16/8/18.
//  Copyright © 2016年 HaoCold. All rights reserved.
//

#import "UIView+JHCategory.h"

@implementation UIView (JHCategory)

- (CGRect)jhRectFromString:(NSString *)frameStr
{
    if ([frameStr hasPrefix:@"["] && [frameStr hasSuffix:@"]"] && frameStr.length > 3)
    {
        frameStr = [frameStr substringWithRange:NSMakeRange(1, frameStr.length - 2)];
        frameStr = [frameStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSArray *xFourElementArr = [frameStr componentsSeparatedByString:@","];
        if (xFourElementArr.count != 4) return CGRectZero;
        
        CGFloat X = [self jhFloatFromString:xFourElementArr[0]];
        CGFloat Y = [self jhFloatFromString:xFourElementArr[1]];
        CGFloat W = [self jhFloatFromString:xFourElementArr[2]];
        CGFloat H = [self jhFloatFromString:xFourElementArr[3]];
        
        return CGRectMake(X, Y, W, H);
    }
    
    return CGRectZero;
}

- (CGFloat)jhFloatFromString:(NSString *)string
{
    if ([string hasPrefix:@"x:"] ||
        [string hasPrefix:@"y:"] ||
        [string hasPrefix:@"w:"] ||
        [string hasPrefix:@"h:"])
    {
        NSString *subStr = [string substringFromIndex:2]; //eg. 2_x(100)+10 or x(100)+10 or x(100) or 10
        NSArray  *xArr = [subStr componentsSeparatedByString:@")"];
        //NSLog(@"xArr:%@",xArr);//x(100) 会分割成 x(100 和 ""
        
        if (xArr.count == 1) // 10 针对常量的情况
        {
            if ([self isPureInt:xArr[0]] || [self isPureFloat:xArr[0]]) {
                return [xArr[0] floatValue];
            }else{
                return 0.0;
            }
        }
        else if (xArr.count == 2) //2_x(100 +10
        {
            CGFloat firstValue = [self jhParseFirstSubStr:xArr[0]]; // 2_x(100
            
            NSString *secondStr = xArr[1]; // +10
            if (secondStr.length < 2) return firstValue; //只返回前面部分
            
            NSString *subStr1 = [secondStr substringToIndex:1];
            NSString *subStr2 = [secondStr substringFromIndex:1];
            
            if ([self isPureInt:subStr2] ||
                [self isPureFloat:subStr2] ||
                [subStr2 integerValue] != 0 ||
                [subStr2 floatValue] > 0.01)
            {
                if ([subStr1 isEqualToString:@"+"]) {
                    return firstValue + [subStr2 floatValue];
                }else if ([subStr1 isEqualToString:@"-"]) {
                    return firstValue - [subStr2 floatValue];
                }else if ([subStr1 isEqualToString:@"*"]) {
                    return firstValue * [subStr2 floatValue];
                }else if ([subStr1 isEqualToString:@"/"]) {
                    return firstValue / [subStr2 floatValue];
                }else{
                    return firstValue; //只返回前面部分
                }
            }
            else
            {
                return firstValue; //只返回前面部分
            }
        }
        return 0.0;
    }
    return 0.0;
}

//判断是否为整形
- (BOOL)isPureInt:(NSString*)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形
- (BOOL)isPureFloat:(NSString*)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (CGFloat)jhParseFirstSubStr:(NSString *)firstStr
{
    NSArray *subArr = [firstStr componentsSeparatedByString:@"("]; // 2_x 100
    if (subArr.count != 2) return 0.0;
    
    NSString *first  = subArr[0];
    NSString *second = subArr[1];
    
    if (![self isPureInt:second]) return 0.0;
    
    UIView *view = [self viewWithTag:[second integerValue]];
    if (view == nil) return 0.0;
    
    return [self jhFloatFromView:view withPreID:first];
}

- (CGFloat)jhFloatFromView:(UIView *)view withPreID:(NSString *)first
{
    if ([first isEqualToString:@"x"]) {
        return view.frame.origin.x;
    }else if ([first isEqualToString:@"y"]){
        return view.frame.origin.y;
    }else if ([first isEqualToString:@"w"]){
        return view.frame.size.width;
    }else if ([first isEqualToString:@"h"]){
        return view.frame.size.height;
    }else if ([first isEqualToString:@"maxx"]){
        return CGRectGetMaxX(view.frame);
    }else if ([first isEqualToString:@"maxy"]){
        return CGRectGetMaxY(view.frame);
    }else{
        return [self jhMultiple:first view:view];
    }
    return 0.0;
}

- (CGFloat)jhMultiple:(NSString *)prefix view:(UIView *)view
{
    /**< prefix: eg: 2_x,3_x,4_x,...*/
    if ([prefix rangeOfString:@"_"].length == 0) {
        return 0.0;
    }
    
    NSArray *arr = [prefix componentsSeparatedByString:@"_"];
    NSString *first = arr[0];
    if (![self isPureInt:first]) return 0.0;
    
    CGFloat floatValue = [self jhFloatFromView:view withPreID:arr[1]];
    return floatValue/[first integerValue];
}
@end
