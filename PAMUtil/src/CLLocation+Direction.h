//
//  CLLocation+Direction.h
//  4sqPhoto
//
//  Created by tak on 2014/01/28.
//  Copyright (c) 2014年 taktamur. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (Direction)
-(CLLocationDirection)aboutAzimuthToLocation:(CLLocation *)target;
@end
