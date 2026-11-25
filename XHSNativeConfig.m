//
//  XHSNative
//
//  Copyright (c) 2026 huami. All rights reserved.
//  Channel: @huamidev
//  Created on: 2026/11/24
//
#import "XHSNativeConfig.h"

NSString *const kXHSNativeSearchTab = @"XHSNative.searchTab";
NSString *const kXHSNativeMinimize = @"XHSNative.minimize";
NSString *const kXHSNativeHideDiandian = @"XHSNative.hideDiandian";
NSString *const kXHSNativeSearchTopLeft = @"XHSNative.searchTopLeft";
NSString *const kXHSNativeGlassNote = @"XHSNative.glass.note";
NSString *const kXHSNativeGlassSearch = @"XHSNative.glass.search";
NSString *const kXHSNativeGlassComments = @"XHSNative.glass.comments";
NSString *const kXHSNativeGlassProfile = @"XHSNative.glass.profile";
NSString *const kXHSNativeGlassChat = @"XHSNative.glass.chat";
NSString *const kXHSNativeGlassMessages = @"XHSNative.glass.messages";
NSString *const kXHSNativeGlassVideo = @"XHSNative.glass.video";

NSString *const kXHSNativeBarHome = @"home";
NSString *const kXHSNativeBarNoteTop = @"noteTop";
NSString *const kXHSNativeBarNoteBottom = @"noteBottom";
NSString *const kXHSNativeBarVideoTop = @"videoTop";
NSString *const kXHSNativeBarVideoBottom = @"videoBottom";
NSString *const kXHSNativeBarComment = @"comment";
NSString *const kXHSNativeBarProfile = @"profile";

static NSString *const kTabOrder = @"XHSNative.tabOrder";
static NSString *const kTabHidden = @"XHSNative.tabHidden";
static NSString *const kFillPrefix = @"XHSNative.fill.";

@implementation XHSNativeConfig

+ (instancetype)shared {
    static XHSNativeConfig *config;
    static dispatch_once_t once;
    dispatch_once(&once, ^{ config = [XHSNativeConfig new]; });
    return config;
}

+ (NSArray<NSString *> *)allTabs {
    return @[@"index", @"shopping", @"message", @"me"];
}

- (BOOL)boolForKey:(NSString *)key {
    id value = [NSUserDefaults.standardUserDefaults objectForKey:key];
    return value ? [value boolValue] : YES;
}

- (void)setBool:(BOOL)value forKey:(NSString *)key {
    [NSUserDefaults.standardUserDefaults setBool:value forKey:key];
}

- (NSArray<NSString *> *)tabOrder {
    NSArray<NSString *> *all = XHSNativeConfig.allTabs;
    NSMutableArray<NSString *> *order = [NSMutableArray array];
    for (NSString *name in [NSUserDefaults.standardUserDefaults stringArrayForKey:kTabOrder])
        if ([all containsObject:name] && ![order containsObject:name]) [order addObject:name];
    for (NSString *name in all)
        if (![order containsObject:name]) [order addObject:name];
    return order;
}

- (void)setTabOrder:(NSArray<NSString *> *)order {
    [NSUserDefaults.standardUserDefaults setObject:order forKey:kTabOrder];
}

- (BOOL)isTabHidden:(NSString *)name {
    if ([name isEqualToString:@"index"]) return NO;  // 首页不能藏，发布和搜索都挂在它上面
    return [[NSUserDefaults.standardUserDefaults stringArrayForKey:kTabHidden] containsObject:name];
}

- (void)setTab:(NSString *)name hidden:(BOOL)hidden {
    NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
    NSMutableArray<NSString *> *names = [([defaults stringArrayForKey:kTabHidden] ?: @[]) mutableCopy];
    [names removeObject:name];
    if (hidden) [names addObject:name];
    [defaults setObject:names forKey:kTabHidden];
}

- (CGFloat)fillForBar:(NSString *)bar {
    id value = [NSUserDefaults.standardUserDefaults objectForKey:[kFillPrefix stringByAppendingString:bar]];
    if (value) return MIN(MAX([value doubleValue], 0), 100);
    // 笔记底栏下面滚的是评论文字，默认压一半，其余默认纯玻璃
    return [bar isEqualToString:kXHSNativeBarNoteBottom] ? 50 : 0;
}

- (void)setFill:(CGFloat)fill forBar:(NSString *)bar {
    [NSUserDefaults.standardUserDefaults setDouble:fill forKey:[kFillPrefix stringByAppendingString:bar]];
}

- (void)reset {
    NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
    for (NSString *key in defaults.dictionaryRepresentation.allKeys)
        if ([key hasPrefix:@"XHSNative."]) [defaults removeObjectForKey:key];
}

@end
