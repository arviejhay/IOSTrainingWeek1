//
//  HomeViewController.h
//  TestingLayout
//
//  Created by OPS on 25/10/19.
//  Copyright © 2019 OPS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPhoneNum;

@property (copy, readwrite) NSString *name;
@property (copy, readwrite) NSString *phoneNumber;
@end

NS_ASSUME_NONNULL_END
