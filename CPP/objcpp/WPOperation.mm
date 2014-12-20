//
//  WPOperation.m
//  DesingPatterns
//
//  Created by zhiquan on 14-12-20.
//  Copyright (c) 2014年 Chee. All rights reserved.
//

#import "WPOperation.h"
#import "Operation.h"
@interface WPOperation()
{
    Operation *opr;
}
@end

@implementation WPOperation
- (void)dealloc
{
    delete opr;
}

- (double)getResult
{
    return opr->GetResult();
}

+(WPOperation *)creatOperationWithOperate:(NSString *)op
{
    if (!op) {
        return nil;
    }
    const char* operate = [op UTF8String];

    WPOperation *operationObj = [[WPOperation alloc] init];
    operationObj->opr = OperationFactory::creatOperation(operate);
    return operationObj;
}


+ (double)getResultWithNumA:(double)numberA numB:(double)numberB operate:(NSString *)op
{
    if (!op) {
        return 0;
    }
    const char* operate = [op UTF8String];
    return Operation::GetResult(numberA, numberB, operate);
}

#pragma mark - getter setter

- (double)numberA
{
    return opr->getNumberA();
}

- (void)setNumberA:(double)numberA
{
    opr->setNumberA(numberA);
}

- (double)numberB
{
    return opr->getNumberB();
}

- (void)setNumberB:(double)numberB
{
    opr->setNumberB(numberB);
}


@end
