//
//  XYMGuide.m
//  healthcoming
//
//  Created by jack xu on 16/10/25.
//  Copyright © 2016年 Franky. All rights reserved.
//

#import "XYMGuide.h"
#import "XYMLabel.h"

@interface XYMGuide()

@property(nonatomic,weak)UIView *bgView;

@property(nonatomic,weak)XYMLabel *textLabel;

@end

@implementation XYMGuide

- (void)sureTapClick:(UITapGestureRecognizer *)tap
{
    UIView * view = tap.view;
    [view removeFromSuperview];
    [view removeAllSubviews];
    [view removeGestureRecognizer:tap];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstCouponBoard_iPhone"];
}

- (instancetype)initWithName:(NSString *)name{
    
    if (self = [super init]) {
        
        int startCount = [self addStartName:name];
        if (startCount == 1)
        {
            self.hidden = NO;
        }else{
        
            self.hidden = YES;
            [self removeFromSuperview];
        }
    }
    return self;
}

-(int)addStartName:(NSString *)name
{
    NSString* key=[NSString stringWithFormat:@"start%@count_version%@",name,[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    int startcount=[((NSNumber*)[[NSUserDefaults standardUserDefaults] objectForKey:key]) intValue];
    startcount++;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:startcount] forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return startcount;
}

//矩形（可设置圆角）
-(void)setRectangleTypeWithFrame:(CGRect)rectMake cornerRadius:(int)cornerRadius{

    CGRect frame = [UIScreen mainScreen].bounds;
    self.frame = frame;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sureTapClick:)];
    [self addGestureRecognizer:tap];

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:frame];

    [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:rectMake cornerRadius:cornerRadius] bezierPathByReversingPath]];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;

    [self.layer setMask:shapeLayer];

}

//圆形
-(void)setRoundTypeWithCenter:(CGPoint)center radius:(int)radius{
    
    CGRect frame = [UIScreen mainScreen].bounds;
    self.frame = frame;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sureTapClick:)];
    [self addGestureRecognizer:tap];

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:frame];

    [path appendPath:[UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;

    [self.layer setMask:shapeLayer];
}

//设置引导语的frame
-(void)setGuideTextWithFrame:(CGRect)textFame{
    
    XYMLabel *textLabel = [[XYMLabel alloc]initWithFrame:textFame];
    textLabel.text = @"";
    textLabel.textAlignment = NSTextAlignmentLeft;
    textLabel.numberOfLines = 2;
    textLabel.textColor = [UIColor whiteColor];
    textLabel.backgroundColor = [UIColor colorWithRed:86/255.f green:186/255.f blue:175/255.f alpha:1];
    textLabel.layer.cornerRadius = 4;
    textLabel.clipsToBounds = YES;
    [self addSubview:textLabel];
    self.textLabel = textLabel;
}

//showText的set方法
-(void)setShowText:(NSString *)showText {

    self.textLabel.text = showText;
    [self.textLabel sizeToFit];
}

//加到Window上面的View
-(void)show{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}


- (void)layoutSubviews{

}


@end
