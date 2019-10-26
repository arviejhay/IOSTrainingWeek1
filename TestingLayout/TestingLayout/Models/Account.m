//
//  Account.m
//  TestingLayout
//
//  Created by OPS on 25/10/19.
//  Copyright © 2019 OPS. All rights reserved.
//

#import "Account.h"
#import "AccountUtilities.h"

@implementation Account

- (instancetype)initWithAccountDictionary:(NSDictionary *)accountDictionary {
    self = [super init];
    if (self) {
        _fullName = accountDictionary[@"Full Name"];
        _phoneNumber = accountDictionary[@"Phone Number"];
        
        _email = accountDictionary[@"Email"];
        _password = accountDictionary[@"Password"];
    }
    return self;
}

- (bool)storeAccount {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *accountsArray = [[defaults objectForKey:(@"Accounts")] mutableCopy];
    
    if (accountsArray == nil)
    {
        accountsArray = [[NSMutableArray alloc]init];
    }
    AccountUtilities *accountUtilities = [[AccountUtilities alloc]init];
    if ([accountUtilities isEmailExist:accountsArray givenEmail:_email]) {
        return false;
    }
    NSArray *accountData = [[NSArray alloc] initWithObjects:_fullName,_phoneNumber,_email,_password, nil];
    [accountsArray addObject:accountData];
    [defaults setObject:accountsArray forKey:@"Accounts"];
    return true;
}
@end
