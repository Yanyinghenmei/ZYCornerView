//
//  ZYCornerView.m
//  JadeSource
//
//  Created by Daniel on 16/11/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "ZYCornerView.h"
@import QuartzCore;

@implementation ZYCornerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setProperty];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setProperty];
    }
    return self;
}

- (void)setProperty {
    self.backgroundColor = [UIColor clearColor];
    
    _cornerColor = [UIColor colorWithRed:248/255.00 green:193/255.00 blue:3/255.00 alpha:1];
    _titleLabel = [UILabel new];
    
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_titleLabel];
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [[UIColor clearColor] set];
    UIRectFill([self bounds]);
    //拿到当前视图准备好的画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint points[3];
    
    if (_positionType == ZYCornerPositionTypeLeftTop) {
        points[0] = CGPointMake(0, 0);
        points[1] = CGPointMake(self.frame.size.width, 0);
        points[2] = CGPointMake(0, self.frame.size.height);
    } else if (_positionType == ZYCornerPositionTypeLeftBottom) {
        points[0] = CGPointMake(0, 0);
        points[1] = CGPointMake(self.frame.size.width, self.frame.size.height);
        points[2] = CGPointMake(0, self.frame.size.height);
    } else if (_positionType == ZYCornerPositionTypeRightTop) {
        points[0] = CGPointMake(0, 0);
        points[1] = CGPointMake(self.frame.size.width, 0);
        points[2] = CGPointMake(self.frame.size.width, self.frame.size.height);
    } else {
        points[0] = CGPointMake(self.frame.size.width, 0);
        points[1] = CGPointMake(self.frame.size.width, self.frame.size.height);
        points[2] = CGPointMake(0, self.frame.size.height);
    }
    
    CGContextAddLines(context, points, 3);
    CGContextClosePath(context);
    
    [_cornerColor setFill]; //设置填充色
    [_cornerColor setStroke]; //设置边框颜色
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    double corLength = hypotl(self.frame.size.width, self.frame.size.height);
    CGFloat height = self.frame.size.height / corLength * self.frame.size.width / 3;
    
    _titleLabel.bounds = CGRectMake(0, 0, corLength, height);
    _titleLabel.center = CGPointMake(self.frame.size.width/2 - height/2/(corLength/self.frame.size.height),
                                self.frame.size.height/2 - height/2/(corLength/self.frame.size.width));
    
    CGFloat cor;
    if (_positionType == ZYCornerPositionTypeLeftTop) {
        cor = -atan(self.frame.size.height/self.frame.size.width);
        _titleLabel.center = CGPointMake(self.frame.size.width/2 - height/2/(corLength/self.frame.size.height),
                                         self.frame.size.height/2 - height/2/(corLength/self.frame.size.width));
    } else if (_positionType == ZYCornerPositionTypeLeftBottom) {
        cor = atan(self.frame.size.height/self.frame.size.width);
        _titleLabel.center = CGPointMake(self.frame.size.width/2 - height/2/(corLength/self.frame.size.height),
                                         self.frame.size.height/2 + height/2/(corLength/self.frame.size.width));
    } else if (_positionType == ZYCornerPositionTypeRightTop) {
        cor = atan(self.frame.size.height/self.frame.size.width);
        _titleLabel.center = CGPointMake(self.frame.size.width/2 + height/2/(corLength/self.frame.size.height),
                                         self.frame.size.height/2 - height/2/(corLength/self.frame.size.width));
    } else {
        cor = -atan(self.frame.size.height/self.frame.size.width);
        _titleLabel.center = CGPointMake(self.frame.size.width/2 + height/2/(corLength/self.frame.size.height),
                                         self.frame.size.height/2 + height/2/(corLength/self.frame.size.width));
    }
    
    _titleLabel.transform = CGAffineTransformMakeRotation(cor);
    _titleLabel.font = [UIFont systemFontOfSize:height];
    
    [self addSubview:_titleLabel];
}


@end
