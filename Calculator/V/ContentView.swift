//
//  ContentView.swift
//  Calculator
//
//  Created by 허영호 on 2021/07/09.
//

import SwiftUI
import CoreData
import Combine

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var isMenuOpen:Bool = false
    @ObservedObject var CVM:CalcViewModel = CalcViewModel()
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Text(CVM.expression)
                    .font(.custom("expression", size: 30))
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.05, alignment: .trailing)
                Text(CVM.result)
                    .font(.custom("expression", size: 30))
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.15, alignment: .trailing)
                VStack{
                    
                    ForEach(0..<CVM.CalcButtonArr.count) { value in
                        setButton(arr: CVM.CalcButtonArr[value])
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height * 0.8, alignment: .center)
                if isMenuOpen {
                    HStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Button")
                        })
                    }
                }
            }
            .onAppear(perform: {
                CVM.setCalcButtonArr(Type: "Basic")
            })
        }
    }
    func setButton(arr:[ButtonModel]) -> some View{
        return AnyView(HStack{
            ForEach(arr,id:\.Symbol) { value in
                if value.Symbol == "Num"{
                Button(action: {
                        CVM.action(Symbol: value.Symbol)
                    }, label: {
                        Text(value.Symbol)
                    }).buttonStyle(numButtonStyle())
                }
                
                else if value.Symbol == "Char" {
                    Button(action: {
                        CVM.action(Symbol: value.Symbol)
                    }, label: {
                        Text(value.Symbol)
                    }).buttonStyle(charButtonStyle())
                }
                else {
                    Button(action: {
                        CVM.action(Symbol: value.Symbol)
                    }, label: {
                        Text(value.Symbol)
                    }).buttonStyle(arithmeticButtonStyle())
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .landscape()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            
    }
}


extension View {
    func landscape() -> some View {
        self.modifier(LandscapeModifier())
    }
}


