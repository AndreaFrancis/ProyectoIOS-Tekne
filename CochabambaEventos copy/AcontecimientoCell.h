//
//  AcontecimientoCell.h
//  CochabambaEventos
//
//  Created by Tekhne Dev on 12/14/13.
//  Copyright (c) 2013 xiobit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcontecimientoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imagen;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@property (weak, nonatomic) IBOutlet UILabel *lugar;
@property (weak, nonatomic) IBOutlet UILabel *fecha;

@end
