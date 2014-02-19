//
//  FSPUtil.m
//  4sqPhoto
//
//  Created by tak on 2014/01/18.
//  Copyright (c) 2014年 taktamur. All rights reserved.
//

#import "FSPUtil.h"

#import <objc/runtime.h>

@implementation FSPUtil

@end


@implementation NSArray(Util)

+(void)load
{
    // FIXME: デバッグ時のみ
    Method originMethod = class_getInstanceMethod([NSArray class], @selector(description));
    Method swizzMethod  = class_getInstanceMethod([NSArray class], @selector(swizz_description));
    method_exchangeImplementations(originMethod, swizzMethod);
}

-(NSString *)swizz_description{
//    return [self swizz_description];
    NSMutableString *desc = [NSMutableString new];
    [desc appendString:@"(\n"];
    for (NSObject *obj in self) {
        [desc appendString:[NSString stringWithFormat:@"    \"%@\",\n",obj]];
    }
    [desc appendString:@")\n"];
    return [desc copy];
}
@end

