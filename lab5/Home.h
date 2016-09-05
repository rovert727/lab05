//
//  ViewController.h
//  Lab05
//
//  Created by Jose Rodriguez on 01/09/16.
//  Copyright © 2016 jose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cellHome.h"
#import "Municipios.h"


@interface Home : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tblHome;
@property (strong, nonatomic) IBOutlet UIButton *btnCarrito;

- (IBAction)btnCarritoPressed:(id)sender;

@end

