//
//  File.swift
//  ICE Rent
//
//  Created by Marat Guseynov on 05.07.2023.
//

import Foundation
import UIKit

struct Model {
    var cellObjectImage: UIImage
    var cellObjectName: String
    var cellDescription: String
    
    static func makeModel() -> [Model] {[
        Model(cellObjectImage: UIImage(named: "salut")!, cellObjectName: "Ледовая Арена - САЛЮТ", cellDescription: "- хоккей\n- фигурное катание\n- массовые катания\n- прокат коньков"),
        Model(cellObjectImage: UIImage(named: "kristall")!, cellObjectName: "Ледовая Арена - КРИСТАЛЛ", cellDescription: "- хоккей\n- фигурное катание\n- массовые катания\n- прокат коньков"),
        Model(cellObjectImage: UIImage(named: "mayak")!, cellObjectName: "Ледовая Арена - МАЯК", cellDescription: "- хоккей\n- фигурное катание\n- массовые катания\n- прокат коньков"),
        Model(cellObjectImage: UIImage(named: "orbita")!, cellObjectName: "Ледовая Арена - ОРБИТА", cellDescription: "- хоккей\n- фигурное катание\n- массовые катания\n- прокат коньков"),
        Model(cellObjectImage: UIImage(named: "ledoviy")!, cellObjectName: "Ледовая Арена - ЛЕДОВЫЙ", cellDescription: "- хоккей\n- фигурное катание\n- массовые катания\n- прокат коньков"),
        Model(cellObjectImage: UIImage(named: "ippodrom")!, cellObjectName: "Ледовая Арена - ИППОДРОМ", cellDescription: "- хоккей\n- фигурное катание\n- массовые катания\n- прокат коньков")
    ]}
}
