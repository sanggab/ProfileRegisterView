//
//  ExerciseHeadlineView.swift
//  ProfileRegisterView
//
//  Created by Gab on 2024/01/31.
//

import SwiftUI

public struct ExerciseHeadlineView: View {
    public var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Image("iconExerciseS")
                .padding(.leading, 12)
                .padding(.top, 7)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("What exercise do you do?")
                    .font(.system(size: 18))
                    .frame(height: 26)
                    .foregroundColor(.gray20)
                
                Text("Max 5")
                    .font(.system(size: 13))
                    .foregroundColor(.gray50)
            }
            .padding(.top, 6)
            .padding(.leading, 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ExerciseHeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseHeadlineView()
    }
}
