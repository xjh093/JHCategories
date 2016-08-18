//
//  UIView+JHCategory.h
//  JHKit
//
//  Created by HaoCold on 16/8/18.
//  Copyright © 2016年 HaoCold. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JHCategory)
- (CGRect)jhRectFromString:(NSString *)frameStr;  /**< frameStr:[x:value,y:value,w:value,h:value] */
@end
