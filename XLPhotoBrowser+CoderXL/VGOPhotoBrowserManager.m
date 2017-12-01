//
//  VGOPhotoBrowserManager.m
//  sneakerheadAppiOS
//
//  Created by Joe on 2017/9/29.
//  Copyright © 2017年 杨鹏. All rights reserved.
//

#import "VGOPhotoBrowserManager.h"
#import "XLPhotoBrowser.h"

@interface VGOPhotoBrowserManager ()<XLPhotoBrowserDelegate, XLPhotoBrowserDatasource>
@property (nonatomic,assign) NSInteger currentImageIndex;
@property (nonatomic,strong) NSArray *urlList;
@property (nonatomic,strong) NSArray *imageList;
@property (nonatomic,strong) UIView *fromView;

@end

@implementation VGOPhotoBrowserManager
IMPLEMENTATION_SINGLETON(VGOPhotoBrowserManager)

-(void)showFrom:(UIView *)fromView WithCurrentImageIndex:(NSInteger)currentImageIndex urlList:(NSArray *)urlList imageList:(NSArray *)imageList{
    self.urlList = urlList;
    self.currentImageIndex = currentImageIndex;
    self.fromView = fromView;
    self.imageList = imageList;
    // 快速创建并进入浏览模式
//    XLPhotoBrowser *browser = [XLPhotoBrowser showPhotoBrowserWithCurrentImageIndex:currentImageIndex imageCount:urlList.count datasource:self];
    XLPhotoBrowser *browser = [XLPhotoBrowser showPhotoBrowserWithImages:imageList currentImageIndex:currentImageIndex];
    
    // 设置长按手势弹出的地步ActionSheet数据,不实现此方法则没有长按手势
    [browser setActionSheetWithTitle:nil delegate:self cancelButtonTitle:nil deleteButtonTitle:nil otherButtonTitles:@"保存图片",nil];
    
    // 自定义一些属性
    browser.pageDotColor = [UIColor whiteColor]; ///< 此属性针对动画样式的pagecontrol无效
    browser.currentPageDotColor = [UIColor lightGrayColor];
    browser.pageControlStyle = XLPhotoBrowserPageControlStyleAnimated;///< 修改底部pagecontrol的样式为系统样式,默认是弹性动画的样式
    
}

/**
 *  返回这个位置的占位图片 , 也可以是原图(如果不实现此方法,会默认使用placeholderImage)
 *
 *  @param browser 浏览器
 *  @param index   位置索引
 *
 *  @return 占位图片
 */
- (UIImage *)photoBrowser:(XLPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    return self.imageList[index];
}

/**
 *  返回指定位置图片的UIImageView,用于做图片浏览器弹出放大和消失回缩动画等
 *  如果没有实现这个方法,没有回缩动画,如果传过来的view不正确,可能会影响回缩动画效果
 *
 *  @param browser 浏览器
 *  @param index   位置索引
 *
 *  @return 展示图片的容器视图,如UIImageView等
 */
- (UIView *)photoBrowser:(XLPhotoBrowser *)browser sourceImageViewForIndex:(NSInteger)index
{
    if ([self.fromView isKindOfClass:[UICollectionView class]]) {
        UICollectionViewCell *cell = [(UICollectionView *)self.fromView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
        for (UIView *subView in cell.contentView.subviews) {
            if ([subView isKindOfClass:[UIImageView class]]) {
                return subView;
            }
        }
        return cell;
    }
   
    return self.fromView.subviews[0];
}

/**
 *  返回指定位置的高清图片URL
 *
 *  @param browser 浏览器
 *  @param index   位置索引
 *
 *  @return 返回高清大图索引
 */
- (NSURL *)photoBrowser:(XLPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSString *picName = self.urlList[index];
    return [NSURL URLWithString:picName];
}

#pragma mark    -   XLPhotoBrowserDelegate

- (void)photoBrowser:(XLPhotoBrowser *)browser clickActionSheetIndex:(NSInteger)actionSheetindex currentImageIndex:(NSInteger)currentImageIndex
{
    // do something yourself
    switch (actionSheetindex) {
        case 0: // 保存
        {
            NSLog(@"点击了actionSheet索引是:%zd , 当前展示的图片索引是:%zd",actionSheetindex,currentImageIndex);
            [browser saveCurrentShowImage];
        }
            break;
        default:
        {
            NSLog(@"点击了actionSheet索引是:%zd , 当前展示的图片索引是:%zd",actionSheetindex,currentImageIndex);
        }
            break;
    }
}

@end
