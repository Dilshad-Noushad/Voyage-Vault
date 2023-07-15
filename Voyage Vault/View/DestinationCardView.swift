//
//  DestinationCardView.swift
//  Voyage Vault
//
//  Created by Dilshad N on 17/01/23.
//

import SwiftUI

struct DestinationCardView: View {
    
    @EnvironmentObject var vm: AppVM
    var destination: DestinationModel
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(destination.destImage)
                .resizable()
                .frame(width: 240, height: 120)
                .cornerRadius(10)
                .padding(.horizontal, 2)
            
            HStack(spacing: 0){
                VStack(alignment: .leading, spacing: 3) {
                    Text(destination.destName)
                        .font(.custom(.medium, size: 14))
                        .foregroundColor(.blackColor)
                    HStack(spacing: 2){
                        Image("location")
//                        .resizable()
//                        .frame(width: 20, height: 20)
                        Text(destination.location)
                            .foregroundColor(.blackColor)
                            .font(.custom(.light, size: 12))
                    }
                }
                
                Spacer()
                
                HStack {
                    
                    ZStack {
                        ForEach(Array(destination.userImg.enumerated()), id: \.offset) { index, user in
                            Image(user)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .mask(Circle())
                                .shadow(color: Color.white, radius: 1, x: -2)
                                .offset(x: CGFloat(index * 25))
                            
                        }
                    }
                    Spacer()
                }
                .overlay {
                    ZStack {
                        Circle()
                            .fill(Color.greenColor)
                            .frame(width: 30, height: 30)
                            .shadow(color: Color.white, radius: 1, x: -2)

                        Text("+15")
                            .font(.custom(.light, size: 12))
                            .foregroundColor(.bgWhite)
                    }
                    .offset(x: 35)
                    
                }
                .padding(.leading, 8)
            }
            .padding(.leading, 5)
        }
        .frame(width: 240, height: 160)
        .padding([.horizontal, .vertical], 5)
        .padding(.vertical, 2)
        .padding(.bottom, 2)
        .background (
            Color.white.cornerRadius(10)
                .shadow(color: Color.blackColor.opacity(0.2), radius: 2)
        )
//        .onTapGesture {
//            self.vm.showDetailPage = true
//            //Detail page Tapped
//        }
        
    }
}

struct DestinationCardView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationCardView(destination: destinationData[0])
    }
}
