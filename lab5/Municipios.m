//
//  ShoppingCart.h
//  Lab05
//
//  Created by Jose Rodriguez on 01/09/16.
//  Copyright © 2016 jose. All rights reserved.
//

#import "Municipios.h"

@interface Municipios ()

@property NSMutableArray *destinationTitles;
@property NSMutableArray *destinationDescriptions;
@property NSMutableArray *destinationPhotos;

@property NSString *stTitleSelected;
@property NSString *stDescriptionSelected;
@property NSString *stPhotoSelected;

@end

@implementation Municipios
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    self.destinationTitles = [[NSMutableArray alloc] initWithCapacity:5];
    [self.destinationTitles insertObject:[NSMutableArray arrayWithObjects:@"Corona", @"Heineken", @"Guinness", @"Minerva", @"Victoria",nil] atIndex:0];
    [self.destinationTitles insertObject:[NSMutableArray arrayWithObjects:@"Don Julio", @"El patrón", @"José Cuervo", @"Hornitos", @"Herradura",nil] atIndex:1];
    [self.destinationTitles insertObject:[NSMutableArray arrayWithObjects:@"Rosado", @"Tinto", @"Blanco", @"El Gallo", @"Champagne",nil] atIndex:2];
    [self.destinationTitles insertObject:[NSMutableArray arrayWithObjects:@"Absolut", @"Smirnoff", @"bols", @"Gray goose", @"Skyy",nil] atIndex:3];
    [self.destinationTitles insertObject:[NSMutableArray arrayWithObjects:@"Lucky Strike", @"Kentucky", @"King", @"Marlboro", @"Che",nil] atIndex:4];
    
    self.destinationPhotos = [[NSMutableArray alloc] initWithCapacity:5];
    [self.destinationPhotos insertObject:[NSMutableArray arrayWithObjects:@"matias.jpg", @"oax_calpulalpam.jpg", @"oax_oaxaca.jpg", @"oax_sanlorenzo.jpg", @"oax_tule.jpg",nil] atIndex:0];
    [self.destinationPhotos insertObject:[NSMutableArray arrayWithObjects:@"jal_tlajomulco.jpg", @"jal_tlaquepaque.jpg", @"jal_tonala.jpg", @"jal_guadalajara.jpg", @"jal_arandas.jpg",nil] atIndex:1];
    [self.destinationPhotos insertObject:[NSMutableArray arrayWithObjects:@"nvo_apodaca.jpg", @"nvo_monterrey.jpg", @"nvo_sanpedro.jpg", @"nvo_santacatarina.jpg", @"nvo_santiago.jpg",nil] atIndex:2];
    [self.destinationPhotos insertObject:[NSMutableArray arrayWithObjects:@"slp_realdecatorce.jpg", @"slp_rioverde.jpg", @"slp_sanluis.jpg", @"slp_tamasopo.jpg", @"slp_xilitla.jpg",nil] atIndex:3];
    [self.destinationPhotos insertObject:[NSMutableArray arrayWithObjects:@"qr_cancun.jpg", @"qr_cozumel.jpg", @"qr_islamujeres.jpg", @"qr_playadelcarmen.jpg", @"qr_tulum.jpg",nil] atIndex:4];
    
    self.destinationDescriptions = [[NSMutableArray alloc] initWithCapacity:5];
    [self.destinationDescriptions insertObject:[NSMutableArray arrayWithObjects:@"$80", @"$80", @"$80", @"$80", @"$80",nil] atIndex:0];
    [self.destinationDescriptions insertObject:[NSMutableArray arrayWithObjects:@"$90", @"$90", @"$90", @"$90", @"$90",nil] atIndex:1];
    [self.destinationDescriptions insertObject:[NSMutableArray arrayWithObjects:@"$70", @"$70", @"$70", @"$70", @"$70",nil] atIndex:2];
    [self.destinationDescriptions insertObject:[NSMutableArray arrayWithObjects:@"$70", @"$70", @"$70", @"$70", @"$70",nil] atIndex:3];
    [self.destinationDescriptions insertObject:[NSMutableArray arrayWithObjects:@"$100", @"$100", @"$100", @"$70", @"$100",nil] atIndex:4];
    
    
    //self.destinationTitles          = [[NSMutableArray alloc] initWithObjects: @"Matias Romero", @"Lagunas", @"huajuapan", @"Mérida", @"Monterrey", nil];
    //self.destinationPhotos          = [[NSMutableArray alloc] initWithObjects: @"oaxaca.png", @"jalisco.png", @"nuevoleon.png", @"sanluis.png", @"quintanaroo.png", nil];
    //self.destinationDescriptions    = [[NSMutableArray alloc] initWithObjects: @"Oaxaca se destaca por su cultura", @"Jalisco es un estado colonial", @"Destino para negocios", @"DEstino ideal para el ecoturismo", @"Estado con las mejore playas del país", nil];
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
    cellMunipios *cell = (cellMunipios *)[tableView dequeueReusableCellWithIdentifier:@"cellMunipios"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMunipios" bundle:nil] forCellReuseIdentifier:@"cellMunipios"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMunipios"];
    }
    //Fill cell with info from arrays
    //cell.lblDestinationTitle.text   = self.destinationTitles[1][indexPath.row];
    
    cell.lblMunicipios.text   = self.destinationTitles[self.IStateForMun][indexPath.row];
    cell.lblDescription.text        = self.destinationDescriptions[self.IStateForMun][indexPath.row];
    cell.imgMunicipios.image       = [UIImage imageNamed:self.destinationPhotos[self.IStateForMun][indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        self.stTitleSelected        = self.destinationTitles[self.IStateForMun][indexPath.row];
        self.stDescriptionSelected  = self.destinationDescriptions[self.IStateForMun][indexPath.row];
        self.stPhotoSelected        = self.destinationPhotos[self.IStateForMun][indexPath.row];
    [self performSegueWithIdentifier:@"DestinationDetails" sender:self];
}
/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
        if ([segue.destinationViewController isKindOfClass:[DestinationDetails class]]) {
            DestinationDetails *destination     = [segue destinationViewController];
            destination.destinationTitle        = self.stTitleSelected;
            destination.destinationDescription  = self.stDescriptionSelected;
            destination.destinationPhoto        = self.stPhotoSelected;
            
        }
}

@end