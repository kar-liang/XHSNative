//
//  XHSNative
//
//  Copyright (c) 2026 huami. All rights reserved.
//  Channel: @huamidev
//  Created on: 2026/11/24
//
#import <UIKit/UIKit.h>

@interface XYTabbarController : UITabBarController
- (UIControl *)centerButton;
- (UIView *)customtabBar;
- (NSDictionary<NSNumber *, NSString *> *)badgeValueDict;
- (void)setBadgeValue:(NSString *)value forItemAtIndex:(NSInteger)index;
@end

@interface UITabBarItem (XHSBadge)
- (void)_updateViewBadge;
@end

// 单元格按这个范围决定留不留，负数是比 bounds 往外扩
@interface UICollectionView (XHSVisibleRect)
- (UIEdgeInsets)_visibleRectEdgeInsets;
- (void)_setVisibleRectEdgeInsets:(UIEdgeInsets)insets;
@end

@interface XYPHHomeTabbarController : XYTabbarController <UITabBarControllerDelegate>
@end

@interface XYPHNavigationViewController : UINavigationController
@end

@interface XYMHomeViewController : UIViewController
- (id)dataSource;
@end

// 首页的频道页：0 关注 1 发现 2 同城
@interface NSObject (XYHomeChannel)
- (NSUInteger)childVCPageName;
@end

@interface XYMHomeNaviBar : UIView
- (UIImageView *)background;
@end

@interface XYMHomeLayoutAdapter : NSObject
@end

@interface XYEXLiquidGlassNavigationAdapter : NSObject
@end

@interface XYLiquidGlass : NSObject
@end

@interface XYFollowBtn : UIButton
@end

@interface XYPMMessageCenterViewController : UIViewController
@end

@interface XYPFProfileViewController : UIViewController
@end

@interface XYSettingBaseViewController : UIViewController
- (UITableView *)tableView;
- (id)navBar;
- (id)vm;
@end

@interface XYPHSettingViewController : XYSettingBaseViewController
@end

@interface XYPHSettingTableViewModel : NSObject
- (id)blank;
@end

@interface XYPHNoteShareController : UIViewController
@end

@interface XYPHWebPageShareController : UIViewController
@end

@interface XYPHUserShareController : UIViewController
@end

// 下面几个是 Swift 类，真名在 %ctor 里对上
@interface XYMainFrameEntranceConfig : NSObject
@end

@interface XYMainFrameLeftCache : NSObject
@end

@interface XYHomeDotsSwipeInstaller : NSObject
@end

@interface XYHomeService : NSObject
@end

@interface XYMHomeDataSource : NSObject
- (NSArray *)childViewModels;
@end

@interface XYNativeSearchBar : UIView
@property (nonatomic) BOOL usesLiquidGlass;
@end

@interface XYPFProfileV2NavigationBar : UIView
- (UIView *)homeMenuButton;
- (UIView *)shareButton;
- (UIView *)scanButton;
- (UIView *)editButton;
- (BOOL)usesDuoNavigation;
@end

@interface XYPMChatBaseViewController : UIViewController
- (BOOL)isFloating;
@end

@interface XYCommentHalfBar : UIView
@end

@interface XYDeviceUtility : NSObject
@end

@interface XYMarketRootInterface : UIViewController
@end

@interface XYNoteDetailPage : UIViewController
@end

@interface XYLottieAnimationButton : UIButton
- (UIView *)lottieMaskView;
@end

@interface XYNoteInteractionView : UIView
- (XYLottieAnimationButton *)likeButton;
@end

@interface XYNoteDirectionView : UIView
@end

@interface XYNoteImageView : UIView
@end

// 笔记页的图片轮播（XYNoteBasic.ImageBrowser）和它的双指放大（XYNoteBasic.PinchController）
@interface NSObject (XYNoteImageBrowser)
- (id)multiRegesture;
- (id)pinchController;
- (BOOL)installed;
- (BOOL)inTransform;
- (CGFloat)maxScale;
- (UIGestureRecognizer *)recognizer;
- (void)setRecognizer:(UIGestureRecognizer *)recognizer;
- (void)didReceivePinchWithRecognizer:(UIGestureRecognizer *)recognizer;
@end

@interface XYVFHeadView : UIView
@end

@interface XYVFBottomEngageView : UIView
@end

@interface XHSNativeSettingsPage : XYSettingBaseViewController
@property (nonatomic, strong) id model;
@property (nonatomic, copy) NSString *mode;  // 空：主页面；order：标签顺序；其余是某一处玻璃的名字，选它的不透明度
- (void)reloadRows;
@end
