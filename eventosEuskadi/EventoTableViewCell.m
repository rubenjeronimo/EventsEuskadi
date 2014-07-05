//
//  EventoTableViewCell.m
//  eventosEuskadi
//
//  Created by Ruben Jeronimo Fernandez on 05/07/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "EventoTableViewCell.h"

@implementation EventoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    [self backgroundLayer];
    
}

-(void) backgroundLayer{
    CALayer *capa = [CALayer layer];
    capa.frame = CGRectInset(self.layer.frame, 5, 5);
    capa.backgroundColor = [UIColor colorWithRed:0.1 green:0.2 blue:0.1 alpha:0.7].CGColor;
    capa.cornerRadius = 20;
    [self.layer insertSublayer:capa atIndex:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
