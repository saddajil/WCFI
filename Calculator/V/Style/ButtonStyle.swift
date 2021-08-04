//
//  ButtonStyle.swift
//  Calculator
//
//  Created by 허영호 on 2021/08/02.
//

import Foundation
import SwiftUI

public struct MyButtonStyleConfiguration {
    public let label: ButtonStyleConfiguration.Label
    public let isPressed: Bool
}
struct numButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.black)
            .padding()
            .background( RoundedRectangle(cornerRadius: 5.0).fill(Color.gray).opacity(0.3))
    }

}
struct charButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.black)
            .padding()
            .background( RoundedRectangle(cornerRadius: 5.0).fill(Color.gray))
    }

}
struct arithmeticButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
           configuration.label
               .padding()
               .foregroundColor(.white)
               .padding()
               .background( RoundedRectangle(cornerRadius: 0.0).fill(Color.orange)
           )
       }

}
