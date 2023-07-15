//
//  ContentView.swift
//  Voyage Vault
//
//  Created by Dilshad N on 04/01/23.
//

import SwiftUI

struct ContentView: View {
    //    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var vm: AppVM
    @State var selectedTab: Tab = .home
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                       // .environmentObject(vm)
                case .explore:
                    Text("Explore")
                case .star:
                    Text("Star")
                case .user:
                    Text("User")
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            // .safeAreaInset(edge: .top) {
            //     Color.clear.frame(height: 104)
            // }
            VStack {
                Spacer()
                TabBarView(selectedTab: $selectedTab)
                    .padding(.bottom)
                    .ignoresSafeArea(.keyboard)
            }
            //            .environmentObject(vm)
            
        }
       // .environmentObject(vm)
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
