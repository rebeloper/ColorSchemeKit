//
//  ColorSchemeView.swift
//  
//
//  Created by Alex Nagy on 14.02.2021.
//

import SwiftUI

@available(iOS 14.0, *)
public struct ColorSchemeView<Content: View>: View {
    
    @StateObject public var colorSchemeManager = ColorSchemeManager()
    
    public let content: () -> Content
    
    public var body: some View {
        content().environmentObject(colorSchemeManager)
    }
}

@available(iOS 14.0, *)
public struct ColorSchemeViewModifier: ViewModifier {
    public func body(content: Content) -> some View {
        ColorSchemeView {
            content
        }
    }
}

@available(iOS 14.0, *)
extension View {
    public func usesColorSchemeKit() -> some View {
        modifier(ColorSchemeViewModifier())
    }
}
