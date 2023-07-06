//
//  SalutCollectionViewCell.swift
//  ICE Rent
//
//  Created by Marat Guseynov on 06.07.2023.
//

import UIKit

class SalutCollectionViewCell: UICollectionViewCell {
    
    var collectionImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    //MARK: - Cells imahe shadow configure
    
    private func addShadowLayer() {
        let shadowLayer = CALayer()
        shadowLayer.backgroundColor = UIColor.white.cgColor
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.7
        shadowLayer.shadowRadius = 3
        shadowLayer.shadowOffset = CGSize(width: 3, height: 3)
        shadowLayer.cornerRadius = 10
        // Установка размеров и позиции слоя тени
        shadowLayer.frame = contentView.bounds.insetBy(dx: 0, dy: 0)
        // Добавление слоя тени как подслоя для ячейки
        layer.insertSublayer(shadowLayer, at: 0) // Обратите внимание на изменение здесь
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        addviewlayout()
        addShadowLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addviewlayout() {
        contentView.addSubview(collectionImage)
        
        NSLayoutConstraint.activate([
            collectionImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    
}
