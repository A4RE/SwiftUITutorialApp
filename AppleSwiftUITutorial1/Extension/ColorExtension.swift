//
//  ColorExtension.swift
//  AppleSwiftUITutorial1
//
//  Created by Андрей Коваленко on 11.09.2023.
//

import SwiftUI

extension Color {
    public static var myCustomColor: Color {
        return Color(hue: 0.34, saturation: 0.567, brightness: 0.506)
    }
    public static var mySecondaryColor: Color {
        return Color("SecondaryColor")
    }
    public static var BlackWhite: Color {
        return Color("BlackWhite")
    }
}
