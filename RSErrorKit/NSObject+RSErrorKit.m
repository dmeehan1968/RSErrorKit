//
//  NSObject+RSErrorKit.m
//  RSErrorKit
//
//  Created by Dave Meehan on 28/10/2013.
//  Copyright (c) 2013 Replicated Solutions Limited. All rights reserved.
//

#import "NSObject+RSErrorKit.h"

@implementation NSObject (RSErrorKit)

+(NSString *)errorDomain {
	
	return [NSString stringWithFormat:@"%@ErrorDomain", NSStringFromClass(self)];
	
}

-(NSError *)errorWithCode:(NSInteger)code underlyingError:(NSError *)underlyingError errorHandler:(RSErrorHandler)errorHandler {
	
	NSDictionary *userInfo = nil;
	
	if (underlyingError) {
		
		userInfo = @{ NSUnderlyingErrorKey : underlyingError };
		
	}
	
	NSError *error = [NSError errorWithDomain:[[self class] errorDomain] code:code userInfo:userInfo];
	
	if (errorHandler) {
		
		errorHandler(error);
	}
	
	return error;
	
}

@end
