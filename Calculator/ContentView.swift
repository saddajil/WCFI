//
//  ContentView.swift
//  Calculator
//
//  Created by 허영호 on 2021/07/09.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    

    var body: some View {
        GeometryReader { metrics in
            HStack {
            
                
                VStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    })
                    
                }
                VStack{
                    
                }
            }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().landscape() .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            
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
