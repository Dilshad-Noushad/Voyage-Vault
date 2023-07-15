//
//  SwiftUIView.swift
//  Voyage Vault
//
//  Created by Dilshad N on 14/01/23.
//

import SwiftUI

//MARK: - Enum
enum Tab: String {
    case home
    case explore
    case star
    case user
}
//MARK: - Model
struct TabData: Identifiable, Equatable {
    var id = UUID()
    var image: String
    var selectedImage: String
    var tab: Tab
}
//MARK: - Tab data
var data: [TabData] = [
    TabData(image: "homeW", selectedImage: "homeG", tab: .home),
    TabData(image: "exploreW", selectedImage: "exploreG", tab: .explore),
    TabData(image: "starW", selectedImage: "starG", tab: .star),
    TabData(image: "userW", selectedImage: "userG", tab: .user)
]

//MARK: - TabBarView
struct TabBarView: View {
//    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(data) { tab in
                
                TabButton(data: tab, selectedTab: $selectedTab)
                
                if tab != data.last {
                    Spacer(minLength: 0)
                }
            }
            
        }
        .padding(.horizontal, 15)
        .background(Color.greenColor.cornerRadius(12))
        .frame(width: UIScreen.main.bounds.width - 32)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .constant(.user))
    }
}
//MARK: - Tab Button
struct TabButton: View {
    var data: TabData
    @Binding var selectedTab: Tab
    var body: some View {
        Button {
            withAnimation(.easeIn) {
                selectedTab = data.tab
            }
        } label: {
            Image(selectedTab == data.tab ? data.selectedImage : data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(selectedTab.rawValue == data.tab.rawValue ? Color.bgWhite : .clear)
                        .padding(5)
                )
            
                .frame(width: 60, height: 60)
            
        }
        
    }
}
