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
    func action(Symbol:String){
        expression += Symbol
    }
}
