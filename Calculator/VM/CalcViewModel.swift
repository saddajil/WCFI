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
    @Published var CalcButtonArr: [ButtonArrModel] = []
    @Published var expression = ""
    @Published var result = ""
    
    private var BasicButtonArr:[String] = ["C","±","%","÷","7","8","9","×","4","5","6","-","1","2","3","+","00","0",".","="]

    func setCalcButtonArr(Type:String) {
        
        if Type == "Basic" {
            var count = 0
            var countArr = 0
            var arr :  ButtonArrModel = ButtonArrModel(id: countArr, BtnArr: [])
            for i in BasicButtonArr {

                if (i.range(of:"[0-9]|00", options:.regularExpression) != nil) {
                    arr.BtnArr.append(ButtonModel(id:count,Symbol: i, buttonType: "Num"))
                }
                else if (i.range(of: "C|±|%", options:.regularExpression) != nil) {
                    arr.BtnArr.append(ButtonModel(id:count,Symbol: i, buttonType: "Char"))
                }
                else if (i.range(of: "\\+|\\-|\\÷|\\×|\\=", options:.regularExpression) != nil) {
                    arr.BtnArr.append(ButtonModel(id:count,Symbol: i, buttonType: "Arithmetic"))
                }
                count += 1
                if count % 4 == 0 {
                    
                    CalcButtonArr.append(arr)
                    countArr += 1
                    arr = ButtonArrModel(id: countArr, BtnArr: [])
                }
                
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
