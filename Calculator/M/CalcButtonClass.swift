//
//  CalcButtonClass.swift
//  Calculator
//
//  Created by 허영호 on 2021/08/02.
//

import Foundation

struct ButtonModel:Codable, Identifiable{
    let id : Int
    
    init(id:Int,Symbol:String, buttonType:String){
        self.id = id
        self.Symbol = Symbol
        self.BtnType = buttonType
    }
    
    var Symbol : String = ""
    var BtnType : String = ""

}
struct ButtonArrModel: Codable, Identifiable{
    let id : Int
    var BtnArr:[ButtonModel] = []
}
