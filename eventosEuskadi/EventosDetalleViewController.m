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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.tituloString;
    self.tituloLabel.text = self.tituloString;
    self.tipoLabel.text = self.tipoString;
    self.urlLabel.text = self.urlString;
   
    [self mapea];
}

-(void)mapea{
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.1;
    span.longitudeDelta=0.1;
    CLLocationCoordinate2D location;
    location.latitude = [self.latString doubleValue];
    location.longitude = [self.lonString doubleValue];
    region.span = span;
    region.center = location;
    [self.mapView setRegion:region animated:YES];
    [self.mapView  regionThatFits:region];
    
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

@end
