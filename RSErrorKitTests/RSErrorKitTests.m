//
//  RSErrorKitTests.m
//  RSErrorKit
//
//  Created by Dave Meehan on 28/10/2013.
//  Copyright (c) 2013 Replicated Solutions Limited. All rights reserved.
//

#import "Kiwi.h"
#import "RSErrorKit.h"

SPEC_BEGIN(RSErrorKitSpec)

describe(@"RSErrorKit", ^{
	
    __block RSErrorKit *sut;
    
    beforeEach(^{
		
        sut = [[RSErrorKit alloc] init];
        
    });
    
    afterEach(^{
        
        sut = nil;
    });
    
    it(@"should exist", ^{
        
        [[sut should] beNonNil];
        
    });
    
});

SPEC_END