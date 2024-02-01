//
//  ContentView.swift
//  ProfileRegisterView
//
//  Created by Gab on 2024/01/31.
//

import SwiftUI

public struct ContentView: View {
    public var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ExerciseView()
                } label: {
                    Text("Exercise")
                }
                
                NavigationLink {
                    Text("Interests")
                } label: {
                    Text("Interests")
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
