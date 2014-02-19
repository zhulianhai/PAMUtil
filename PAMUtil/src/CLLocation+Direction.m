//
//  CLLocation+Direction.m
//  4sqPhoto
//
//  Created by tak on 2014/01/28.
//  Copyright (c) 2014年 taktamur. All rights reserved.
//

#import "CLLocation+Direction.h"

@implementation CLLocation (Direction)
-(CLLocationDirection)aboutAzimuthToLocation:(CLLocation *)target
{
    // 北を0とした、だいたいの方向を算出
    CLLocationDegrees dx = target.coordinate.longitude - self.coordinate.longitude;
    CLLocationDegrees dy = target.coordinate.latitude - self.coordinate.latitude;
    CLLocationDirection d = atan2(dx,dy)*(180.0/M_PI);
    d = d<0.0 ? d+360 : d;
    return d;
    
}

@end
