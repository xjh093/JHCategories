//
//  UIView+JHCategory.h
//  JHKit
//
//  Created by HaoCold on 16/8/18.
//  Copyright © 2016年 HaoCold. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef DEBUG
#define JHLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define JHLog(...)
#endif

#define JH_bdColor_h(jhclass)     - (jhclass *(^)(id))jh_bdColor;
#define JH_bdWidth_h(jhclass)     - (jhclass *(^)(id))jh_bdWidth;
#define JH_cnRadius_h(jhclass)    - (jhclass *(^)(id))jh_cnRadius;
#define JH_mtBounds_h(jhclass)    - (jhclass *(^)(id))jh_mtBounds;
#define JH_addToView_h(jhclass)   - (jhclass *(^)(id))jh_addToView;
#define JH_frame_h(jhclass)       - (jhclass *(^)(id))jh_frame;
#define JH_bgColor_h(jhclass)     - (jhclass *(^)(id))jh_bgColor;
#define JH_tag_h(jhclass)         - (jhclass *(^)(id))jh_tag;
#define JH_delegate_h(jhclass)    - (jhclass *(^)(id))jh_delegate;
#define JH_text_h(jhclass)        - (jhclass *(^)(id))jh_text;
#define JH_color_h(jhclass)       - (jhclass *(^)(id))jh_color;
#define JH_font_h(jhclass)        - (jhclass *(^)(id))jh_font;
#define JH_align_h(jhclass)       - (jhclass *(^)(id))jh_align;

@interface UIView (JHCategory)
@property (assign, nonatomic) CGFloat jh_x;                 /**< 原点x*/
@property (assign, nonatomic) CGFloat jh_y;                 /**< 原点y*/
@property (assign, nonatomic) CGFloat jh_w;                 /**< 宽度w*/
@property (assign, nonatomic) CGFloat jh_h;                 /**< 高度h*/

@property (assign, nonatomic) CGFloat jh_center_x;          /**< 中心点x*/
@property (assign, nonatomic) CGFloat jh_center_y;          /**< 中心点y*/

@property (assign, nonatomic) CGPoint jh_origin;            /**< 原点*/
@property (assign, nonatomic) CGSize  jh_size;              /**< 大小*/

@property (assign, nonatomic, readonly) CGFloat jh_max_x;   /**< 原点x + 宽度w*/
@property (assign, nonatomic, readonly) CGFloat jh_max_y;   /**< 原点y + 宽度h*/

JH_tag_h(UIView)
JH_frame_h(UIView)
JH_bgColor_h(UIView)
JH_bdColor_h(UIView)
JH_bdWidth_h(UIView)
JH_cnRadius_h(UIView)
JH_mtBounds_h(UIView)
JH_addToView_h(UIView)

- (CGRect)jhRectFromString:(NSString *)frameStr;  /**< frameStr:[x:value,y:value,w:value,h:value] */
@end

@interface UIColor (JHCategory)
+ (UIColor *)jhColor:(id)object;
@end

@interface UIFont (JHCategory)
+ (UIFont *)jhFont:(id)object;
@end

@interface UILabel (JHCategory)

JH_tag_h(UILabel)
JH_text_h(UILabel)
JH_font_h(UILabel)
JH_align_h(UILabel)
JH_color_h(UILabel)
JH_frame_h(UILabel)
JH_bgColor_h(UILabel)
JH_bdColor_h(UILabel)
JH_bdWidth_h(UILabel)
JH_cnRadius_h(UILabel)
JH_mtBounds_h(UILabel)
JH_addToView_h(UILabel)

- (UILabel *(^)(id))jh_lines;     /**< NSNumber */
- (UILabel *(^)(id))jh_adjust;    /**< NSNumber @(YES),@(NO)*/
@end

@interface UITextField (JHCategory)

JH_tag_h(UITextField)
JH_text_h(UITextField)
JH_font_h(UITextField)
JH_align_h(UITextField)
JH_color_h(UITextField)
JH_frame_h(UITextField)
JH_bgColor_h(UITextField)
JH_bdColor_h(UITextField)
JH_bdWidth_h(UITextField)
JH_cnRadius_h(UITextField)
JH_mtBounds_h(UITextField)
JH_delegate_h(UITextField)
JH_addToView_h(UITextField)

- (UITextField *(^)(id))jh_bdStyle;
- (UITextField *(^)(id))jh_pHolder;
- (UITextField *(^)(id))jh_cbMode;
- (UITextField *(^)(id))jh_lvMode;
- (UITextField *(^)(id))jh_rvMode;
- (UITextField *(^)(id))jh_lfView;
- (UITextField *(^)(id))jh_rtView;

@end

@interface UITextView (JHCategory)

JH_tag_h(UITextView)
JH_text_h(UITextView)
JH_font_h(UITextView)
JH_align_h(UITextView)
JH_color_h(UITextView)
JH_frame_h(UITextView)
JH_bgColor_h(UITextView)
JH_bdColor_h(UITextView)
JH_bdWidth_h(UITextView)
JH_cnRadius_h(UITextView)
JH_mtBounds_h(UITextView)
JH_delegate_h(UITextView)
JH_addToView_h(UITextView)

@end

@interface UIButton (JHCategory)

JH_tag_h(UIButton)
JH_frame_h(UIButton)
JH_bgColor_h(UIButton)
JH_bdColor_h(UIButton)
JH_bdWidth_h(UIButton)
JH_cnRadius_h(UIButton)
JH_mtBounds_h(UIButton)
JH_addToView_h(UIButton)

- (UIButton *(^)(id))jh_title;
- (UIButton *(^)(id))jh_color;
- (UIButton *(^)(id))jh_font;
- (UIButton *(^)(id,id,id))jh_target_selector_event;
@end

@interface UITableView (JHCategory)

JH_tag_h(UITableView)
JH_frame_h(UITableView)
JH_bgColor_h(UITableView)
JH_bdColor_h(UITableView)
JH_bdWidth_h(UITableView)
JH_cnRadius_h(UITableView)
JH_mtBounds_h(UITableView)
JH_delegate_h(UITableView)
JH_addToView_h(UITableView)

@end

@interface UIScrollView (JHCategory)

JH_tag_h(UIScrollView)
JH_frame_h(UIScrollView)
JH_bgColor_h(UIScrollView)
JH_bdColor_h(UIScrollView)
JH_bdWidth_h(UIScrollView)
JH_cnRadius_h(UIScrollView)
JH_mtBounds_h(UIScrollView)
JH_delegate_h(UIScrollView)
JH_addToView_h(UIScrollView)

- (UIScrollView *(^)(id))jh_contentSize;

@end

