//
//  CategoryCardView.swift
//  Voyage Vault
//
//  Created by Dilshad N on 16/01/23.
//

import SwiftUI

struct CategoryCardView: View {
    var category: CategoryModel
    var body: some View {
        HStack(spacing: 15) {
            Image(category.catImage)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
                .lineLimit(1)
    
            Text(category.catName)
                .font(.custom(.medium, size: 18))
                
        }
        .padding(5)
        .padding(.trailing)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.blackColor.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(category: CategoryModel(catName: "Hills", catImage: "img1"))
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
        
    }
}
