//
//  SalutGallery.swift
//  ICE Rent
//
//  Created by Marat Guseynov on 06.07.2023.
//

import Foundation

import UIKit

struct SalutModel {
    let id: Int
    let imageName: String
}

struct SalutGallery {
    static func getImage() -> [SalutModel] {[
        .init(id: 1, imageName: "1"),
        .init(id: 2, imageName: "2"),
        .init(id: 3, imageName: "3"),
        .init(id: 4, imageName: "4"),
        .init(id: 5, imageName: "5"),
        .init(id: 6, imageName: "6"),
        .init(id: 7, imageName: "7"),
        .init(id: 8, imageName: "8"),
        .init(id: 9, imageName: "9"),
        .init(id: 10, imageName: "10"),
        .init(id: 11, imageName: "11"),
        .init(id: 12, imageName: "12"),
        .init(id: 13, imageName: "13")
    ]}
}
