//
//  ViewController.m
//  TestingLayout
//
//  Created by OPS on 24/10/19.
//  Copyright © 2019 OPS. All rights reserved.
//

#import "ViewController.h"
#import "AccountUtilities.h"
#import "HomeViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (copy, readwrite) NSString *name;
@property (copy, readwrite) NSString *phoneNumber;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _btnLogin.layer.cornerRadius = 25;    // Do any additional setup after loading the view.
}

- (IBAction)btnLogin_Authentication:(UIButton *)sender {
    AccountUtilities *accountUtilities = [[AccountUtilities alloc]init];
    
    NSArray *accountsArray = [[NSArray alloc]init];
    accountsArray = [accountUtilities getAccounts];
    
    NSString *message = @"Invalid Username or Password";
    
    NSArray *givenAccount = [[NSArray alloc] initWithObjects:_txtEmail.text,_txtPassword.text, nil];
    void (^handler)(UIAlertAction *) = ^(UIAlertAction * action) {};
    if ([accountUtilities isAccountExist:accountsArray givenAccount:givenAccount])
    {
        message = @"Login Successful";
        handler = ^(UIAlertAction * action) {
            NSArray *accountInformation = [[NSArray alloc]init];
            accountInformation = [accountUtilities returnAccountInformation];
            NSLog(@"%@", accountInformation);
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
