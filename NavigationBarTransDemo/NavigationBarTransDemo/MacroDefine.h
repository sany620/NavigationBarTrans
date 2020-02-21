//
//  MacroDefine.h
//  NavigationBarTransDemo
//
//  Created by apple on 2020/2/21.
//  Copyright © 2020 duanmu. All rights reserved.
//

#ifndef MacroDefine_h
#define MacroDefine_h


#ifdef __OBJC__

#import "FDDeviceConfig.h"

#endif

//导航栏高度
#define  MANavBarHeight  (IS_IphoneX ? 88 : 64)


/* ------判断设备类型是否iPhoneXS Max，iPhoneXS，iPhoneXR，iPhoneX------*/
#define IS_IphoneX (([FDDeviceConfig iPhoneXSeries]))

//屏幕宽高
#define kScreenW [[UIScreen mainScreen] bounds].size.width
#define kScreenH [[UIScreen mainScreen] bounds].size.height


#ifndef XM_DYNAMIC_PROPERTY_OBJECT
#define XM_DYNAMIC_PROPERTY_OBJECT(_getter_ , _setter_ , _associated_, _type_)\
- (void) _setter_ : (_type_) object{ \
[self willChangeValueForKey:@#_getter_];\
objc_setAssociatedObject(self, _cmd, object, OBJC_ASSOCIATION_ ## _associated_ ## _NONATOMIC); \
[self didChangeValueForKey:@#_getter_];\
}\
- (_type_)_getter_{\
return objc_getAssociatedObject(self , @selector(_setter_:));\
}
#endif


#endif /* MacroDefine_h */
