//
//  ShoppingCart.h
//  Lab05
//
//  Created by Jose Rodriguez on 01/09/16.
//  Copyright © 2016 jose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "cellHome.h"
#import "Declarations.h"

@interface ShoppingCart : UIViewController<MFMailComposeViewControllerDelegate,PayPalPaymentDelegate>
- (IBAction)Pagar:(id)sender;
- (IBAction)DireccionPressed:(id)sender;
- (IBAction)EnvioPressed:(id)sender;


@end
