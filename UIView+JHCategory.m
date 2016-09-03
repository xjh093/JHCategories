//
//  UIView+JHCategory.m
//  JHKit
//
//  Created by HaoCold on 16/8/18.
//  Copyright © 2016年 HaoCold. All rights reserved.
//

#import "UIView+JHCategory.h"

#define JH_bdColor_m(jhclass) \
- (jhclass *(^)(id))jh_bdColor{ \
    JHLog(); \
    return ^id(id bdColor){ \
        if([bdColor isKindOfClass:[UIColor class]]){ \
            self.layer.borderColor = [bdColor CGColor]; \
        } \
        return self; \
    }; \
}

#define JH_bdWidth_m(jhclass) \
- (jhclass *(^)(id))jh_bdWidth{ \
    JHLog(); \
    return ^id(id bdWidth){ \
        if([bdWidth isKindOfClass:[NSNumber class]]){ \
            self.layer.borderWidth = [bdWidth floatValue]; \
        } \
        return self; \
    };\
}

#define JH_cnRadius_m(jhclass) \
- (jhclass *(^)(id))jh_cnRadius{ \
    JHLog(); \
    return ^id(id cnRadius){ \
        if([cnRadius isKindOfClass:[NSNumber class]]){ \
            self.layer.cornerRadius = [cnRadius floatValue]; \
        } \
        return self; \
    }; \
}

#define JH_mtBounds_m(jhclass) \
- (jhclass *(^)(id))jh_mtBounds{ \
    JHLog(); \
    return ^id(id mtBounds){ \
        if([mtBounds isKindOfClass:[NSNumber class]]){ \
            self.layer.masksToBounds = [mtBounds floatValue]; \
        } \
        return self; \
    }; \
}

#define JH_addToView_m(jhclass) \
- (jhclass *(^)(id))jh_addToView{ \
    JHLog(); \
    return ^id(id view){ \
        if ([view isKindOfClass:[UIView class]]) { \
            [view addSubview:self]; \
        } \
        return self; \
    }; \
}

#define JH_tag_m(jhclass) \
- (jhclass *(^)(id))jh_tag{ \
    JHLog(); \
    return ^id(id tag){ \
        if ([tag isKindOfClass:[NSNumber class]]) { \
            self.tag = [tag integerValue]; \
        } \
        return self; \
    }; \
}

#define JH_frame_m(jhclass) \
- (jhclass *(^)(id))jh_frame{ \
    JHLog(); \
    return ^id(id frame){ \
        if ([frame isKindOfClass:[NSValue class]]) { \
            self.frame = [frame CGRectValue]; \
        }else if ([frame isKindOfClass:[NSString class]]){ \
            if ([frame hasPrefix:@"{"]) { \
                self.frame = CGRectFromString(frame); \
            }else if ([frame hasPrefix:@"["]){ \
                self.frame = [self.superview jhRectFromString:frame]; \
            }else{ \
                self.frame = CGRectZero; \
            } \
        } \
        return self; \
    }; \
}

#define JH_bgColor_m(jhclass) \
- (jhclass *(^)(id))jh_bgColor{ \
    JHLog(); \
    return  ^id(id color){ \
        if ([color isKindOfClass:[UIColor class]]) { \
            self.backgroundColor = color; \
        }else if ([color isKindOfClass:[NSString class]]){ \
            self.backgroundColor = [UIColor jhColor:color]; \
        } \
        return self; \
    }; \
}

#define JH_delegate_m(jhclass) \
- (jhclass *(^)(id))jh_delegate{ \
    JHLog(); \
    return ^id(id delegate){ \
        if ([delegate isKindOfClass:[UIViewController class]] || \
            [delegate isKindOfClass:[UIView class]]) { \
            self.delegate = delegate; \
        } \
        return self; \
    }; \
}

#define JH_text_m(jhclass) \
- (jhclass *(^)(id))jh_text{ \
    JHLog(); \
    return ^id(id text){ \
        if ([text isKindOfClass:[NSString class]]) { \
            self.text = text; \
        } \
        return self; \
    }; \
}

#define JH_color_m(jhclass) \
- (jhclass *(^)(id))jh_color{ \
    JHLog(); \
    return ^id(id color){ \
        if ([color isKindOfClass:[UIColor class]]) { \
            self.textColor = color; \
        }else if ([color isKindOfClass:[NSString class]]){ \
            self.textColor = [UIColor jhColor:color]; \
        } \
        return self; \
    }; \
}

