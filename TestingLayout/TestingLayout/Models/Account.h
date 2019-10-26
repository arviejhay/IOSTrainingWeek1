//
//  Account.h
//  TestingLayout
//
//  Created by OPS on 25/10/19.
//  Copyright © 2019 OPS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Account : NSObject

@property (copy, readwrite) NSString *fullName;
@property (copy, readwrite) NSString *phoneNumber;

@property (copy, readwrite) NSString* email;
@property (copy, readwrite) NSString* password;

- (instancetype)initWithAccountDictionary:(NSDictionary *)accountDictionary;

- (bool)storeAccount;
@end

NS_ASSUME_NONNULL_END
