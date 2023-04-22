//  MIT License
//
//  Copyright (c) 2023 Kiarash Vosough
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
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