#define JH_font_m(jhclass) \
- (jhclass *(^)(id))jh_font{ \
    JHLog(); \
    return ^id(id font){ \
        if ([font isKindOfClass:[UIFont class]]) { \
            self.font = font; \
        }else if ([font isKindOfClass:[NSString class]]){ \
            self.font = [UIFont jhFont:font]; \
        } \
        return self; \
    }; \
}

#define JH_align_m(jhclass) \
- (jhclass *(^)(id))jh_align{ \
    JHLog(); \
    return ^id(id align){ \
        if ([align isKindOfClass:[NSNumber class]]) { \
            self.textAlignment = [align integerValue]; \
        } \
        return self; \
    }; \
}

@implementation UIView (JHCategory)

- (void)setJh_x:(CGFloat)jh_x{
    CGRect frame = self.frame;
    frame.origin.x = jh_x;
    self.frame = frame;
}

- (CGFloat)jh_x{
    return self.frame.origin.x;
}

- (void)setJh_y:(CGFloat)jh_y{
    CGRect frame = self.frame;
    frame.origin.y = jh_y;
    self.frame = frame;
}

- (CGFloat)jh_y{
    return self.frame.origin.y;
}

- (void)setJh_w:(CGFloat)jh_w{
    CGRect frame = self.frame;
    frame.size.width = jh_w;
    self.frame = frame;
}

- (CGFloat)jh_w{
    return self.frame.size.width;
}

- (void)setJh_h:(CGFloat)jh_h{
    CGRect frame = self.frame;
    frame.size.height = jh_h;
    self.frame = frame;
}

- (CGFloat)jh_h{
    return self.frame.size.height;
}

- (void)setJh_center_x:(CGFloat)jh_center_x{
    CGPoint point = self.center;
    point.x = jh_center_x;
    self.center = point;
}

- (CGFloat)jh_center_x{
    return self.center.x;
}

- (void)setJh_center_y:(CGFloat)jh_center_y{
    CGPoint point = self.center;
    point.y = jh_center_y;
    self.center = point;
}

- (CGFloat)jh_center_y{
    return self.center.y;
}

- (void)setJh_origin:(CGPoint)jh_origin{
    CGRect frame = self.frame;
    frame.origin.x = jh_origin.x;
    frame.origin.y = jh_origin.y;
    self.frame = frame;
}

- (CGPoint)jh_origin{
    return self.frame.origin;
}

- (void)setJh_size:(CGSize)jh_size{
    CGRect frame = self.frame;
    frame.size.width  = jh_size.width;
    frame.size.height = jh_size.height;
    self.frame = frame;
}

- (CGFloat)jh_max_x{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)jh_max_y{
    return CGRectGetMaxY(self.frame);
}

- (CGSize)jh_size{
    return self.frame.size;
}

JH_tag_m(UIView)
JH_frame_m(UIView)
JH_bgColor_m(UIView)
JH_bdColor_m(UIView)
JH_bdWidth_m(UIView)
JH_cnRadius_m(UIView)
JH_mtBounds_m(UIView)
JH_addToView_m(UIView)

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
        return view.jh_x;
    }else if ([first isEqualToString:@"y"]){
        return view.jh_y;
    }else if ([first isEqualToString:@"w"]){
        return view.jh_w;
    }else if ([first isEqualToString:@"h"]){
        return view.jh_h;
    }else if ([first isEqualToString:@"maxx"]){
        return view.jh_max_x;
    }else if ([first isEqualToString:@"maxy"]){
        return view.jh_max_y;
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

- (CGSize)jhSizeFromString:(NSString *)sizeStr
{
    if ([sizeStr hasPrefix:@"["] && [sizeStr hasSuffix:@"]"] && sizeStr.length > 3)
    {
        sizeStr = [sizeStr substringWithRange:NSMakeRange(1, sizeStr.length - 2)];
        sizeStr = [sizeStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSArray *xTwoElementArr = [sizeStr componentsSeparatedByString:@","];
        if (xTwoElementArr.count != 2) return CGSizeZero;
        
        CGFloat X = [self jhFloatFromString:xTwoElementArr[0]];
        CGFloat Y = [self jhFloatFromString:xTwoElementArr[1]];
        
        return CGSizeMake(X, Y);
    }
    
    return CGSizeZero;
}

@end

@implementation UIColor (JHCategory)
+ (UIColor *)jhColor:(id)object{
    //16进制字符串
    if ([object isKindOfClass:[NSString class]]){
        return [self jhColorWithString:(NSString *)object];
    }
    //UIColor
    else if ([object isKindOfClass:[UIColor class]]){
        return (UIColor *)object;
    }
    
    return [UIColor blackColor];
}

+ (UIColor *)jhColorWithString:(NSString *)string{
    //删除字符串中的空格
    NSString *cString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    //长度是 6 或 8
    if ([cString length] < 6){
        return [UIColor clearColor];
    }
    
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]){
        cString = [cString substringFromIndex:2];
    }
    
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] != 6){
        return [UIColor blackColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:1.0];
}

