//
//  HomeView.swift
//  Voyage Vault
//
//  Created by Dilshad N on 04/01/23.
//

import SwiftUI

struct HomeView: View {
    var name: String = "Dilshad"
    @State private var searchText = ""
    @State private var isEditing: Bool = false
    
    
    @EnvironmentObject var vm: AppVM
    @State var destinationDetail: DestinationModel =  destinationData[0]
    
    
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.white.ignoresSafeArea(.all)
            if !vm.showDetailPage {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        headerView
                        
                        titleView
                        
                        searchBarView
                        
                        CategoryTitleView(title: "Categories")
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(categoryData, id: \.self) { category in
                                    CategoryCardView(category: category)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        }
                        
                        CategoryTitleView(title: "Top Destinations")
                        
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(destinationData, id: \.self) { destination in
                                        DestinationCardView(destination: destination)
                                            .onTapGesture {
                                                print("ontapped..........==========>")
                                                withAnimation(.easeIn) {
                                                    destinationDetail = destination
                                                    vm.showDetailPage = true
                                                }
                                                
                                            }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                            }
                    }
                }
            } else {
                    DetailView(destinationDetail: $destinationDetail)
                        .environmentObject(vm)
            }
        }
//        .overlay {
//            if vm.showDetailPage {
//                DetailView(destinationDetail: $destinationDetail)
//                    .environmentObject(vm)
//            }
//        }
       
    }
    
    
    
    //MARK: - headerView
    var headerView: some View {
        HStack(spacing: 8) {
            Image("User1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            Text("Hi, ")
                .font(.custom(.medium, size: 18))
                .foregroundColor(Color.blackColor)
            
            + Text(name)
                .font(.custom(.medium, size: 18))
                .foregroundColor(Color.blackColor)
            
            Spacer()
            
            Button {
                print("Menu Tapped")
            } label: {
                Image("menu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .background(
                        Circle()
                            .fill(.white)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2))
                    .frame(width: 50, height: 50)
            }
        }
        .padding(10)
    }
    
    //MARK: - titleView
    var titleView: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack (alignment: .leading, spacing: 0){
                Text("Explore ")
                    .font(.custom(.regular, size: 28))
                    .foregroundColor(Color.blackColor)
                + Text("Natural")
                    .font(.custom(.regular, size: 28))
                    .foregroundColor(Color.greenColor)
                
                Text("Beauty of the Earth.")
                    .font(.custom(.bold, size: 28))
                    .foregroundColor(Color.blackColor)
            }
            
            HStack {
                Image("location")
                    .aspectRatio(contentMode: .fit)
                Text("Alleppey, Kerala, India")
                    .foregroundColor(.blackColor)
                    .font(.custom(.light, size: 14))
            }
        }
        .padding(.horizontal, 10)
    }
    
    //MARK: - searchBarView
    var searchBarView: some View {
        HStack(spacing: 20) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.blackColor)
                TextField("Search here...", text: $searchText)
                    .overlay {
                        HStack {
                            Spacer()
                            if isEditing {
                                Button {
                                    searchText = ""
                                } label: {
                                    Image(systemName: "multiply.circle")
                                        .foregroundColor(.blackColor)
                                }
                                
                            }
                        }
                    }
                    .onTapGesture {
                        isEditing = true
                    }
                
                //                                        if isEditing {
                //                                            Button(action: {
                //                                                self.isEditing = false
                //                                                self.searchText = ""
                //
                //                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                //                                            }){
                //                                                Text("Cancel")
                //                                            }
                //                                            .padding(.trailing, 10)
                //                                            .transition(.move(edge: .trailing))
                //                                            .animation(.default)
                //
                //
                //
                //                                        }
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.blackColor.opacity(0.2), radius: 5, x: 0, y: 0)
            
            Button {
                print("Voice search...")
            } label: {
                Image("mic")
                    .padding(19)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.blackColor.opacity(0.2), radius: 5, x: 0, y: 0)
                
                
            }
            
        }
        .padding(.horizontal)
    }
    
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

//MARK: - categoryTitle View
struct CategoryTitleView: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.custom(.semiBold, size: 18))
                .foregroundColor(Color.blackColor)
              //  .padding()
            Spacer()
            Button {
                print("View all Tapped")
            } label: {
                Text("View all")
                    .font(.custom(.light, size: 12))
                    .foregroundColor(.blackColor)
                    .padding(2)
                    .padding(.horizontal, 5)
                    .background(Color.greenColor.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.trailing)
            }
        }
        .padding(.leading)
        .padding(.top)
    }
}

@ViewBuilder
func customButton(title: String,action: @escaping () -> Void) -> some View {
    Button {
        action()
    } label: {
        HStack {
            Text(title)
                .font(.custom(.semiBold, size: 18))
            Image(systemName: "arrow.right")
            
        }
        .foregroundColor(Color.white)
       // .frame(maxWidth: .infinity, maxHeight: 60)
        .frame(width: UIScreen.main.bounds.width - 30, height: 50)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.greenColor))
       // .padding(.horizontal, 20)
        
    }
}
