//
//  ScrollViewOffsetPreferenceKey.swift
//  
//
//  Created by Kiarash Vosough on 4/22/23.
//

import SwiftUI

internal struct ScrollViewOffsetPreferenceKey: PreferenceKey {

    internal static var defaultValue: CGFloat = .zero
    
    internal static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
