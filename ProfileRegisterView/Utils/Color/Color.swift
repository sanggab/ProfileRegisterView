//
//  Color.swift
//  ProfileRegisterView
//
//  Created by Gab on 2024/01/31.
//

import UIKit
import SwiftUI

public extension UIColor {
    
    static var color242: UIColor {
        UIColor(white: 242.0 / 255.0, alpha: 1.0)
    }
    
    static var greyishTwo: UIColor {
        UIColor(white: 184.0 / 255.0, alpha: 1.0)
    }
    
    static var gray20: UIColor {
        UIColor(white: 32.0 / 255.0, alpha: 1.0)
    }
    
    static var gray50: UIColor {
        UIColor(white: 80.0 / 255.0, alpha: 1.0)
    }
    
    static var primary150: UIColor {
        UIColor(red: 255.0 / 255.0, green: 250.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0)
    }
    
    static var primary350: UIColor {
        UIColor(red: 255.0 / 255.0, green: 231.0 / 255.0, blue: 136.0 / 255.0, alpha: 1.0)
    }
    
    static var primary500: UIColor {
        UIColor(red: 255.0 / 255.0, green: 206.0 / 255.0, blue: 14.0 / 255.0, alpha: 1.0)
    }
    
    static var white0: UIColor {
        UIColor(white: 255.0 / 255.0, alpha: 0.0)
    }
    
    static var white07: UIColor {
        UIColor(white: 255.0 / 255.0, alpha: 0.0)
    }
    
}

public extension ShapeStyle where Self == Color {
    
    static var color242: Color {
        Color(uiColor: .color242)
    }
    
    static var greyishTwo: Color {
        Color(uiColor: .greyishTwo)
    }
    
    static var gray20: Color {
        Color(uiColor: .gray20)
    }
    
    static var gray50: Color {
        Color(uiColor: .gray50)
    }
    
    static var primary150: Color {
        Color(uiColor: .primary150)
    }
    
    static var primary350: Color {
        Color(uiColor: .primary350)
    }
    
    static var primary500: Color {
        Color(uiColor: .primary500)
    }
    
    static var white0: Color {
        Color(uiColor: .white0)
    }
    
    static var white07: Color {
        Color(uiColor: .white07)
    }
}
