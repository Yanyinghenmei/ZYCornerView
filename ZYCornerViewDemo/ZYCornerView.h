//
//  ZYCornerView.h
//  JadeSource
//
//  Created by Daniel on 16/11/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZYCornerPositionType) {
    ZYCornerPositionTypeLeftTop = 0,
    ZYCornerPositionTypeLeftBottom = 1,
    ZYCornerPositionTypeRightTop = 2,
    ZYCornerPositionTypeRightBottom = 3,
};

@interface ZYCornerView : UIView
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIColor *cornerColor;
@property (nonatomic, copy)NSString *text;
@property (nonatomic, assign) ZYCornerPositionType positionType;


@end
