//
//  SecondViewController.swift
//  Calculator
//
//  Created by 공지원 on 20/11/2018.
//  Copyright © 2018 공지원. All rights reserved.
// Second Scene

import UIKit

class SecondViewController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet weak var opButton: UIButton! //연산자 버튼(+,-,*,/)
    @IBOutlet weak var display: UILabel! //결과 보여주는 view
    @IBOutlet var superviewOfDisplay: UIView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        opButton.setTitle(navigationItem.title, for: .normal)
        
        superviewOfDisplay.layer.cornerRadius = 5.0
    }
    
    //display값은 String니깐 실제 계산을 위해서 Double로 바꿔주기
    private var displayValue: Double {
        guard let displayText = display.text else { return 0.0 }
        if let value = Double(displayText) {
            return value
        }
        return 0
    }
    
    //사용자가 숫자를 입력중인지 아닌지 판단하기 위한 변수
    private var isUserInTheMiddleOfTyping = false
    
    //MARK: IBAction
    //숫자를 눌렀을 때
    @IBAction func touchDigit(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text else {
            return
        }
        
        //아직 숫자를 입력중이라면
        if isUserInTheMiddleOfTyping {
            guard let displayText = display.text else { return }
            let textCurrentlyInDisplay = displayText
            display.text = textCurrentlyInDisplay + digit
        } else {
            //입력중이 아니면
            display.text = digit
        }
        isUserInTheMiddleOfTyping = true
    }
    
    private var sum: Double = 0.0
 
    //실제 계산
    @IBAction func performOperation(_ sender: UIButton) {
        
        //mathmaticalSymbol => +,-,*,/
        if let mathmaticalSymbol = sender.currentTitle {
            isUserInTheMiddleOfTyping = false
            
            switch mathmaticalSymbol {
            case "+":
                //처음으로 숫자를 입력하는 거면
                if sum == 0 { sum = displayValue }
                //이미 누적된 값이 있다면
                else { sum += displayValue }
                break
            case "-":
                if sum == 0 { sum = displayValue }
                else { sum -= displayValue }
                break
            case "*":
                if sum == 0 { sum = displayValue }
                else { sum *= displayValue }
                break
            case "/":
                if sum == 0 { sum = displayValue }
                else { sum /= displayValue }
                break
            default:
                print("잘못된 operator입니다.")
                return
            }
            display.text = String(sum)
        }
    }
}
