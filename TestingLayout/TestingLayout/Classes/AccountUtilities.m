//
//  AccountUtilities.m
//  TestingLayout
//
//  Created by OPS on 25/10/19.
//  Copyright © 2019 OPS. All rights reserved.
//

#import "AccountUtilities.h"

@implementation AccountUtilities
- (NSArray *)getAccounts {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *accountsArray = [defaults objectForKey:(@"Accounts")];
    
    NSLog(@"%@\n", accountsArray);
    
    return [accountsArray copy];
}


- (bool)isAccountExist:(NSArray *)accountsArray givenAccount:(NSArray *)givenAccount {
    NSString *givenEmail = givenAccount[0];
    NSString *givenPassword = givenAccount[1];
    bool isExist = false;
    
    for (NSArray *account in accountsArray){
        NSString *savedEmail = account[2];
        NSString *savedPassword = account[3];
        if ([savedEmail isEqualToString:givenEmail]
            && [savedPassword isEqualToString:givenPassword])
        {
            _accountInformation = [[NSArray alloc] initWithObjects:account[0],account[1], nil];
            isExist = true;
            break;
        }
    }
    return isExist;
}

- (NSArray *)returnAccountInformation {
    return _accountInformation;
}

- (bool)isEmailExist:(NSArray *)accountsArray givenEmail:(NSString *)givenEmail {
    bool isExist = false;
    
    for (NSArray *account in accountsArray){
        NSString *savedEmail = account[2];
        if ([savedEmail isEqualToString:givenEmail])
        {
            isExist = true;
            break;
        }
    }
    return isExist;

}
@end

