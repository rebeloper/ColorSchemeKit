//
//  ColorSchemeManager.swift
//  
//
//  Created by Alex Nagy on 14.02.2021.
//

import SwiftUI

@available(iOS 14.0, *)
public class ColorSchemeManager: ObservableObject {
    
    @AppStorage(wrappedValue: 0, "colorSchemeManager_ColorScheme") public var appColorScheme: Int
    @Published public var colorScheme: ColorSchemeKitColorScheme = .initial
    public static var deviceColorScheme: ColorScheme = .light
    
    public init() {
        self.colorScheme = ColorSchemeKitColorScheme(code: appColorScheme)
    }
    
    /// Switches the app Color Scheme
    public func switchTo(_ colorScheme: ColorSchemeKitColorScheme) {
        if colorScheme == .system {
            appColorScheme = 0
            if ColorSchemeManager.deviceColorScheme == .light {
                self.colorScheme = .light
            } else {
                self.colorScheme = .dark
            }
        } else if colorScheme == .light {
            appColorScheme = 1
            self.colorScheme = .light
        } else {
            appColorScheme = 2
            self.colorScheme = .dark
        }
    }
    
    /// Toggles the app Color Scheme between .light and .dark
    public func toggle() {
        let currentColorScheme = self.colorScheme
        
        if currentColorScheme == .system {
            appColorScheme = 0
            if ColorSchemeManager.deviceColorScheme == .light {
                self.colorScheme = .dark
            } else {
                self.colorScheme = .light
            }
        } else if currentColorScheme == .light {
            appColorScheme = 2
            self.colorScheme = .dark
        } else {
            appColorScheme = 1
            self.colorScheme = .light
        }
    }
    
}
