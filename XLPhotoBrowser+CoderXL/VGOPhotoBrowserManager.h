//
//  VGOPhotoBrowserManager.h
//  sneakerheadAppiOS
//
//  Created by Joe on 2017/9/29.
//  Copyright © 2017年 杨鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VGOPhotoBrowserManager : NSObject
INTERFACE_SINGLETON(VGOPhotoBrowserManager)

//fromView:点击的View的父控件
//currentImageIndex：点击的View所在的index
//urlList：大图的数组
//imageList：小图的数组
-(void)showFrom:(UIView *)fromView WithCurrentImageIndex:(NSInteger)currentImageIndex urlList:(NSArray *)urlList imageList:(NSArray *)imageList;


@end
