//
//  WIZMenuBtnCell.m
//  customElementh
//
//  Created by a.vorozhishchev on 06/06/2019.
//  Copyright © 2019 a.vorozhishchev. All rights reserved.
//

#import "WIZMenuBtnCell.h"

@interface WIZMenuBtnCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *bgView;


@end

@implementation WIZMenuBtnCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.bgView.backgroundColor = [UIColor blackColor];
}

-(void)setImage:(UIImage*)img
{
    self.imgView.image = img;
}

-(void)setText:(NSString*)text
{
    self.label.text = text;
}

-(void)setBgColor:(UIColor *)color
{
    self.bgView.backgroundColor = color;
}

-(void)setTextColor:(UIColor *)textColor
{
    self.label.textColor = textColor;
}

@end
