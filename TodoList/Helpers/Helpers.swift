import SwiftUI

extension View {
    func customNavigationBarStyle() -> some View {
        modifier(CustomNavigationBarStyle())
    }
}

struct CustomNavigationBarStyle : ViewModifier {
    func body(content: Content) -> some View {
#if canImport(UIKit)
        content.navigationBarTitleDisplayMode(.inline)
#else
        content
#endif
    }
}