@end

@implementation UIFont (JHCategory)
+ (UIFont *)jhFont:(id)object{
    //字符串 例如：17,s17,b17,i17
    if ([object isKindOfClass:[NSString class]]){
        return [self jhFontWithString:(NSString *)object];
    }
    //UIFont
    else if ([object isKindOfClass:[UIFont class]]){
        return (UIFont *)object;
    }
    
    return [UIFont systemFontOfSize:17.0];
}

+ (UIFont *)jhFontWithString:(NSString *)string{
    if ([self isPureInt:string] || [self isPureFloat:string]){
        return [UIFont systemFontOfSize:[string floatValue]];
    }else if ([string hasPrefix:@"s"]){
        if ([self jhFontWithSubstr:string]) {
            return [UIFont systemFontOfSize:[[string substringFromIndex:1] floatValue]];
        }else{
            return [UIFont systemFontOfSize:17.0];
        }
    }else if ([string hasPrefix:@"b"]){
        if ([self jhFontWithSubstr:string]) {
            return [UIFont boldSystemFontOfSize:[[string substringFromIndex:1] floatValue]];
        }else{
            return [UIFont systemFontOfSize:17.0];
        }
    }else if ([string hasPrefix:@"i"]){
        if ([self jhFontWithSubstr:string]) {
            return [UIFont italicSystemFontOfSize:[[string substringFromIndex:1] floatValue]];
        }else{
            return [UIFont systemFontOfSize:17.0];
        }
    }
    
    //默认
    return [UIFont systemFontOfSize:17.0];
}

//判断是否为整形
+ (BOOL)isPureInt:(NSString*)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形
+ (BOOL)isPureFloat:(NSString*)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

+ (BOOL)jhFontWithSubstr:(NSString *)string
{
    NSString *subStr = [string substringFromIndex:1];
    if ([self isPureInt:subStr] || [self isPureFloat:subStr]){
        return YES;
    }
    return NO;
}
@end

@implementation UILabel (JHCategory)
JH_tag_m(UILabel)
JH_text_m(UILabel)
JH_font_m(UILabel)
JH_align_m(UILabel)
JH_color_m(UILabel)
JH_frame_m(UILabel)
JH_bgColor_m(UILabel)
JH_bdColor_m(UILabel)
JH_bdWidth_m(UILabel)
JH_cnRadius_m(UILabel)
JH_mtBounds_m(UILabel)
JH_addToView_m(UILabel)

- (UILabel *(^)(id))jh_lines{
    JHLog();
    return ^id(id lines){
        if ([lines isKindOfClass:[NSNumber class]]) {
            self.numberOfLines = [lines integerValue];
        }
        return self;
    };
}

- (UILabel *(^)(id))jh_adjust{
    JHLog();
    return ^id(id adjust){
        if ([adjust isKindOfClass:[NSNumber class]]) {
            self.adjustsFontSizeToFitWidth = [adjust boolValue];
        }
        return self;
    };
}
@end

@implementation UITextField (JHCategory)
JH_tag_m(UITextField)
JH_text_m(UITextField)
JH_font_m(UITextField)
JH_align_m(UITextField)
JH_color_m(UITextField)
JH_frame_m(UITextField)
JH_bgColor_m(UITextField)
JH_bdColor_m(UITextField)
JH_bdWidth_m(UITextField)
JH_cnRadius_m(UITextField)
JH_mtBounds_m(UITextField)
JH_delegate_m(UITextField)
JH_addToView_m(UITextField)

- (UITextField *(^)(id))jh_bdStyle{
    JHLog();
    return ^id(id bdStyle){
        if ([bdStyle isKindOfClass:[NSNumber class]]) {
            self.borderStyle = [bdStyle integerValue];
        }
        return self;
    };
}
- (UITextField *(^)(id))jh_pHolder{
    JHLog();
    return ^id(id pHolder){
        if ([pHolder isKindOfClass:[NSString class]]) {
            self.placeholder = pHolder;
        }
        return self;
    };
}
- (UITextField *(^)(id))jh_cbMode{
    JHLog();
    return ^id(id cbMode){
        if ([cbMode isKindOfClass:[NSNumber class]]) {
            self.clearButtonMode = [cbMode integerValue];
        }
        return self;
    };
}
- (UITextField *(^)(id))jh_lvMode{
    JHLog();
    return ^id(id lvMode){
        if ([lvMode isKindOfClass:[NSNumber class]]) {
            self.leftViewMode = [lvMode integerValue];
        }
        return self;
    };
}
- (UITextField *(^)(id))jh_rvMode{
    JHLog();
    return ^id(id rvMode){
        if ([rvMode isKindOfClass:[NSNumber class]]) {
            self.rightViewMode = [rvMode integerValue];
        }
        return self;
    };
}
- (UITextField *(^)(id))jh_lfView{
    JHLog();
    return ^id(id lfView){
        if ([lfView isKindOfClass:[UIView class]]) {
            self.leftView = lfView;
        }
        return self;
    };
}
- (UITextField *(^)(id))jh_rtView{
    JHLog();
    return ^id(id rtView){
        if ([rtView isKindOfClass:[UIView class]]) {
            self.rightView = rtView;
        }
        return self;
    };
}
@end

