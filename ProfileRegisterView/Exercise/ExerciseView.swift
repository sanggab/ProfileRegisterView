//
//  ExerciseView.swift
//  ProfileRegisterView
//
//  Created by Gab on 2024/01/31.
//

import SwiftUI
import SwiftUIIntrospect

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
    public var exerciseList: [String] = ["Soccer", "BaseBall", "Taekwondo", "Karate", "Yoga", "Kickboxing", "Climbing", "Running", "Golf", "Cycling", "Ski", "Kayak", "Tennis", "Bowling", "Table Tennis", "Basketball", "Fencing", "Football", "Jogging", "Volleyball", "Hockey", "Ice Hockey", "Training", "Swimming", "Crossfit", "Meditation", "Sports dance", "Horse riding", "Skating", "Puzzle", "Drink", "Opera", "Photograph", "oneTwoThree", "FourFiveSix", "HiNiceTo", "My", "Name", "IS", "KAPPA", "GAB", "엄청 매우 긴 운동을 넣어보자", "진짜로 엄청 긴 운동을 넣어볼까 얼마나 잘 되는지"]
    
    @State private var selectedList: [String] = []
    @State private var listSelectedState: Bool = true
    
    @State private var selectedListHeight: CGFloat = 0
    
    @State private var btnState: Bool = false
    
    @Environment(\.layoutDirection) private var layoutDirection
    
    public var body: some View {
        saveBody
            .onChange(of: selectedList.count) { count in
                if count >= 30 {
                    listSelectedState = false
                } else if count > 0 && count < 30 {
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
                    
                    mainScrollView
                    
                    LinearGradient(colors: [.white.opacity(0), .white.opacity(0.7), .white], startPoint: .top, endPoint: .bottom)
                        .frame(height: 32)
                }
                .padding(.top, 20)
                
                VStack(spacing: 0) {

                    selectedScrollView
                    
                    ExerciseFooterView()
                        .padding(.horizontal, 12)
                    
                    SkipNextView(nextBtnState: $btnState)
                        .skipBtnTap {
                            print("skipBtnTap")
                        }
                        .nextBtnTap { state in
                            print("nextBtnTap state -> \(state)")
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 24)
                        .padding(.horizontal, 12)
                }
                .frame(maxWidth: .infinity)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.vertical)
    }
    
}

// MARK: - 메인 리스트 @ViewBuilder
extension ExerciseView {
    
    @ViewBuilder
    private var mainScrollView: some View {
        ScrollView(showsIndicators: false) {
            mainListView
                .padding(.top, 1)
                .padding(.horizontal, 12)
                .padding(.bottom, 32)
        }
    }
    
    @ViewBuilder
    private var mainListView: some View {
        if layoutDirection == .leftToRight {
            leadingListView
        } else {
            trailingListView
        }
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
                        .strokeBorder(selectedList.contains(exercise) ? .gray50 : .greyishTwo, lineWidth: 1)
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
                        .strokeBorder(selectedList.contains(exercise) ? .gray50 : .greyishTwo, lineWidth: 1)
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
}

// MARK: - 선택된 리스트 @ViewBuilder
extension ExerciseView {
    
    @ViewBuilder
    private var selectedScrollView: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(showsIndicators: false) {
                selectedListView
                    .onPreferenceChange(SizePreferenceKey.self) { size in
                        print("frameSize -> \(size)")
                        selectedListHeight = size.height
                    }
                    .padding(.vertical, 2)
                    .padding(.horizontal, 12)
                    .onChange(of: selectedListHeight) { newValue in
                        if newValue > 119 {
                            scrollProxy.scrollTo(selectedList.last ?? "")
                        }
                    }
            }
            .padding(.top, 14)
            .padding(.bottom, 8)
            .frame(maxHeight: getScrollHeight())
            .introspect(.scrollView, on: .iOS(.v15, .v16, .v17)) { scrollView in
                /// 119인 이유는 3줄 초과 시 스크롤이기 때문에 3줄오버될때의 크기가 119가 넘기 떄문에 걸어뒀따
                scrollView.isScrollEnabled = selectedListHeight > 119
                scrollView.bounces = false
            }
        }
    }
    
    @ViewBuilder
    private var selectedListView: some View {
        if layoutDirection == .leftToRight {
            selectedLeadingListView
        } else {
            selectedTrailingListView
        }
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
                    .onTapGesture {
                        selectedList.removeAll(where: { $0 == exercise})
                    }
            }
            .id(exercise)
            .background(.primary150)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(.primary500, lineWidth: 1, antialiased: true)
//                    .stroke(.primary500, lineWidth: 1)
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
                    .onTapGesture {
                        selectedList.removeAll(where: { $0 == exercise})
                    }
            }
            .id(exercise)
            .padding(.horizontal, 12)
            .background(.primary150)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.primary500, lineWidth: 1)
            }
        }))
    }
}

// MARK: - 선택된 리스트 높이 구하기
extension ExerciseView {
    
    private func getScrollHeight() -> CGFloat {
        if selectedListHeight == 0 {
            return 53
        } else {
            return min(selectedListHeight + 28, 121)
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
