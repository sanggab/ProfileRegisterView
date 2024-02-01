//
//  ExerciseView.swift
//  ProfileRegisterView
//
//  Created by Gab on 2024/01/31.
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

public struct ExerciseView: View {
    public var exerciseList: [String] = ["Soccer", "BaseBall", "Taekwondo", "Karate", "Yoga", "Kickboxig", "Climbing", "Running", "Golf", "Cycling", "Ski", "Kayak", "Tennis", "Bowling", "Table Tennis", "Basketball", "Fencing", "Football", "Jogging", "Volleyball", "Hockey", "Ice Hockey", "Training", "Swimming", "Crossfit", "Meditation", "Sports dance", "Horse riding", "Skating", "Puzzle", "Drink", "Opera", "Photograph", "oneTwoThree", "FourFiveSix", "HiNiceTo", "My", "Name", "IS", "KAPPA", "GAB", "엄청 매우 긴 운동을 넣어보자", "진짜로 엄청 긴 운동을 넣어볼까 얼마나 잘 되는지"]
    
    @State private var selectedList: [String] = []
    @State private var listSelectedState: Bool = true
    
    @State private var btnState: Bool = false
    
    @Environment(\.layoutDirection) private var layoutDirection
    
    public var body: some View {
        saveBody
            .onChange(of: selectedList.count) { count in
                print("count -> \(count)")
                if count >= 5 {
                    print("더이상 선택 불가능")
                    listSelectedState = false
                } else if count > 0 && count < 5 {
                    print("선택 잘 했다")
                    listSelectedState = true
                    btnState = true
                } else if count == 0 {
                    btnState = false
                }
            }
    }
    
    @ViewBuilder
    private var saveBody: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                ExerciseHeaderView()
                    .frame(height: 50, alignment: .top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ExerciseHeadlineView()
                
                ZStack(alignment: .bottomLeading) {
                    ScrollView {
                        if layoutDirection == .leftToRight {
                            leadingListView
                                .padding(.top, 20)
                                .padding(.horizontal, 12)
                                .padding(.bottom, 32)
                        } else {
                            trailingListView
                                .padding(.top, 20)
                                .padding(.horizontal, 12)
                                .padding(.bottom, 32)
                        }
                    }
                    
                    LinearGradient(colors: [.white.opacity(0), .white.opacity(0.7), .white], startPoint: .top, endPoint: .bottom)
                        .frame(height: 32)
                }
                
                VStack(spacing: 0) {
                    
                    ZStack {
                        if layoutDirection == .leftToRight {
                            selectedLeadingListView
                                .padding(.top, 16)
                                .padding(.bottom, 10)
                        } else {
                            selectedTrailingListView
                                .padding(.top, 16)
                                .padding(.bottom, 10)
                        }
                    }
                    .frame(minHeight: 53)
//                    .padding(.horizontal, 12)
                        
                    ExerciseFooterView()
//                        .padding(.horizontal, 12)
                    
                    SkipNextView(nextBtnState: $btnState)
                        .skipBtnTap {
                            print("skipBtnTap")
                        }
                        .nextBtnTap { state in
                            print("nextBtnTap state -> \(state)")
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 24)
//                        .padding(.horizontal, 12)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 12)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.vertical)
    }
    
    @ViewBuilder
    private var leadingListView: some View {
        LeadingAlignmnetView(features: BaseFlowLayout(data: exerciseList, dataSpacing: 6, lineSpacing: 8.2, content: { exercise in
            
            Text(exercise)
                .font(.system(size: 15))
                .padding(.horizontal, 14)
                .padding(.top, 9.8)
                .padding(.bottom, 11)
                .background(selectedList.contains(exercise) ? .primary350 : .color242)
                .cornerRadius(12)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .foregroundColor(selectedList.contains(exercise) ? .gray50 : .greyishTwo)
                }
                .onTapGesture {
                    if selectedList.contains(exercise) {
                        selectedList.removeAll(where: { $0 == exercise})
                    } else {
                        if listSelectedState {
                            selectedList.append(exercise)
                        } else {
                            print("더이상 선택 불가능!!")
                        }
                    }
                }
            
        }))
    }
    
    @ViewBuilder
    private var trailingListView: some View {
        TrailingAlignmentView(features: BaseFlowLayout(data: exerciseList, dataSpacing: 6, lineSpacing: 8.2, content: { exercise in
            
            Text(exercise)
                .font(.system(size: 15))
                .padding(.horizontal, 14)
                .padding(.top, 9.8)
                .padding(.bottom, 11)
                .background(selectedList.contains(exercise) ? .primary350 : .color242)
                .cornerRadius(12)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .foregroundColor(selectedList.contains(exercise) ? .gray50 : .greyishTwo)
                }
                .onTapGesture {
                    if selectedList.contains(exercise) {
                        selectedList.removeAll(where: { $0 == exercise})
                    } else {
                        if listSelectedState {
                            selectedList.append(exercise)
                        } else {
                            print("더이상 선택 불가능!!")
                        }
                    }
                }
            
        }))
    }
    
    @ViewBuilder
    private var selectedLeadingListView: some View {
        LeadingAlignmnetView(features: BaseFlowLayout(data: selectedList, dataSpacing: 6, lineSpacing: 6, content: { exercise in
            
            HStack(spacing: 0) {
                Text(exercise)
                    .font(.system(size: 13))
                    .foregroundColor(.gray20)
                    .frame(height: 19)
                    .padding(.vertical, 4)
                    .padding(.leading, 8)
                
                Image("iconX")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .padding(.leading, 0)
                    .padding(.trailing, 6)
            }
            .background(.primary150)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.primary500)
            }
            .onTapGesture {
                selectedList.removeAll(where: { $0 == exercise})
            }
            
        }))
    }
    
    @ViewBuilder
    private var selectedTrailingListView: some View {
        TrailingAlignmentView(features: BaseFlowLayout(data: selectedList, dataSpacing: 6, lineSpacing: 6, content: { exercise in
            
            HStack(spacing: 0) {
                Text(exercise)
                    .font(.system(size: 13))
                    .foregroundColor(.gray20)
                    .frame(height: 19)
                    .padding(.vertical, 4)
                    .padding(.leading, 8)
                
                Image("iconX")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .padding(.leading, 0)
                    .padding(.trailing, 6)
            }
            .padding(.horizontal, 12)
            .background(.primary150)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.primary500)
            }
            .onTapGesture {
                selectedList.removeAll(where: { $0 == exercise})
            }
        }))
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
