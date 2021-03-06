//
//  EventosDetalleViewController.h
//  eventosEuskadi
//
//  Created by Ruben Jeronimo Fernandez on 04/07/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface EventosDetalleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipoLabel;
@property (weak, nonatomic) IBOutlet UIButton *urlBoton;


@property (strong,nonatomic) NSString *tituloString;
@property (strong,nonatomic) NSString *tipoString;
@property (strong,nonatomic) NSString *urlString;
@property (strong,nonatomic) NSString *latString;
@property (strong,nonatomic) NSString *lonString;

- (IBAction)tipoMapa:(id)sender;
- (IBAction)urlStart:(id)sender;
@end
