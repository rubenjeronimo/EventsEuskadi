//
//  EventoTableViewCell.h
//  eventosEuskadi
//
//  Created by Ruben Jeronimo Fernandez on 05/07/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tipoEventoLabel;

@property (weak, nonatomic) IBOutlet UILabel *tituloEventoLabel;
@end
