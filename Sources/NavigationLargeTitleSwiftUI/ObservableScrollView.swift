//
//  ObservableScrollView.swift
//  
//
//  Created by Kiarash Vosough on 4/22/23.
//

import SwiftUI

public struct ObservableScrollView<Content>: View where Content : View {

    // MARK: - Inputs

    private let content: (ScrollViewProxy) -> Content

    // MARK: LifeCycle

    public init(
        scrollOffset: Binding<CGFloat>,
        @ViewBuilder content: @escaping (ScrollViewProxy) -> Content
    ) {
        _scrollOffset = scrollOffset
        self.content = content
    }

    @Namespace private var scrollSpace
    @Binding private var scrollOffset: CGFloat

    public var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                content(proxy)
                    .background(
                        GeometryReader { geo in
                            let offset = -geo.frame(in: .named(scrollSpace)).minY
                            Color.clear
                                .preference(key: ScrollViewOffsetPreferenceKey.self, value: offset)
                        }
                    )
            }
        }
        .coordinateSpace(name: scrollSpace)
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
            withAnimation(.interactiveSpring()) {
                scrollOffset = value
            }
        }
    }
}
