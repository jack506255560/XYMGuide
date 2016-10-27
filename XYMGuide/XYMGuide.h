//
//  XYMGuide.h
//  healthcoming
//
//  Created by jack xu on 16/10/25.
//  Copyright © 2016年 Franky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYMGuide : UIView

//用来显示的的引导文字
@property(nonatomic,strong)NSString *showText;


//提供的类方法
- (instancetype)initWithName:(NSString *)name;

-(void)setRoundTypeWithCenter:(CGPoint)center radius:(int)radius;

-(void)setRectangleTypeWithFrame:(CGRect)rectMake cornerRadius:(int)cornerRadius;

-(void)setGuideTextWithFrame:(CGRect)textFame;

-(void)show;

@end
