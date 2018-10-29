//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Yoshiaki Kato on 2018/10/28.
//  Copyright © 2018 Yoshiaki Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var result: UILabel!
    //計算結果:数値
    var resultInt: Int = 0
    //入力結果:文字列
    var inputString: String? = ""
    //入力結果:数値
    var inputInt: Int = 0
    //四則演算ID
    //(1:+,2:-,3:*,4:/,9:=,0:c)
    var calculateID: Int = 0
    //四則
    var isSeveralSymbol: Bool = false
    //直前入力が数値か？
    var isNumber = false
    //前に入力した数値
    var previousNumber:String? = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = String(resultInt)
    }
    
    @IBAction func cButton(_ sender: Any) {
        resultInt = 0
        inputInt = 0
        inputString = ""
        calculateID = 0
        isSeveralSymbol = false
        isNumber = false
        previousNumber = "0"
        result.text = String(resultInt)
    }
    
    func debug() {
        print("resultInt = \(resultInt)")
        print("inputString = \(inputString!)")
        print("inputInt = \(inputInt)")
        print("calculateID = \(calculateID)")
        print("isSeveralSymbol = \(isSeveralSymbol)")
        print("isNumber = \(isNumber)")
        print("previousNumber = \(previousNumber!)")
        print("----------------------")
    }
    
    // 数値入力時
    func inputNumber(number: String) {
        
        inputString = inputString! + number
        
        //数値を表示
        inputInt = Int(inputString!)!
        result.text = String(inputInt)
        
        isNumber = true

    }
    
    // (+-*/)入力時
    func inputSymbol(calculateID: Int) {
        
        self.calculateID = calculateID
        
        if isNumber {
            inputInt = Int(inputString!)!
            inputString = ""
            
            //初回入力時
            if isSeveralSymbol == false {
                resultInt = inputInt
                result.text = String(resultInt)
                isSeveralSymbol = true
            }
            //2回目以降入力時
            else {
                calculate(calculateID: calculateID)
                result.text = String(resultInt)
            }
        }
        
        isNumber = false
        
    }
    
    @IBAction func equalButton(_ sender: Any) {
        
        print("=を入力")
        debug()
        
        //直前が数値入力
        if isNumber {
            inputInt = Int(inputString!)!
            inputString = ""
            calculate(calculateID: calculateID)
            result.text = String(resultInt)
        }
        else if calculateID == 9 && inputString != "" {
            inputInt = Int(inputString!)!
            inputString = ""
            calculate(calculateID: calculateID)
            result.text = String(resultInt)
        }
        
        calculateID = 9
        isNumber = false
        isSeveralSymbol = false
        
        print("=を入力処理後")
        debug()
        
    }
    
    func calculate(calculateID: Int) {
        switch calculateID {
        case 1:
            resultInt = resultInt + inputInt
        case 2:
            resultInt = resultInt - inputInt
        case 3:
            resultInt = resultInt * inputInt
        case 4:
            resultInt = resultInt / inputInt
        default :
            break
        }
        
    }
    
    @IBAction func waruButton(_ sender: Any) {
        inputSymbol(calculateID: 4)
    }
    
    @IBAction func kakeruButton(_ sender: Any) {
        inputSymbol(calculateID: 3)
    }
    
    @IBAction func hikuButton(_ sender: Any) {
        inputSymbol(calculateID: 2)
    }
    
    @IBAction func tasuButton(_ sender: Any) {
        inputSymbol(calculateID: 1)
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        inputNumber(number: "7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        inputNumber(number: "8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        inputNumber(number: "9")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        inputNumber(number: "4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        inputNumber(number: "5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        inputNumber(number: "6")
    }
    
    @IBAction func oneButton(_ sender: Any) {
        inputNumber(number: "1")
    }
    
    @IBAction func twoButton(_ sender: Any) {
        inputNumber(number: "2")
    }
    
    @IBAction func threeButton(_ sender: Any) {
        inputNumber(number: "3")
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        inputNumber(number: "0")
    }
}
