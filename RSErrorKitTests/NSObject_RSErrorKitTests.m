//
//  NSObject_RSErrorKitTests.m
//  RSErrorKit
//
//  Created by Dave Meehan on 28/10/2013.
//  Copyright (c) 2013 Replicated Solutions Limited. All rights reserved.
//

#import "Kiwi.h"
#import "NSOBject+RSErrorKit.h"

SPEC_BEGIN(NSObject_RSErrorKitSpec)

describe(@"NSObject+RSErrorKit", ^{
	
    __block NSObject *sut;
    
    beforeEach(^{
		
        sut = [[NSObject alloc] init];
        
    });
    
    afterEach(^{
        
        sut = nil;
    });
    
	context(@"errorDomain", ^{

		it(@"is classname + ErrorDomain", ^{
			
			[[[NSObject errorDomain] should] equal:@"NSObjectErrorDomain"];
			
		});
		
	});
	
	context(@"objects creating errors without underlying error or handler", ^{
		
		__block NSError *theError;
		
		beforeEach(^{
			
			theError = [sut errorWithCode:1 underlyingError:nil errorHandler:nil];
			
		});
		
		it(@"returns an error", ^{
			
			[[theError should] beNonNil];
			
		});

		it(@"is correct error domain", ^{
			
			[[theError.domain should] equal:@"NSObjectErrorDomain"];
			
		});
		
		it(@"is correct error code", ^{
			
			[[theValue(theError.code) should] equal:theValue(1)];
			
		});
		
		it(@"has no underlying error", ^{
			
			[[theError.userInfo[NSUnderlyingErrorKey] should] beNil];
			
		});
		
	});
	
	context(@"with underlying error", ^{
		
		__block NSError *theError;
		__block NSError *underlyingError;
		
		beforeEach(^{
		
			underlyingError = [NSError errorWithDomain:@"testDomain" code:123 userInfo:nil];
			
			theError = [sut errorWithCode:1 underlyingError:underlyingError errorHandler:nil];
			
			
		});
		
		it(@"has an underlying error", ^{
			
			[[theError.userInfo[NSUnderlyingErrorKey] should] equal:underlyingError];
			
		});
		
	});
	
	context(@"with error handler", ^{
		
		__block NSError *theError;
		__block NSError *handlerError;
		
		beforeEach(^{
		
			handlerError = nil;
			
			theError = [sut errorWithCode:1 underlyingError:nil errorHandler:^(NSError *error) {
				
				handlerError = error;
				
			}];
			
		});
		
		it(@"should call the handler", ^{
			
			[[handlerError should] equal:theError];
			
		});


		
	});


});

SPEC_END