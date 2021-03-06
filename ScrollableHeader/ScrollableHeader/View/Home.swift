//
//  Home.swift
//  ScrollableHeader
//
//  Created by Osman Esad on 30.10.2021.
//

import SwiftUI

struct Home: View {
    
    @State var currentTab = ""
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        VStack(spacing: 0){
            
            HStack(spacing: 15){
                
                Button{
                    
                } label: {
                    
                    Image(systemName: "arrow.left")
                        .font(.title2)
                }
                
                Text("ODMAN - Kitap Müzik Elektronik")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button{
                    
                } label: {
                    
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                }
                
            }
            .foregroundColor(.primary)
            .padding(.horizontal)
            
            
            ScrollViewReader{proxy in
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 30){
                        
                        ForEach(tabsItems){tab in
                            
                            VStack{
                                Text(tab.tab)
                                    .foregroundColor(currentTab.replacingOccurrences(of: " SCROLL", with: "") == tab.id ? .black : .gray)
                               
                                if currentTab.replacingOccurrences(of: " SCROLL", with: "") == tab.id {
                                    Capsule().fill(.black)
                                        .matchedGeometryEffect(id: "TAB", in: animation)
                                        .frame(height: 3)
                                        .padding(.horizontal, -10)
                                    
                                } else {
                                    Capsule().fill(.clear)
                                        .frame(height: 3)
                                        .padding(.horizontal, -10)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.easeInOut){
                                    currentTab = "\(tab.id) TAP"
                                    proxy.scrollTo(currentTab.replacingOccurrences(of: " TAP", with: ""), anchor: .topTrailing)
                                }
                            }
                            
                            
                        }
                        .onChange(of: currentTab) {_ in
                            
                            if currentTab.contains(" SCROLL"){
                                
                                
                                withAnimation(.easeInOut) {
                                    proxy.scrollTo(currentTab.replacingOccurrences(of: " SCROLL", with: ""), anchor: .topTrailing)
                                }
                                
                               
                            }
                            
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    
                }
                .padding(.top)
                
                
            }
            .padding([.top])
            .background(scheme == .dark ? Color.black : Color.white)
            .overlay(Divider()
                        .padding(.horizontal, -15)
                     ,alignment: .bottom
            
            )
            
            ScrollView(.vertical, showsIndicators: false){
                
                ScrollViewReader{proxy in
                    
                    VStack(spacing: 15){
                        ForEach(tabsItems){tab in
                            
                            MenuCardView(tab: tab, currentTab: $currentTab)
                                .padding(.top)
                            
                            
                        }
                    }
                    .padding([.horizontal,.bottom])
                    .onChange(of: currentTab){ newValue in
                        
                        if currentTab.contains(" TAP"){
                            
                            withAnimation(.easeInOut){
                                proxy.scrollTo(currentTab.replacingOccurrences(of: " TAP", with: ""), anchor: .topTrailing)
                            }
                            
                        }
                        
                        
                        
                        
                    }
                    
                }
                
            }
            
            .coordinateSpace(name: "SCROLL")
            
            
        }
        .onAppear{
            currentTab = tabsItems.first?.id ?? ""
            
        }
        
    }
    
    
    
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct MenuCardView: View{
    
    
    var tab: Tab
    @Binding var currentTab: String
    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 20){
           
            Text(tab.tab)
                .font(.title.bold())
                .padding(.vertical)
            ForEach(tab.urunler){urun in
                
                HStack(spacing: 15){
                    VStack(alignment: .leading, spacing: 10){
                        
                        Text(urun.title)
                            .font(.title3.bold())
                        Text(urun.description)
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Fiyat: \(urun.price)")
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(urun.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 75)
                        .cornerRadius(10)
                    
                }
                
                Divider()
                
            }
            
        }
        .modifier(OffsetModifier(tab: tab, currentTab: $currentTab))
        .id(tab.id)
    }
}
