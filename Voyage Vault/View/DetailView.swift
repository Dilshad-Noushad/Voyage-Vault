//
//  DetailView.swift
//  Voyage Vault
//
//  Created by Dilshad N on 20/01/23.
//

import SwiftUI

struct DetailView: View {
    
    @State private var selectedTab = "Overview"
    @Namespace var animation
    @Binding var destinationDetail: DestinationModel
    @EnvironmentObject var vm: AppVM
    var tabs = ["Overview", "Reviews"]
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .leading) {
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                        Image(destinationDetail.destImage)
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 1.8)
                            .cornerRadius(30)
                        
                        Image(systemName: "chevron.left")
                            .frame(width: 40, height: 40)
                            .background(RoundedRectangle(cornerRadius: 20)
                                .fill(.thinMaterial)
                                .shadow(color: .blackColor,radius: 5, x: 2, y: 2))
                            .padding(.leading, 15)
                            .padding(.top, 45)
                            .onTapGesture {
                                print("back tapped=========>")
                                self.vm.showDetailPage = false
                            }
                    }
                    
                        
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 15) {
                            ForEach(tabs, id: \.self) { tab in
                                Button {
                                    withAnimation {
                                        selectedTab = tab
                                    }
                                    
                                } label: {
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(tab)
                                            .foregroundColor(.blackColor)
                                            .font(txtStyle(tab: tab))
                                            .matchedGeometryEffect(id: tab, in: animation, isSource: true)
                                        
                                        //                                    if selectedTab == tab {
                                        //                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        //                                            .fill(Color.greenColor)
                                        //                                            .frame(width: 50, height: 2)
                                        //                                            .matchedGeometryEffect(id: tab, in: animation)
                                        //                                    }
                                    }
                                }
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color.greenColor)
                                    .frame(height: 2)
                                    .matchedGeometryEffect(id: selectedTab, in: animation, isSource: false)
                            }
                        }
                        
                        OverView(destinationDetail: destinationDetail)
                        
                        Text("Description")
                            .font(.custom(.medium, size: 16))
                            .foregroundColor(.blackColor)
                            .padding(.vertical, 8)
                        
                        Text(destinationDetail.description)
                            .font(.custom(.regular, size: 15))
                            .foregroundColor(.blackColor)
                            .padding(.bottom, 20)
                        
                        customButton(title: "Book Now") {
                            print("Book Now!")
                        }
                        .padding(.top)
                        
                    }
                    .padding(.leading)
                    Spacer()
                }
            }
        }
        .ignoresSafeArea()
    }
    //MARK: - text style
    
    /// function that responsible for text style
    /// - Parameter tab: selected tab
    /// - Returns: Font style
    func txtStyle(tab: String) -> Font {
        if selectedTab == tab {
            return Font.custom(.bold, size: 18)
        }
        return Font.custom(.regular, size: 18)
    }
    //    func txtColor(tab: String) -> Color {
    //        if selectedTab == tab {
    //            return Color.greenColor
    //        }
    //        return Color.blackColor
    //    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(destinationDetail: .constant(destinationData[0]))
    }
}
struct OverView: View {
    var destinationDetail: DestinationModel
    var body: some View {
        HStack(spacing: 50) {
            
            durationView
            ratingView
            
        }
        
    }
    
    var durationView: some View {
        HStack {
            Image(systemName: "clock.fill")
                .foregroundColor(.greenColor)
                .frame(width: 50, height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(color: .blackColor.opacity(0.1), radius: 6)
                }
            
            
            VStack(alignment: .leading) {
                Text("Duration")
                    .font(.custom(.regular, size: 14))
                    .foregroundColor(Color.blackColor)
                
                Text("\(destinationDetail.duration, specifier: "%.2f")")
                    .font(.custom(.bold, size: 14))
                    .foregroundColor(Color.blackColor)
            }
        }
    }
    
    var ratingView: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.greenColor)
                .frame(width: 50, height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(color: .blackColor.opacity(0.1), radius: 6)
                }
            
            
            VStack(alignment: .leading) {
                Text("Rating")
                    .font(.custom(.regular, size: 14))
                    .foregroundColor(Color.blackColor)
                
                Text("\(destinationDetail.rating, specifier: "%.1f") out of 5")
                    .font(.custom(.bold, size: 14))
                    .foregroundColor(Color.blackColor)
            }
        }
    }
}
