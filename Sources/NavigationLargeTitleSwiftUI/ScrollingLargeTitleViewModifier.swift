//
//  ScrollingLargeTitleViewModifier.swift
//  
//
//  Created by Kiarash Vosough on 4/22/23.
//

import SwiftUI

extension View {

    public func largeNavigationTitleOnScroll(title: String) -> some View {
        self.modifier(ScrollingLargeTitleViewModifier(title: title))
    }
}

private struct ScrollingLargeTitleViewModifier: ViewModifier {

    // MARK: - Inputs

    private let title: String

    // MARK: - LifeCycle

    fileprivate init(title: String) {
        self.title = title
    }

    @State private var scrollOffset: CGFloat = .zero
    @Namespace private var titleSpace
    
    func body(content: Content) -> some View {
        ObservableScrollView(scrollOffset: $scrollOffset) { _ in
            if scrollOffset <= 0 {
                HStack {
                    Text(title)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 25)
                        .padding(.top, 20)
                        .matchedGeometryEffect(id: "T", in: titleSpace)
                }
            }
            content
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                if scrollOffset > 0 {
                    Text(title)
                        .font(.title)
                        .bold()
                        .matchedGeometryEffect(id: "T", in: titleSpace)
                } else {
                    EmptyView()
                }
            }
        }
    }
}
