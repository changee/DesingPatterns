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
    
    // MARK: A001
    // 这里如果改成策略模式：
    // 1. 去除Factory类, 把switch哪个策略类的逻辑移到这里.
    // 2. 把数据移到这个Context类里，策略类只维护算法部分.
    // 3. 结合OC的动态绑定特性或者JAVA的反射特性，可以根据参数op，生成对于的类。
    
    /* 示例，动态绑定示例
     Class ConcreteStrategy = NSClassFromString(@"ConcreteStrategy + 参数OP");
     WPOperation *concreteStrategy = [[ConcreteStrategy alloc] init];
     operationObj.opr = concreteStrategy;
     */
    
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
