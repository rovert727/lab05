//
//  ShoppingCart.h
//  Lab05
//
//  Created by Jose Rodriguez on 01/09/16.
//  Copyright © 2016 jose. All rights reserved.
//

#import "ShoppingCart.h"

@interface ShoppingCart ()
@property (nonatomic, strong, readwrite) PayPalConfiguration *payPalConfiguration;
@end

@implementation ShoppingCart

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _payPalConfiguration = [[PayPalConfiguration alloc] init];
        
        // See PayPalConfiguration.h for details and default values.
        // Should you wish to change any of the values, you can do so here.
        // For example, if you wish to accept PayPal but not payment card payments, then add:
        _payPalConfiguration.acceptCreditCards = YES;
        
        // Or if you wish to have the user choose a Shipping Address from those already
        // associated with the user's PayPal account, then add:
        _payPalConfiguration.payPalShippingAddressOption = PayPalShippingAddressOptionPayPal;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Start out working with the test environment! When you are ready, switch to PayPalEnvironmentProduction.
    //[PayPalMobile preconnectWithEnvironment:PayPalEnvironmentNoNetwork];
    [PayPalMobile preconnectWithEnvironment:PayPalEnvironmentNoNetwork];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Pagar:(id)sender {
    


    
    // Create a PayPalPayment
    PayPalPayment *payment = [[PayPalPayment alloc] init];
    
    // Amount, currency, and description
    payment.amount = [[NSDecimalNumber alloc] initWithString:@"270.00"];
    payment.currencyCode = @"MXN";
    payment.shortDescription = @"Fiesta Pack";
    //payment.shortDescription = self.productTitle;
    
    // Use the intent property to indicate that this is a "sale" payment,
    // meaning combined Authorization + Capture.
    // To perform Authorization only, and defer Capture to your server,
    // use PayPalPaymentIntentAuthorize.
    // To place an Order, and defer both Authorization and Capture to
    // your server, use PayPalPaymentIntentOrder.
    // (PayPalPaymentIntentOrder is valid only for PayPal payments, not credit card payments.)
    payment.intent = PayPalPaymentIntentSale;
    
    // If your app collects Shipping Address information from the customer,
    // or already stores that information on your server, you may provide it here.
    //payment.shippingAddress = address; // a previously-created PayPalShippingAddress object
    //payment.shippingAddress = @"Universidad Autónoma de Guadalajara";
    
    
    // Several other optional fields that you can set here are documented in PayPalPayment.h,
    // including paymentDetails, items, invoiceNumber, custom, softDescriptor, etc.
    
    // Check whether payment is processable.
    if (!payment.processable) {
        // If, for example, the amount was negative or the shortDescription was empty, then
        // this payment would not be processable. You would want to handle that here.
    }
    // Create a PayPalPaymentViewController.
    PayPalPaymentViewController *paymentViewController;
    paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
                                                                   configuration:self.payPalConfiguration
                                                                        delegate:self];
    
    // Present the PayPalPaymentViewController.
    [self presentViewController:paymentViewController animated:YES completion:nil];
    
}

- (IBAction)DireccionPressed:(id)sender {
}

- (IBAction)EnvioPressed:(id)sender {
    
    // From within your active view controller
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
        
        [mailCont setSubject:@"Pedido confirmado"];
        [mailCont setToRecipients:[NSArray arrayWithObject:@"jhamer02@hotmail.com"]];
        [mailCont setMessageBody:@"Detalles del pedido  Lucky Strike, Six Corona, Botella Don Julio" isHTML:NO];
        
        [self presentModalViewController:mailCont animated:YES];
    }
    
}

#pragma mark - PayPalPaymentDelegate methods

- (void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController
                 didCompletePayment:(PayPalPayment *)completedPayment {
    // Payment was processed successfully; send to server for verification and fulfillment.
    [self verifyCompletedPayment:completedPayment];
    NSLog(@"completedPayment = %@",completedPayment);
    
    // Dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController {
    // The payment was canceled; dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)verifyCompletedPayment:(PayPalPayment *)completedPayment {
    // Send the entire confirmation dictionary
    NSData *confirmation = [NSJSONSerialization dataWithJSONObject:completedPayment.confirmation
                                                           options:0
                                                             error:nil];
    NSLog(@"completedPayment = %@",completedPayment);
    NSLog(@"completedPayment.confirmation = %@",completedPayment.confirmation);
    NSLog(@"confirmation = %@",confirmation);
    // Send confirmation to your server; your server should verify the proof of payment
    // and give the user their goods or services. If the server is not reachable, save
    // the confirmation and try again later.
    
}

// Then implement the delegate method
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissModalViewControllerAnimated:YES];
}



/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger arrayLength = [maProductTitle count];
    return arrayLength;
    
    //return 5;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
}
//-------------------------------------------------------------------------------
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    //1. Setup the CATransform3D structure
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
//    rotation.m34 = 1.0/ -600;
//
//    //2. Define the initial state (Before the animation)
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//
//    //3. Define the final state (After the animation) and commit the animation
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:0.4];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//
//    //Reassure that cell its in its place (WaGo)
//    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
//    [UIView commitAnimations];
//}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellHome *cell = (cellHome *)[tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellHome" bundle:nil] forCellReuseIdentifier:@"cellHome"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    }
    //Fill cell with info from arrays
    //cell.lblDestinationTitle.text   = self.destinationTitles[1][indexPath.row];
    cell.lblDestinationTitle.text   = maProductTitle[indexPath.row];
    cell.ldlDescription.text        = maProductPrice[indexPath.row];
    cell.imgDestination.image       = [UIImage imageNamed:maProductImg[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    self.stTitleSelected        = self.destinationTitles[indexPath.row];
    //    self.stDescriptionSelected  = self.destinationDescriptions[indexPath.row];
    //    self.stPhotoSelected        = self.destinationPhotos[indexPath.row];
    //self.IState = indexPath.row;
    
    
    
    //[self performSegueWithIdentifier:@"Municipios" sender:self];
}

@end
