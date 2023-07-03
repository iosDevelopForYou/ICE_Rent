//
//  ViewController.swift
//  ICE Rent
//
//  Created by Marat Guseynov on 03.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let mainBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "mainBackground")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let titleBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0.6
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor // Цвет тени
        view.layer.shadowOpacity = 1 // Прозрачность тени (от 0 до 1)
        view.layer.shadowOffset = CGSize(width: 10, height: 10) // Смещение тени
        view.layer.shadowRadius = 5 // Радиус размытия тени
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ICE Rent"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "cервис бронирования льда"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    func addViewLayout() {
        view.addSubview(titleBackView)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        
        NSLayoutConstraint.activate([
            titleBackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleBackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleBackView.heightAnchor.constraint(equalToConstant: 78),
            titleBackView.widthAnchor.constraint(equalToConstant: 258),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainBackground)
        self.view.sendSubviewToBack(mainBackground)
        
        addViewLayout()
        
    }
}

