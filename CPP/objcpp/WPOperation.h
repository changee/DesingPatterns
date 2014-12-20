//
//  WPOperation.h
//  DesingPatterns
//
//  Created by zhiquan on 14-12-20.
//  Copyright (c) 2014年 Chee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPOperation : NSObject
@property (nonatomic,assign) double numberA;
@property (nonatomic,assign) double numberB;
- (double)getResult;

+(WPOperation *)creatOperationWithOperate:(NSString *)operate;

+ (double)getResultWithNumA:(double)numberA numB:(double)numberB operate:(NSString *)op;

@end
