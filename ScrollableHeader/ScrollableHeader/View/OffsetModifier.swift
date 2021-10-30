//
//  OffsetModifier.swift
//  ScrollableHeader
//
//  Created by Osman Esad on 31.10.2021.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    
    var tab: Tab
    @Binding var currentTab: String
    
    func body(content: Content) -> some View {
        content
            .overlay(
            
                GeometryReader{proxy in
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("SCROLL")))
                }
                
            )
            .onPreferenceChange(OffsetKey.self) { proxy in

                let offset = proxy.minY
                
                
                withAnimation(.easeInOut) {
                    currentTab = (offset < 20 && -offset < (proxy.midX  / 2) && currentTab != tab.id) ? "\(tab.id) SCROLL": currentTab
                    
                }
                
                
            }
    }
}

struct OffsetModifier_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OffsetKey: PreferenceKey{
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
