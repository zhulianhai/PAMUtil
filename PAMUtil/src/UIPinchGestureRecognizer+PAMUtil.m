//
//  UIPinchGestureRecognizer+PAMUtil.m
//  4sqPhoto
//
//  Created by tak on 2014/02/11.
//  Copyright (c) 2014年 taktamur. All rights reserved.
//

#import "UIPinchGestureRecognizer+PAMUtil.h"
@implementation UIPinchGestureRecognizer (PAMUtil)
-(PAMPinchGestureZoomStatus)pam_zoomStatus
{
    return self.scale > 1.0 ? PAMPinchGestureZoomStatusZoomIn : PAMPinchGestureZoomStatusZoomOut;
}
-(CGFloat)pam_transitionProgressWithZoomStatus:(PAMPinchGestureZoomStatus)zoomStatus
{
    CGFloat progress = 0.0;
    switch (zoomStatus) {
        case PAMPinchGestureZoomStatusZoomIn:
            // 拡大中 scaleの1.0〜2.0をprogressの0.0〜1.0にマッピング
            progress = self.scale - 1.0;
            break;
        case PAMPinchGestureZoomStatusZoomOut:
            // 縮小中 scaleの1.0〜0.5をprogressの0.0〜1.0にマッピング
            progress = 2.0 - 2.0*self.scale;
            break;
    }
    // はみ出してるところを丸める
    progress = progress > 1.0 ? 1.0 : progress;
    progress = progress < 0.0 ? 0.0 : progress;
    return progress;
}

@end
