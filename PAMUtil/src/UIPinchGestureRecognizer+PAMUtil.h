//
//  UIPinchGestureRecognizer+PAMUtil.h
//  4sqPhoto
//
//  Created by tak on 2014/02/11.
//  Copyright (c) 2014年 taktamur. All rights reserved.
//

#import <UIKit/UIKit.h>



// このジェスチャーが拡大してるのか縮小しているのか
typedef enum PAMPinchGestureZoomStatus:NSUInteger{
    PAMPinchGestureZoomStatusZoomIn,  // 拡大
    PAMPinchGestureZoomStatusZoomOut, // 縮小
}PAMPinchGestureZoomStatus;


@interface UIPinchGestureRecognizer (PAMUtil)
// 拡大中か縮小中か
@property(readonly)PAMPinchGestureZoomStatus pam_zoomStatus;
// transitionLayout.transitionProgress に値をそのまま突っ込めるように、
// 拡大中縮小中にあわせて、scale(0.5〜2.0)をprogress(0.0〜1.0)に変換する
-(CGFloat)pam_transitionProgressWithZoomStatus:(PAMPinchGestureZoomStatus)zoomStatus;
@end
