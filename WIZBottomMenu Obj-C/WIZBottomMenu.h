//
//  WIZBottomMenu.h
//  customElementh
//
//  Created by a.vorozhishchev on 05/06/2019.
//  Copyright © 2019 a.vorozhishchev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WIZBottomMenuBtn : NSObject

@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSString *btnText;

-(id)initWithImage:(UIImage*)image btnText:(NSString*)btnText;

@end

@protocol WIZBottomMenuDelegate;

@interface WIZBottomMenu : UIView

-(id)initWithTopViewHeight:(float)topHeight bottomViewHeight:(float)btmHeight;

@property (nonatomic) id <WIZBottomMenuDelegate> delegate;

-(void)setTextColor:(UIColor*)color;
-(void)setSelectColor:(UIColor*)color;

@end

@protocol WIZBottomMenuDelegate <NSObject>

//count sections
-(NSInteger)countSectionsWIZBottomMenu:(WIZBottomMenu*)bottomMenu;

//create buttons
-(WIZBottomMenuBtn*)WIZBottomMenu:(WIZBottomMenu*)bottomMenu buttonAtIndex:(NSInteger)index;

//get selected view
-(UIView*)WIZBottomMenu:(WIZBottomMenu*)bottomMenu selectedViewAtIndex:(NSInteger)index;

@end
