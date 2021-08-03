//
//  CalcViewModel.swift
//  Calculator
//
//  Created by 허영호 on 2021/08/02.
//

import Foundation
import Combine

class CalcViewModel : ObservableObject {
    @Published var CalcMode:Int = 0
    @Published var CalcButtonArr: [ButtonModel] = []
    @Published var expression = ""
    @Published var result = ""
    
    private var BasicButtonArr:[String] = ["C","±"]

    func setCalcButtonArr(Type:String) {
        
        if Type == "Basic" {
            for i in BasicButtonArr {
                
                CalcButtonArr.append(ButtonModel(Symbol: i, buttonType: "Num"))
            }
        }
    }
    func action(Symbol:String){
        switch Symbol {
        case "1","2","3","4","5","6","7","8","9":
            expression += Symbol
        case "+","-","*","/":
            if expression == "" {
                
            }
            else {
                expression += Symbol
            }
        case "=" :
            Calc()
        default:
            break
        }

    }
    func Calc(){
        result = "1"
    }
}
