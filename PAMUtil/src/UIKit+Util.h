//
//  UIView+Util.h
//  4sqPhoto
//
//  Created by tak on 2014/01/29.
//  Copyright (c) 2014年 taktamur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Util)
-(NSArray *)viewsFromSubviewsByMatchProtocol:(Protocol *)protocol;
-(void)setGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer;

@end

// http://life-book.co.jp/delivery/?p=767
@interface UISearchBar(Util)
@property(nonatomic)BOOL enablesReturnKeyAutomatically;
@end

@interface UICollectionViewController(Util)
@property(nonatomic)UIRefreshControl *refreshControl;
@end

@interface UICollectionView(Util)
-(void)registerNibWithClass:(Class)aClass;
-(void)registerNibWithClass:(Class)aClass
 forSupplementaryViewOfKind:(NSString *)kind;

-(id)dequeueReusableCellWithClass:(Class)aClass
                     forIndexPath:(NSIndexPath *)indexPath;
-(id)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind
                                  withClass:(Class)aClass
                               forIndexPath:(NSIndexPath *)indexPath;
@end


@interface NSIndexPath(Util)
+(NSArray *)arrayWithSection:(NSUInteger)section
                 andRowCount:(NSUInteger)rowCount;
@end