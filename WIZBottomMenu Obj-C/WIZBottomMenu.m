//
//  WIZBottomMenu.m
//  customElementh
//
//  Created by a.vorozhishchev on 05/06/2019.
//  Copyright © 2019 a.vorozhishchev. All rights reserved.
//

#import "WIZBottomMenu.h"
#import "WIZMenuBtnView/WIZMenuBtnCell.h"

@interface WIZBottomMenuBtn()
{
    UIImage          *img;
    NSString         *btnTxt;
}

@end

@implementation WIZBottomMenuBtn


-(id)initWithImage:(UIImage *)image btnText:(NSString *)btnText
{
    self = [super init];
    img = image;
    btnTxt = btnText;
    
    return self;
}

-(UIImage*)image
{
    return img;
}

-(NSString*)btnText
{
    return btnTxt;
}


@end

@interface WIZBottomMenu() <UICollectionViewDelegate, UICollectionViewDataSource>
{
    float       topViewHeight;
    float       bottomViewHeight;
    UIView      *settingView;
    NSInteger   selectedIndex;
    
    UIColor     *textColor;
    UIColor     *selectColor;
}

@end

@implementation WIZBottomMenu


static NSString * const reuseIdentifier = @"WIZMenuBtnCell";

#pragma mark - init

-(id)initWithTopViewHeight:(float)topHeight bottomViewHeight:(float)btmHeight
{
    float sumHeight = topHeight + btmHeight;
    
    topViewHeight = topHeight;
    bottomViewHeight = btmHeight;
    
    self = [super initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - sumHeight, [UIScreen mainScreen].bounds.size.width, sumHeight)];
    
//    self.backgroundColor = [UIColor grayColor];
    
    textColor = [UIColor blackColor];
    selectColor = [UIColor darkGrayColor];
    
    return self;
}



-(void)setDelegate:(id<WIZBottomMenuDelegate>)delegate
{
    _delegate = delegate;
    [self drawView];
}

-(void)setTextColor:(UIColor *)color
{
    textColor = color;
}

-(void)setSelectColor:(UIColor *)color
{
    selectColor = color;
}

-(void)drawView
{
    [self initSettingView];
    [self initCollectionView];
}

#pragma mark - create scroller

-(void)initCollectionView
{
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(bottomViewHeight, bottomViewHeight);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    CGRect collectionViewFrame;
    collectionViewFrame.origin.x = 4;
    collectionViewFrame.origin.y = topViewHeight;
    collectionViewFrame.size.width = [UIScreen mainScreen].bounds.size.width;
    collectionViewFrame.size.height = bottomViewHeight;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:collectionViewFrame collectionViewLayout:flowLayout];
    
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = UIColor.clearColor;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    
    [self addSubview:collectionView];
    [collectionView registerNib:[UINib nibWithNibName:@"WIZMenuBtnCell" bundle:nil] forCellWithReuseIdentifier:@"WIZMenuBtnCell"];
    [collectionView reloadData];
}

#pragma mark - collection view delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return [_delegate countSectionsWIZBottomMenu:self];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WIZMenuBtnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (indexPath.row != selectedIndex)
        [cell setBgColor:[UIColor clearColor]];
    else
        [cell setBgColor:[selectColor colorWithAlphaComponent:0.5]];
    
    WIZBottomMenuBtn *btn = [_delegate WIZBottomMenu:self buttonAtIndex:indexPath.row];
    
    [cell setImage:btn.image];
    [cell setText:btn.btnText];
    
    [cell setTextColor:textColor];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(bottomViewHeight, bottomViewHeight);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    selectedIndex = indexPath.row;
    
    [collectionView reloadData];
    
    [self showOutsettingTopView:selectedIndex];
    
}

-(void)showOutsettingTopView:(NSInteger)index
{
    for (UIView *view in settingView.subviews)
        [view removeFromSuperview];
    
    UIView *outSettingView = [_delegate WIZBottomMenu:self selectedViewAtIndex:index];
    
    outSettingView.frame = settingView.frame;
    
    [settingView addSubview:outSettingView];
}

#pragma mark - create setting view

-(void)initSettingView
{
    settingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, topViewHeight)];
    
    settingView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:settingView];
    
    [self showOutsettingTopView:selectedIndex];
}

@end
