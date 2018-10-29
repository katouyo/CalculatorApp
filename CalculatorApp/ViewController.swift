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
    var inputString: String = ""
    //入力結果:数値
    var inputInt: Int = 0
    //入力が数値か？
    var isNumber: Bool = false
    //四則演算ID
    var calculateID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showResult()
    }
    
    @IBAction func cButton(_ sender: Any) {
        isNumber = false
        resultInt = 0
        inputInt = 0
        inputString = ""
        calculateID = 0
        showResult()
    }
    
    func debug() {
        print("resultInt = \(resultInt)")
        print("inputString = \(inputString)")
        print("inputInt = \(inputInt)")
        print("isNumber = \(isNumber)")
        print("calculateID = \(calculateID)")
        print("----------------------")
    }
    
    //計算結果を表示
    func showResult(){
        result.text = String(resultInt)
    }
    
    //入力を表示
    func showInput(){
        
        inputInt = Int(inputString)!
        
        //数値入力
        if isNumber {
            result.text = String(inputInt)
        } else {
            resultInt = inputInt
            inputString = ""
        }
    }
    
    @IBAction func equalButton(_ sender: Any) {
        isNumber = false
        calculate(id: calculateID)
        showResult()
        debug()
    }
    
    func calculate(id: Int) {
        switch id {
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
        isNumber = false
        calculateID = 4
        showInput()
    }
    
    @IBAction func kakeruButton(_ sender: Any) {
        isNumber = false
        calculateID = 3
        showInput()
    }
    
    @IBAction func hikuButton(_ sender: Any) {
        debug()
        isNumber = false
        calculateID = 2
        showInput()
        debug()
    }
    
    @IBAction func tasuButton(_ sender: Any) {
        debug()
        isNumber = false
        calculateID = 1
        showInput()
        debug()
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        isNumber = true
        inputString = inputString + "7"
        showInput()
    }
    
    @IBAction func eightButton(_ sender: Any) {
        isNumber = true
        inputString = inputString + "8"
        showInput()
    }
    
    @IBAction func nineButton(_ sender: Any) {
        isNumber = true
        inputString = inputString + "9"
        showInput()
    }
    
    @IBAction func fourButton(_ sender: Any) {
        isNumber = true
        inputString = inputString + "4"
        showInput()
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        isNumber = true
        inputString = inputString + "5"
        showInput()
    }
    
    @IBAction func sixButton(_ sender: Any) {
        isNumber = true
        inputString = inputString + "6"
        showInput()
    }
    
    @IBAction func oneButton(_ sender: Any) {
        isNumber = true
        inputString = inputString + "1"
        showInput()
    }
    
    @IBAction func twoButton(_ sender: Any) {
        isNumber = true
        inputString = inputString + "2"
        showInput()
    }
    
    @IBAction func threeButton(_ sender: Any) {
        isNumber = true
        inputString = inputString + "3"
        showInput()
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        isNumber = true
        inputString = inputString + "0"
        showInput()
    }
}

