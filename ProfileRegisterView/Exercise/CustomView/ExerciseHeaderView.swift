//
//  ExerciseHeaderView.swift
//  ProfileRegisterView
//
//  Created by Gab on 2024/01/31.
//

import SwiftUI

public struct ExerciseHeaderView: View {
    public var body: some View {
        ZStack {
            Image("iconBack")
                .padding(.all, 8)
                .padding(.leading, 4)
                .padding(.top, 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ExerciseHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseHeaderView()
    }
}
