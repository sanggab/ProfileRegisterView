//
//  ExerciseFooterView.swift
//  ProfileRegisterView
//
//  Created by Gab on 2024/01/31.
//

import SwiftUI

public struct ExerciseFooterView: View {
    public var body: some View {
        HStack(spacing: 0) {
            Image("iconVisible")
                .resizable()
                .frame(width: 12, height: 12)
                .padding(.leading, 8)
            
            Text("Always visible on profile")
                .font(.system(size: 13))
                .frame(height: 20)
                .foregroundColor(.gray50)
                .padding(.leading, 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct ExerciseFooterView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseFooterView()
    }
}
