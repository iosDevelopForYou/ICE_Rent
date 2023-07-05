//
//  File.swift
//  ICE Rent
//
//  Created by Marat Guseynov on 05.07.2023.
//

import Foundation
import UIKit

struct Model {
    var tableImage: UIImage
    
    static func makeModel() -> [Model] {[
        Model(tableImage: UIImage(named: "salut")!),
        Model(tableImage: UIImage(named: "kristall")!),
        Model(tableImage: UIImage(named: "mayak")!),
        Model(tableImage: UIImage(named: "orbita")!),
        Model(tableImage: UIImage(named: "ledoviy")!),
        Model(tableImage: UIImage(named: "ippodrom")!)
    ]}
}
