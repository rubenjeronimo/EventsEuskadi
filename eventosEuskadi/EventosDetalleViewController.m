//
//  EventosDetalleViewController.m
//  eventosEuskadi
//
//  Created by Ruben Jeronimo Fernandez on 04/07/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "EventosDetalleViewController.h"

@interface EventosDetalleViewController ()

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
