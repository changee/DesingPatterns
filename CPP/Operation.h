//
//  Operation.h
//  DesingPatterns
//
//  Created by zhiquan on 14-12-9.
//  Copyright (c) 2014年 Chee. All rights reserved.
//

#ifndef __DesingPatterns__Operation__
#define __DesingPatterns__Operation__

#include <stdio.h>
#include <string>
using namespace std;
// 工厂类
class Operation;
class OperationFactory
{
public:
    static Operation *creatOperation(string operate);
};


// 基类
class Operation
{
private:
    double _numberA = 0;
    double _numberB = 0;
    
public:
    double getNumberA();
    void setNumberA(double value);

    double getNumberB();
    void setNumberB(double value);
    
    virtual double GetResult(); // C++ 必须加上virtual，编译器才只能这个是能被override的
    
    //
    static double GetResult(double numberA, double numberB, string operate);
    
};

// 子类
class OperationAdd : public Operation
{
public:
    double GetResult() override;
};

class OperationSub : public Operation
{
public:
    double GetResult();    
};

class OperationMul : public Operation
{
public:
    double GetResult();
};

class OperationDiv : public Operation
{
public:
    double GetResult();
};


#endif /* defined(__DesingPatterns__Operation__) */
