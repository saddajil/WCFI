//
//  CalculatorApp.swift
//  Calculator
//
//  Created by 허영호 on 2021/07/09.
//

import SwiftUI

@main
struct CalculatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
