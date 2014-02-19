//
//  UICollectionViewFlowLayout+PAMUtil.m
//  4sqPhoto
//
//  Created by tak on 2014/02/11.
//  Copyright (c) 2014年 taktamur. All rights reserved.
//

#import "UICollectionViewFlowLayout+PAMUtil.h"

@implementation UICollectionViewFlowLayout (PAMUtil)
+(UICollectionViewFlowLayout *)layoutWithHorizontalItemCount:(NSUInteger)count
{
    NSAssert(count!=0, @"zero count");
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumInteritemSpacing=1.0;
    layout.minimumLineSpacing=1.0;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    layout.itemSize=CGSizeMake(310/count,310/count);
    layout.headerReferenceSize = CGSizeMake(screenWidth,50);
    CGFloat itemSize = screenWidth/count - 1;
    layout.itemSize = CGSizeMake(itemSize,itemSize);
    return layout;
}

@end
