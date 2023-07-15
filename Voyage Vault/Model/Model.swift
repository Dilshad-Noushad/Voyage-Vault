//
//  CategoryModel.swift
//  Voyage Vault
//
//  Created by Dilshad N on 16/01/23.
//

import Foundation

struct CategoryModel: Identifiable, Hashable {
    var id = UUID()
    var catName: String
    var catImage: String
}

let categoryData : [CategoryModel] = [
    CategoryModel(catName: "Hills", catImage: "img1"),
    CategoryModel(catName: "Islands", catImage: "img10"),
    CategoryModel(catName: "Forest", catImage: "img12"),
    CategoryModel(catName: "Snow", catImage: "img7"),
    CategoryModel(catName: "Deserts", catImage: "img10"),
    CategoryModel(catName: "Valleys", catImage: "img4")
]

struct DestinationModel: Identifiable, Hashable {
    var id = UUID()
    var destImage: String
    var destName: String
    var location: String
    var userImg: [String]
    var ticketRate: Int
    var description: String
    var rating: Float
    var duration: Float
    
}

var destinationData: [DestinationModel] = [
    DestinationModel(destImage: "img4", destName: "Phuket", location: "Thailand Phuket", userImg: ["Person1", "Person2", "Person3"], ticketRate: Int(160.0), description: "Phuket City, on Phuket Island, is the capital of Thailand’s Phuket Province. In the Old Town, Thalang Road is lined with colorful 19th-century shophouses and Sino-Portuguese buildings", rating: 4.5, duration: 2.40),
    DestinationModel(destImage: "img2", destName: "Phuket", location: "Thailand Phuket", userImg: ["Person1", "Person2", "Person3"], ticketRate: Int(160.0), description: "Phuket City, on Phuket Island, is the capital of Thailand’s Phuket Province. In the Old Town, Thalang Road is lined with colorful 19th-century shophouses and Sino-Portuguese buildings", rating: 4.5, duration: 2.0),
    DestinationModel(destImage: "img7", destName: "Phuket", location: "Thailand Phuket", userImg: ["Person1", "Person2", "Person3"], ticketRate: Int(160.0), description: "Phuket City, on Phuket Island, is the capital of Thailand’s Phuket Province. In the Old Town, Thalang Road is lined with colorful 19th-century shophouses and Sino-Portuguese buildings", rating: 4.5, duration: 2.0)
]
//var destinationData: [DestinationModel] = [
//    .init(destImage: "img4", destName: "Phuket", location: "Thailand Phuket", userImg: ["Person1", "Person2", "Person3"], ticketRate: Int(160.0), description: "Phuket City, on Phuket Island, is the capital of Thailand’s Phuket Province. In the Old Town, Thalang Road is lined with colorful 19th-century shophouses and Sino-Portuguese buildings", rating: 4.5, duration: 2.40),
//    .init(destImage: "img2", destName: "Phuket", location: "Thailand Phuket", userImg: ["Person1", "Person2", "Person3"], ticketRate: Int(160.0), description: "Phuket City, on Phuket Island, is the capital of Thailand’s Phuket Province. In the Old Town, Thalang Road is lined with colorful 19th-century shophouses and Sino-Portuguese buildings", rating: 4.5, duration: 2.0),
//    .init(destImage: "img7", destName: "Phuket", location: "Thailand Phuket", userImg: ["Person1", "Person2", "Person3"], ticketRate: Int(160.0), description: "Phuket City, on Phuket Island, is the capital of Thailand’s Phuket Province. In the Old Town, Thalang Road is lined with colorful 19th-century shophouses and Sino-Portuguese buildings", rating: 4.5, duration: 2.0)
//]
