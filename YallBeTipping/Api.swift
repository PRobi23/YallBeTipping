//
//  Api.swift
//  YallBeTipping
//
//  Created by Robert Papp on 2025. 02. 28..
//

import Foundation

class Api {
    static let shared = Api()
    private init() {}
    
    func fetchData() -> [MenuItem] {
        return [
            MenuItem(name: "burger", price: 12.5, img: "warning"),
            MenuItem(name: "Chow mein", price: 13.7, img: "notification"),
            MenuItem(name: "Dumplings", price: 7, img: "chair"),
            MenuItem(name: "Fried chicken", price: 6, img: "carpet"),
            MenuItem(name: "Pizza", price: 13.5, img: "chair")
        ]
    }
}
