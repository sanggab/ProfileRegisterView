//
//  SkipNextView.swift
//  ProfileRegisterView
//
//  Created by Gab on 2024/01/31.
//

import SwiftUI

public struct SkipNextView: View {
    @Binding public var nextBtnState: Bool
    private var skipEvent: (() -> Void)?
    private var nextEvent: ((Bool) -> Void)?
    
    public init(nextBtnState: Binding<Bool>) {
        self._nextBtnState = nextBtnState
    }
    
    public var body: some View {
        HStack {
            
            Text("SKIP")
                .font(.system(size: 16))
                .frame(height: 24)
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
                .onTapGesture {
                    skipEvent?()
                }
            
            Spacer()
            
            Image(nextBtnState ? "btnJoinNext" : "btnJoinNextDisabled")
                .resizable()
                .frame(width: 48, height: 48)
                .onTapGesture {
                    nextEvent?(nextBtnState)
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public func skipBtnTap(_ event: (() -> Void)? = nil) -> SkipNextView {
        var view = self
        view.skipEvent = event
        return view
    }
    
    public func nextBtnTap(_ event: ((Bool) -> Void)? = nil) -> SkipNextView {
        var view = self
        view.nextEvent = event
        return view
    }
}

struct SkipNextView_Previews: PreviewProvider {
    static var previews: some View {
        SkipNextView(nextBtnState: .constant(false))
    }
}
