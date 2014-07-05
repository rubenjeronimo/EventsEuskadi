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
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
