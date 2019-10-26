//
//  SignUpViewController.m
//  TestingLayout
//
//  Created by OPS on 25/10/19.
//  Copyright © 2019 OPS. All rights reserved.
//

#import "SignUpViewController.h"
#import "Account.h"
#import "HomeViewController.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnSignup;

@property (weak, nonatomic) IBOutlet UITextField *txtFullName;
@property (weak, nonatomic) IBOutlet UITextField *txtPhoneNo;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtConPassword;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _btnSignup.layer.cornerRadius = 25;
    // Do any additional setup after loading the view.
}
- (IBAction)btnSignup_AddAccount:(UIButton *)sender {
    NSDictionary *accountDictionary = @{ @"Full Name" : _txtFullName.text,
                                         @"Phone Number" : _txtPhoneNo.text,
                                         @"Email" : _txtEmail.text,
                                         @"Password" : _txtPassword.text
                                      };
    
    Account *account = [[Account alloc]initWithAccountDictionary:accountDictionary];
    
    bool isSuccessful = [account storeAccount];
    NSString *message = @"Email Already Exist";
    void (^handler)(UIAlertAction *) = ^(UIAlertAction * action) {};
    if (isSuccessful)
    {
        message = @"Registration Successful";
        
        NSString *fullName = _txtFullName.text;
        NSString *phoneNumber = _txtPhoneNo.text;
        
        handler = ^(UIAlertAction *action) {
            NSArray *accountInformation = [[NSArray alloc]initWithObjects:fullName,phoneNumber, nil];
            [self presentHomeScreenWith:accountInformation];
        };
    }
    [self alert:message handler:handler];

}

typedef void (^ AlertHandler)(UIAlertAction *);

- (void)alert:(NSString *)message handler:(AlertHandler)handler {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:handler];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)presentHomeScreenWith:(NSArray *)accountInformation {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController *hvm = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    
    hvm.name = accountInformation[0];
    hvm.phoneNumber = accountInformation[1];
    
    [self presentViewController:hvm animated:YES completion:nil];
}
@end
