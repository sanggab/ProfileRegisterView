//
//  FlowLayoutListView.swift
//  ProfileRegisterView
//
//  Created by Gab on 2024/02/02.
//

import SwiftUI

public struct BaseFlowLayout<Element, ContentView: View>: FlowLayoutFeatures {
    
    public var data: [Element]
    public var dataSpacing: CGFloat
    public var lineSpacing: CGFloat
    public var content: (Element) -> ContentView

    public init(data: [Element],
         dataSpacing: CGFloat = 0,
         lineSpacing: CGFloat = 0,
         @ViewBuilder content: @escaping (Element) -> ContentView) {
        self.data = data
        self.dataSpacing = dataSpacing
        self.lineSpacing = lineSpacing
        self.content = content
    }
}


public struct FlowLayoutListView<Element, ContentView: View>: View {
    
    public var list: [Element]
    public var dataSpacing: CGFloat
    public var lineSpacing: CGFloat
    
    public var content: (Element) -> ContentView
    
    private var frameSize: ((CGSize) -> Void)?
    
    @Environment(\.layoutDirection) private var layoutDirection
    
    public init(list: [Element],
                dataSpacing: CGFloat,
                lineSpacing: CGFloat,
                @ViewBuilder content: @escaping (Element) -> ContentView) {
        self.list = list
        self.dataSpacing = dataSpacing
        self.lineSpacing = lineSpacing
        self.content = content
    }
    
    public var body: some View {
        listView
            .onPreferenceChange(SizePreferenceKey.self) { size in
                frameSize?(size)
            }
    }
    
    @ViewBuilder
    private var listView: some View {
        if layoutDirection == .leftToRight {
            leadingListView
        } else {
            trailingListView
        }
    }
    
    @ViewBuilder
    private var leadingListView: some View {
        LeadingAlignmnetView(features: BaseFlowLayout(data: list, dataSpacing: dataSpacing, lineSpacing: lineSpacing, content: { data in
            content(data)
        }))
    }
    
    @ViewBuilder
    private var trailingListView: some View {
        TrailingAlignmentView(features: BaseFlowLayout(data: list, dataSpacing: dataSpacing, lineSpacing: lineSpacing, content: { data in
            content(data)
        }))
    }
    
    public func size(_ size: @escaping ((CGSize) -> Void)) -> FlowLayoutListView {
        var view = self
        view.frameSize = size
        return view
    }
}

//struct FlowLayoutListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlowLayoutListView()
//    }
//}
