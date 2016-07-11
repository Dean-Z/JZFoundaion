//
//  JZFounation.h
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#ifndef JZFounation_h
#define JZFounation_h

#define JZSCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define JZSCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

#define JZNotificationCenter [NSNotificationCenter defaultCenter]

// Color func
#define JZRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define JZRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define JZRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define JZClearColor [UIColor clearColor]

// NSLog
#ifdef DEBUG
#define JZLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#endif

// Self
#define JZWeakSelf(type)    __weak typeof(type) weak##type = type;
#define JZStrongSelf(type)  __strong typeof(type) type = weak##type;

// View layer

#define JZViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];

#define JZViewBorder(View, Width, Color)\
\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#define JZViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//view frame
#define JZGetViewWidth(view)  view.frame.size.width
#define JZGetViewHeight(view) view.frame.size.height
#define JZGetViewX(view)      view.frame.origin.x
#define JZGetViewY(view)      view.frame.origin.y

//ImageView
#define JZGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

// Radian
#define JZDegreesToRadian(x) (M_PI * (x) / 180.0)
#define JZRadianToDegrees(radian) (radian*180.0)/(M_PI)

// Device
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
// system version
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS_VERSION_LATER(x) (([[[UIDevice currentDevice] systemVersion] floatValue] >x)? (YES):(NO))

// Directory Path
#define JZPathTemp NSTemporaryDirectory()
#define JZPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define JZPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

// GCD
#define JZDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
#define JZDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
#define JZDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

#endif /* JZFounation_h */
