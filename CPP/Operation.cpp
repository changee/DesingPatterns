//
//  Operation.cpp
//  DesingPatterns
//
//  Created by zhiquan on 14-12-9.
//  Copyright (c) 2014年 Chee. All rights reserved.
//

#include "Operation.h"

Operation * OperationFactory::creatOperation(string operate)
{
    Operation *opera = nullptr; 
    if (operate == "+") {
        opera = new OperationAdd();
    }
    else if (operate == "-") {
        opera = new OperationSub();
    }
    else if (operate == "*") {
        opera = new OperationMul();
    }
    else if (operate == "/") {
        opera = new OperationDiv();
    }
    else {
        opera = new Operation();
    }
    return opera;
}


double Operation::getNumberA()
{
    return _numberA;
}
void Operation::setNumberA(double value)
{
    _numberA = value;
}

double Operation::getNumberB()
{
    return _numberB;
}
void Operation::setNumberB(double value)
{
    _numberB = value;
}

double Operation::GetResult()
{
    return 0;
}


double Operation::GetResult(double numberA, double numberB, string operate)
{
    double result = 0;
    if (operate == "+") {
        result = numberA + numberB;
    }
    else if (operate == "-") {
        result = numberA - numberB;
    }
    else if (operate == "*") {
        result = numberA * numberB;
    }
    else if (operate == "/") {
        if (numberB == 0) {
            // assert
        }
        result = numberA / numberB;
    }    
    return result;
}



// ---------- override ------------

// Add

double OperationAdd::GetResult()
{
    return this->getNumberA() + this->getNumberB();
}

// subtract

double OperationSub::GetResult()
{
    return this->getNumberA() - this->getNumberB();
}

// multiply

double OperationMul::GetResult()
{
    return this->getNumberA() * this->getNumberB();
}

// divide

double OperationDiv::GetResult()
{
    double numB = getNumberB();
    if (numB == 0) {
        throw "除数不能为0";
    }
    return this->getNumberA() / this->getNumberB();
}














