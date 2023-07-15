//
//  FirstVIew.swift
//  Voyage Vault
//
//  Created by Dilshad N on 24/01/23.
//

import SwiftUI

struct FirstView: View {
    @StateObject var vm: AppVM = AppVM()
    var body: some View {
        ZStack {
            if vm.navToHome {
                ContentView()
                    .environmentObject(vm)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            } else {
                LaunchView()
                    .environmentObject(vm)
                    
            }
        }
        .environmentObject(vm)
    }
}

struct FirstVIew_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
