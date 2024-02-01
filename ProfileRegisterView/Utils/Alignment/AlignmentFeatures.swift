//
//  AlignmentFeatures.swift
//  ProfileRegisterView
//
//  Created by Gab on 2024/01/31.
//

import SwiftUI

public protocol FlowLayoutFeatures {
    associatedtype Element
    associatedtype ContentView: View
    
    var data: [Element] { get }
//    var direction: FlowDirection { get }
    var dataSpacing: CGFloat { get }
    var lineSpacing: CGFloat { get }
    
    @ViewBuilder var content: (Element) -> ContentView { get }
}
