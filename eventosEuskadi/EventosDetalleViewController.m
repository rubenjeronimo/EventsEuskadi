//
//  EventosDetalleViewController.m
//  eventosEuskadi
//
//  Created by Ruben Jeronimo Fernandez on 04/07/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "EventosDetalleViewController.h"

@interface EventosDetalleViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property  double latitudPOI;
@property double longitudPOI;
@end

@implementation EventosDetalleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
        self.title = self.tituloString;
    self.tituloLabel.text = self.tituloString;
    self.tipoLabel.text = self.tipoString;
   // self.urlBoton.titleLabel.text = self.urlString;
   
    self.latitudPOI = [self.latString doubleValue];
    self.longitudPOI = [self.lonString doubleValue];
    
    [self mapea];
    [self POI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)mapea{
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.005;
    span.longitudeDelta=0.005;
    CLLocationCoordinate2D location;
    location.latitude = self.latitudPOI;
    location.longitude = self.longitudPOI;
    region.span = span;
    region.center = location;
    [self.mapView setRegion:region animated:YES];
    [self.mapView  regionThatFits:region];
    
}

-(void)POI{
    CLLocationCoordinate2D coorPunto = CLLocationCoordinate2DMake(self.latitudPOI, self.longitudPOI);
    MKPointAnnotation *anotacion = [[MKPointAnnotation alloc]init];
    [anotacion setCoordinate:coorPunto];
    [anotacion setTitle:self.tituloString];
    [anotacion setSubtitle:self.tipoString];
    [self.mapView addAnnotation:anotacion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tipoMapa:(id)sender {

    UIButton *botonMapa = (UIButton*)sender;
    switch (botonMapa.tag) {
        case 0:
            [self.mapView setMapType:MKMapTypeStandard];
            [botonMapa setTitle:@"Mapa" forState:UIControlStateNormal];
            botonMapa.tag =1;
            break;
        case 1:
            [self.mapView setMapType:MKMapTypeSatellite];
            [botonMapa setTitle:@"Satelite" forState:UIControlStateNormal];
            botonMapa.tag = 2;
            break;
        case 2:
            [self.mapView setMapType:MKMapTypeHybrid];
            [botonMapa setTitle:@"Hibrido" forState:UIControlStateNormal];
            botonMapa.tag = 0;
            break;
        default:
            break;
    }
}

- (IBAction)urlStart:(id)sender {
   // NSURL *url = [NSURL URLWithString:self.urlString];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.urlString]];
}
@end
