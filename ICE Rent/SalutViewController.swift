//
//  SalutViewController.swift
//  ICE Rent
//
//  Created by Marat Guseynov on 05.07.2023.
//

import UIKit

class SalutViewController: UIViewController {
    
    //MARK: - Background foto
    
    let mainBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "mainBackground")
        image.contentMode = .scaleAspectFill
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainBackground)
        self.view.sendSubviewToBack(mainBackground)
    }
}
