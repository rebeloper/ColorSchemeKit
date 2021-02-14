//
//  ColorSchemeKitView.swift
//  
//
//  Created by Alex Nagy on 14.02.2021.
//

import SwiftUI

@available(iOS 14.0, *)
public struct ColorSchemeKitView<Content: View>: View {
    
    @StateObject public var colorSchemeManager = ColorSchemeManager()
    
    public let content: () -> Content
    
    public init(content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        content().environmentObject(colorSchemeManager)
    }
}
