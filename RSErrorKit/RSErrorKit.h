//
//  RSErrorKit.h
//  RSErrorKit
//
//  Created by Dave Meehan on 28/10/2013.
//  Copyright (c) 2013 Replicated Solutions Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+RSErrorKit.h"

typedef void(^NSErrorHandler)(NSError *error);

@interface RSErrorKit : NSObject

@end
