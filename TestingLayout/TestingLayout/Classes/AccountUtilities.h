//
//  AccountUtilities.h
//  TestingLayout
//
//  Created by OPS on 25/10/19.
//  Copyright © 2019 OPS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountUtilities : NSObject

@property (copy, readwrite) NSArray *accountInformation;

- (NSArray *)getAccounts;
- (bool)isAccountExist:(NSArray *)accountsArray givenAccount:(NSArray *)givenAccount;
- (NSArray *)returnAccountInformation;
- (bool)isEmailExist:(NSArray *)accountsArray givenEmail:(NSString *)givenEmail;    
@end

NS_ASSUME_NONNULL_END
