//
//  NSObject+RSErrorKit.h
//  RSErrorKit
//
//  Created by Dave Meehan on 28/10/2013.
//  Copyright (c) 2013 Replicated Solutions Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RSErrorHandler)(NSError *error);

@interface NSObject (RSErrorKit)

+(NSString *)errorDomain;

-(NSError *)errorWithCode:(NSInteger)code underlyingError:(NSError *)underlyingError errorHandler:(RSErrorHandler)errorHandler;

@end
