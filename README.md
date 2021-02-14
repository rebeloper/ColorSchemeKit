# ColorSchemeKit

![swift v5.3](https://img.shields.io/badge/swift-v5.3-orange.svg)
![platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg)
![deployment target iOS 14](https://img.shields.io/badge/deployment%20target-iOS%2014-blueviolet)

**ColorSchemeKit** is a lightweight library `SwiftUI` library which lets your app choose it's own `.colorScheme` regardless of the System Appearance.

## 💻 Installation
### 📦 Swift Package Manager
Using <a href="https://swift.org/package-manager/" rel="nofollow">Swift Package Manager</a>, add it as a Swift Package in Xcode 11.0 or later, `select File > Swift Packages > Add Package Dependency...` and add the repository URL:
```
https://github.com/rebeloper/ColorSchemeKit.git
```
### ✊ Manual Installation
Download and include the `ColorSchemeKit` folder and files in your codebase.

### 📲 Requirements
- iOS 14+
- Swift 5.3+

## 👉 Import

Import `ColorSchemeKit` into your `View`

```
import ColorSchemeKit
```

## 🧳 Features

Here's the list of the awesome features `ColorSchemeKit` has:
- [X] force `Color Scheme` (light/dark) for your app
- [X] toggle between `light` and `dark` Color Scheme
- [X] set back `system` Color Scheme

## ⚙️ Setup

You want to set up `ColorSchemeKit` only `once` and on the `parent view` of your app. Simply add the `.usesColorSchemeKit()` view modifier to your parent view. **This needs to be done only once!**

```
import SwiftUI
import ColorSchemeKit

@main
struct ColorSchemeKitDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().usesColorSchemeKit()
        }
    }
}
```

## 🥇 Root View

Whewnever you create a Root View make sure that you use the `.colorSchemedRootView()` on it. You don't have to use this view modifier on any of the views children nor the navigation stack's other views.

```
import SwiftUI
import ColorSchemeKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            ...
        }
        .colorSchemedRootView()
    }
}
```

However, if you do create a new view outside of this navigation stack, you have to use `.colorSchemedRootView()` on that root view also. Example of this are a `.sheet` or seperate views in a `TabView`.

```
struct ContentView: View {
    
    @State var isSheetViewPresented = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                Button(action: {
                    isSheetViewPresented.toggle()
                }, label: {
                    Text("Present Sheet")
                })
                .sheet(isPresented: $isSheetViewPresented, content: {
                    SheetView()
                })
                
                Spacer()
            }
            .navigationBarTitle("ColorSchemeKit")
        }
        .colorSchemedRootView()
    }
}

struct SheetView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
                Spacer()
            }
            .navigationBarTitle("Sheet")
        }
        .colorSchemedRootView()
    }
}
```

## 🌝🌚 Changing the Color Scheme

Create a `ColorSchemeManager` `@EnvironmentObject` and  use the `switchTo(_)` call on the it to switch between color schemes. `.system` will switch back to the device's chosen coloe scheme.

```
struct ContentView: View {
    
    @EnvironmentObject private var colorSchemeManager: ColorSchemeManager
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                
                Button(action: {
                    colorSchemeManager.switchTo(.system)
                }, label: {
                    Text("System")
                })
                
                Button(action: {
                    colorSchemeManager.switchTo(.light)
                }, label: {
                    Text("Light")
                })
                
                Button(action: {
                    colorSchemeManager.switchTo(.dark)
                }, label: {
                    Text("Dark")
                })
                
                Spacer()
            }
            .navigationBarTitle("ColorSchemeKit")
        }
        .colorSchemedRootView()
    }
}
```

You may use `.switchTo(_)` from within any view (not just the root view).

## ♻️ Toggle Color Schemes

You can also toggle between the color schemes.

```
struct ContentView: View {
    
    @EnvironmentObject private var colorSchemeManager: ColorSchemeManager
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                
                Button(action: {
                    colorSchemeManager.toggle()
                }, label: {
                    Text("Toggle")
                })
                
                Spacer()
            }
            .navigationBarTitle("ColorSchemeKit")
        }
        .colorSchemedRootView()
    }
}
```

You may use `.toggle()` from within any view (not just the root view).

## 🪁 Demo project

For a comprehensive Demo project check out: 
<a href="https://github.com/rebeloper/ColorSchemeKitDemo">ColorSchemeKitDemo</a>

## ✍️ Contact

<a href="https://rebeloper.com/">rebeloper.com</a> / 
<a href="https://www.youtube.com/rebeloper/">YouTube</a> / 
<a href="https://store.rebeloper.com/">Shop</a> / 
<a href="https://rebeloper.com/mentoring">Mentoring</a>

## 📃 License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
