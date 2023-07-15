//
//  DemoView.swift
//  Voyage Vault
//
//  Created by Dilshad N on 18/01/23.
//

import SwiftUI

struct LaunchView: View {
 //   @ObservedObject var vm = AppVM()
    @EnvironmentObject var vm: AppVM
    
    let width: CGFloat = 30
    let height: CGFloat = 10
    var body: some View {
        ZStack {
            Image("solo7")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 30) {
                    dotView
                        .padding(.leading, 10)
                    titleView
                        .padding(.leading, 10)
                }
                Spacer()
                customButton(title: "Get Started") {
                    self.vm.navToHome = true
                    print("Getting started...!")
                    
                    
                }
                .padding(.vertical)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .environmentObject(vm)
    }
    
    var dotView: some View {
        HStack(spacing: 5){
            Circle()
                .fill(
                    LinearGradient(colors: [Color.greenColor.opacity(0.6), Color.greenColor], startPoint: .leading, endPoint: .trailing))
                .frame(width: 10, height: 10)
            
            Circle()
                .fill(
                    LinearGradient(colors: [Color.greenColor.opacity(0.6), Color.greenColor], startPoint: .leading, endPoint: .trailing))
                .frame(width: 10, height: 10)
            
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(
                    LinearGradient(colors: [Color.greenColor.opacity(0.6), Color.greenColor], startPoint: .leading, endPoint: .trailing))
                .frame(width: width, height: height)
            
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(
                    LinearGradient(colors: [Color.greenColor.opacity(0.6), Color.greenColor], startPoint: .leading, endPoint: .trailing))
                .frame(width: width + 20, height: height)
        }
    }
    
    var titleView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Its's a Big World")
                .font(.custom(.medium, size: 18))
            
            Text("Out There, \nGo Explore")
                .font(.custom(.bold, size: 32))
        }
        .foregroundColor(.blackColor)
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
    //    LaunchView(width: 30, height: 10)
        LaunchView()
           
    }
}
