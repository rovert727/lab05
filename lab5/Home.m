//
//  ViewController.m
//  Lab05
//
//  Created by Jose Rodriguez on 01/09/16.
//  Copyright © 2016 jose. All rights reserved.
//

#import "Home.h"
#import <DigitsKit/DigitsKit.h>

@interface Home ()
//@property NSMutableArray *destinationTitles;
@property NSMutableArray *destinationTitles;
@property NSMutableArray *destinationDescriptions;
@property NSMutableArray *destinationPhotos;

@property NSString *stTitleSelected;
@property NSString *stDescriptionSelected;
@property NSString *stPhotoSelected;

@property NSInteger IState;

@end

@implementation Home
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
DGTAuthenticateButton *authButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    //DGTAuthenticateButton *authButton;
    authButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        if (session.userID) {
            // TODO: associate the session userID with your user model
            NSString *msg = [NSString stringWithFormat:@"Teléfono: %@", session.phoneNumber];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Estás logueado!"
                                                            message:msg
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        } else if (error) {
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];
    authButton.center = self.view.center;
    [self.view addSubview:authButton];
    

    
    //self.tblHome.userInteractionEnabled=true;
    //self.tblHome.hidden=false;
    [self initController];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    //self.destinationTitles = [[NSMutableArray alloc] initWithCapacity:2];
    
    //[self.destinationTitles insertObject:[NSMutableArray arrayWithObjects:@"Oaxaca", @"Jalisco", @"Nuevo León", @"San Luis", @"Quintana Roo",nil] atIndex:0];
    //[self.destinationTitles insertObject:[NSMutableArray arrayWithObjects:@"Matias Romero", @"Lagunas", @"Huajuapan", @"Mérida", @"Monterrey",nil] atIndex:1];
    
    self.destinationTitles          = [[NSMutableArray alloc] initWithObjects: @"Cervezas", @"Tequila", @"Vino", @"Vodka", @"Cigarros", nil];
    self.destinationPhotos          = [[NSMutableArray alloc] initWithObjects: @"oaxaca.png", @"jalisco.png", @"nuevoleon.png", @"sanluis.png", @"quintanaroo.png", nil];
    self.destinationDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Cervezas nacionales e internacionales", @"Tequila 100% mexicano", @"Vino internacional", @"Vodka", @"Cigarros internacionales", nil];
    

}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.destinationTitles.count;
    
    return 5;
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
    cell.lblDestinationTitle.text   = self.destinationTitles[indexPath.row];
    cell.ldlDescription.text        = self.destinationDescriptions[indexPath.row];
    cell.imgDestination.image       = [UIImage imageNamed:self.destinationPhotos[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    self.stTitleSelected        = self.destinationTitles[indexPath.row];
//    self.stDescriptionSelected  = self.destinationDescriptions[indexPath.row];
//    self.stPhotoSelected        = self.destinationPhotos[indexPath.row];
    self.IState = indexPath.row;
    
    
    
    [self performSegueWithIdentifier:@"Municipios" sender:self];
}
/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[Municipios class]]) {
        Municipios *destination     = [segue destinationViewController];
        destination.IStateForMun        = self.IState;
//        destination.destinationDescription  = self.stDescriptionSelected;
//        destination.destinationPhoto        = self.stPhotoSelected;
//        
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0)
    {
        authButton.userInteractionEnabled = false;
        authButton.hidden = true;
        
        self.tblHome.userInteractionEnabled=true;
        self.tblHome.hidden=false;
        self.btnCarrito.hidden=false;
        
    }
     
}

- (IBAction)btnCarritoPressed:(id)sender {
    
    [self performSegueWithIdentifier:@"ShoppingCart" sender:self];
    
}

@end