@implementation UITextView (JHCategory)
JH_tag_m(UITextView)
JH_text_m(UITextView)
JH_font_m(UITextView)
JH_align_m(UITextView)
JH_color_m(UITextView)
JH_frame_m(UITextView)
JH_bgColor_m(UITextView)
JH_bdColor_m(UITextView)
JH_bdWidth_m(UITextView)
JH_cnRadius_m(UITextView)
JH_mtBounds_m(UITextView)
JH_delegate_m(UITextView)
JH_addToView_m(UITextView)
@end

@implementation UIButton (JHCategory)
JH_tag_m(UIButton)
JH_frame_m(UIButton)
JH_bgColor_m(UIButton)
JH_bdColor_m(UIButton)
JH_bdWidth_m(UIButton)
JH_cnRadius_m(UIButton)
JH_mtBounds_m(UIButton)
JH_addToView_m(UIButton)

- (UIButton *(^)(id))jh_title{
    JHLog();
    return ^id(id title){
        if ([title isKindOfClass:[NSString class]]) {
            [self setTitle:title forState:UIControlStateNormal];
        }
        return self;
    };
}

- (UIButton *(^)(id))jh_color{
    JHLog();
    return ^id(id color){
        if ([color isKindOfClass:[UIColor class]]) {
            [self setTitleColor:color forState:UIControlStateNormal];
        }else if ([color isKindOfClass:[NSString class]]){
            [self setTitleColor:[UIColor jhColor:color] forState:UIControlStateNormal];
        }
        return self;
    };
}

- (UIButton *(^)(id))jh_font{
    JHLog();
    return ^id(id font){
        if ([font isKindOfClass:[UIFont class]]) {
            self.titleLabel.font = font;
        }else if ([font isKindOfClass:[NSString class]]){
            self.titleLabel.font = [UIFont jhFont:font];
        }
        return self;
    };
}

- (UIButton *(^)(id,id,id))jh_target_selector_event{
    JHLog();
    return ^id(id target,id selector,id event){
        if (([target isKindOfClass:[UIViewController class]] ||
            [target isKindOfClass:[UIView class]]) &&
            [selector isKindOfClass:[NSString class]] &&
            [event isKindOfClass:[NSNumber class]]) {
            [self addTarget:target action:NSSelectorFromString(selector) forControlEvents:[event unsignedIntegerValue]];
        }
        return self;
    };
}
@end

@implementation UITableView (JHCategory)
JH_tag_m(UITableView)
JH_frame_m(UITableView)
JH_bgColor_m(UITableView)
JH_bdColor_m(UITableView)
JH_bdWidth_m(UITableView)
JH_cnRadius_m(UITableView)
JH_mtBounds_m(UITableView)
JH_delegate_m(UITableView)
JH_addToView_m(UITableView)
@end

@implementation UIScrollView (JHCategory)
JH_tag_m(UIScrollView)
JH_frame_m(UIScrollView)
JH_bgColor_m(UIScrollView)
JH_bdColor_m(UIScrollView)
JH_bdWidth_m(UIScrollView)
JH_cnRadius_m(UIScrollView)
JH_mtBounds_m(UIScrollView)
JH_delegate_m(UIScrollView)
JH_addToView_m(UIScrollView)

- (UIScrollView *(^)(id))jh_contentSize{
    JHLog();
    return ^id(id contentSize){
        if ([contentSize isKindOfClass:[NSValue class]]) {
            self.contentSize = [contentSize CGSizeValue];
        }else if ([contentSize isKindOfClass:[NSString class]]){
            if ([contentSize hasPrefix:@"{"]) {
                self.contentSize = CGSizeFromString(contentSize);
            }else if ([contentSize hasPrefix:@"["]){
                self.contentSize = [self.superview jhSizeFromString:contentSize];
            }else{
                self.frame = CGRectZero;
            }
        }
        return self;
    };
}
@end
