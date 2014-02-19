//
//  UIView+Util.m
//  4sqPhoto
//
//  Created by tak on 2014/01/29.
//  Copyright (c) 2014年 taktamur. All rights reserved.
//

#import "UIKit+Util.h"

#pragma mark - UIView
@implementation UIView (Util)

-(NSArray *)viewsFromSubviewsByMatchProtocol:(Protocol *)protocol
{
    // 1. 配列subviewsの中身を１つずつUIViewとして取り出す
    // 2-a. それがプロトコルを実装していればそれの入った配列を用意
    // 2-b. それがプロトコルを実装していなければ空の配列を用意
    // 3. 2.の配列とくっつけながら、再帰呼び出しして結果を配列で返す
    // 4. flattenで配列を整える
    return _.array(self.subviews).map(^NSArray *(UIView *view){
        NSArray *conformedViews =[view conformsToProtocol:protocol] ? @[view] : @[];
        return @[ conformedViews, [view viewsFromSubviewsByMatchProtocol:protocol]];
    }).flatten.unwrap;
}

-(void)setGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    // すでに登録済みのジェスチャーを削除
    _.array(self.gestureRecognizers).each(^(UIGestureRecognizer *gesture){
        [self removeGestureRecognizer:gesture];
    });
    // 指定されたジェスチャーを登録
    [self addGestureRecognizer:gestureRecognizer];
}
@end


#pragma mark - UISearchBar
@interface UISearchBar()
@property(nonatomic,readonly)id<UITextInputTraits> textField;
@end
@implementation UISearchBar(Util)
-(void)setEnablesReturnKeyAutomatically:(BOOL)enablesReturnKeyAutomatically
{
    self.textField.enablesReturnKeyAutomatically=enablesReturnKeyAutomatically;
}
-(BOOL)enablesReturnKeyAutomatically
{
    return self.textField.enablesReturnKeyAutomatically;
}

-(id<UITextInputTraits>)textField
{
    NSArray *textFields = [self viewsFromSubviewsByMatchProtocol:@protocol(UITextInputTraits)];
    return textFields[0];
}

@end


@implementation UICollectionViewController (Util)
-(void)setRefreshControl:(UIRefreshControl *)refreshControl
{
    UIRefreshControl *oldRefreshControl = self.refreshControl;
    if( oldRefreshControl != refreshControl ){
        if( oldRefreshControl != nil ){ [oldRefreshControl removeFromSuperview]; }
        [self.collectionView addSubview:refreshControl];
    }
    self.collectionView.alwaysBounceVertical = YES;
}
-(UIRefreshControl *)refreshControl
{
    for (UIView *view in self.collectionView.subviews ) {
        if( [view isKindOfClass:[UIRefreshControl class]]){
            return (UIRefreshControl *)view;
        }
    }
    return nil;
}
@end

@implementation UICollectionView(Util)
-(void)registerNibWithClass:(Class)aClass
{
    NSString *identifier = NSStringFromClass(aClass);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self registerNib:nib forCellWithReuseIdentifier:identifier];
}
-(void)registerNibWithClass:(Class)aClass
 forSupplementaryViewOfKind:(NSString *)kind
{
    NSString *identifier = NSStringFromClass(aClass);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self registerNib:nib forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
}

// コレを使う場合は、xibファイルのviewのIdentifierにクラス名を設定しておく。
-(id)dequeueReusableCellWithClass:(Class)aClass
                     forIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = NSStringFromClass(aClass);
    return [self dequeueReusableCellWithReuseIdentifier:identifier
                                           forIndexPath:indexPath];
}
-(id)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind
                                  withClass:(Class)aClass
                               forIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifire = NSStringFromClass(aClass);
    return [self dequeueReusableSupplementaryViewOfKind:elementKind
                                    withReuseIdentifier:identifire
                                           forIndexPath:indexPath];
}
@end



@implementation NSIndexPath(Util)

+(NSArray *)arrayWithSection:(NSUInteger)section
                 andRowCount:(NSUInteger)rowCount
{
    NSMutableArray *deleteRows = [NSMutableArray new];
    for(NSUInteger row=0; row<rowCount; row++ ){
        [deleteRows addObject:[NSIndexPath indexPathForRow:row inSection:section]];
    }
    return deleteRows;
}

@end

