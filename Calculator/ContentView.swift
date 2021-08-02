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
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2, alignment: .trailing)
                HStack{
//                    ForEach(id: \.self) { vale in
                    Button(action: {
                        CVM.action  (Symbol: "1")
                    }, label: {
                        Text("Button")
                    }).buttonStyle(numButtonStyle())
//                    }
                }.frame(width: geometry.size.width, height: geometry.size.height * 0.8, alignment: .center)
                if isMenuOpen {
                    HStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Button")
                        })
                    }
                }
            }
            
        }
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
struct LandscapeModifier: ViewModifier {
    let height = UIScreen.main.bounds.width // 1
    let width = UIScreen.main.bounds.height // 2
    
    func body(content: Content) -> some View {
        content
            .previewLayout(.fixed(width: width, height: height)) // 3
            .environment(\.horizontalSizeClass, .compact)
            .environment(\.verticalSizeClass, .compact)
    }
}

