//
//  FactoryViewController.swift
//  DesingPatterns
//
//  Created by zhiquan on 14-12-14.
//  Copyright (c) 2014年 Chee. All rights reserved.
//

import UIKit
@objc(FactoryViewController)
class FactoryViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var displayLbl: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var valueStack : NSMutableArray!
    var operatorStack : NSArray!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reset()
        self.textField.becomeFirstResponder()
    }
    
    @IBAction func reset() {
        self.valueStack = NSMutableArray()
        self.operatorStack = ["+","-","*","/"];
        self.refreshDisplay()
        self.refreshTips()
    }
    
    // 用户输入return
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if self.pushValue(textField.text){
            textField.text = nil;
        }
        else{
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                textField.backgroundColor = UIColor.redColor()
            }, completion: { (Bool) -> Void in
                textField.backgroundColor = UIColor.clearColor()
            })
        }
        return false;
    }
    
    // 存储用户输入
    func pushValue(aValue: String) -> Bool
    {
        var result : Bool = false
        var stackWillbeFull : Bool = false
        switch self.valueStack.count
        {
        case 0:
            result = true
        
        case 1:
            result = (self.operatorStack.containsObject(aValue))

        case 2:
            let isIllegal = ((self.valueStack.lastObject as String) == "/" && aValue == "0")
            result = !isIllegal
            stackWillbeFull = true

        default:
            result = false
        }
        
        if result{
            self.valueStack.addObject(aValue)
            self.refreshDisplay()
            if stackWillbeFull{
                self.stackfull()
            }
            self.refreshTips()
        }
        
        return result
    }
    
    // 执行运算
    func performCalculate(values : NSArray){
        if values.count == 3{
            if let opr = WPOperation.creatOperationWithOperate(values[1] as String){
                opr.numberA = values[0].doubleValue
                opr.numberB = values[2].doubleValue
                let result = opr.getResult()
                // let result = WPOperation.getResultWithNumA(values[0].doubleValue, numB: values[2].doubleValue, operate: values[1] as String)
                self.displayLbl.text = self.displayLbl.text?.stringByAppendingString(" = \(result)")
            }
        }
    }
    
    // 清空数值存储
    func stackfull(){
        self.performCalculate(self.valueStack)
        self.valueStack.removeAllObjects()
    }
    
    
    func refreshDisplay(){
        var stringForDisplay = ""
        for aValue in self.valueStack{
            stringForDisplay = stringForDisplay.stringByAppendingString(aValue as String)
        }
        self.displayLbl.text = stringForDisplay;
    }
    
    func refreshTips(){
        var tips = ""
        switch self.valueStack.count
        {
        case 0:
            tips = "输入数值A, return确定"
            
        case 1:
            tips = "输入运算符, return确定"
            
        case 2:
            tips = "输入数值B, return确定"
            
        default:
            tips = ""
        }
        self.textField.placeholder = tips;
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.textField.resignFirstResponder()
    }

}

















