//
//  WIZMenuBtnCell.h
//  customElementh
//
//  Created by a.vorozhishchev on 06/06/2019.
//  Copyright © 2019 a.vorozhishchev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WIZMenuBtnCell : UICollectionViewCell

-(void)setImage:(UIImage*)img;
-(void)setText:(NSString*)text;
-(void)setTextColor:(UIColor*)textColor;

-(void)setBgColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
