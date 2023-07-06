//
//  TableViewCell.swift
//  ICE Rent
//
//  Created by Marat Guseynov on 05.07.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    lazy var indexPathCell = IndexPath()
    var model = Model.makeModel()
    
    //MARK: - BAckground of cell

    private var cellBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.alpha = 0.6
        view.layer.shadowColor = UIColor.black.cgColor // Цвет тени
        view.layer.shadowOpacity = 1 // Прозрачность тени (от 0 до 1)
        view.layer.shadowOffset = CGSize(width: 2, height: 3) // Смещение тени
        view.layer.shadowRadius = 4 // Радиус размытия тени
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        return view
    }()
    
    //MARK: - Object foto
    
    private var stadiumImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    //MARK: - Header label
    
    private var objectNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    //MARK: -  Description in cell
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupCell(indexPath: IndexPath) {
        indexPathCell = indexPath
        stadiumImageView.image = model[indexPath.row].cellObjectImage
        objectNameLabel.text = model[indexPath.row].cellObjectName
        descriptionLabel.text = model[indexPath.row].cellDescription
    }
    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         backgroundColor = .clear
         addviewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addviewLayout() {
        contentView.addSubview(cellBackgroundView)
        contentView.addSubview(stadiumImageView)
        contentView.addSubview(objectNameLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
        
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            stadiumImageView.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 0),
            stadiumImageView.heightAnchor.constraint(equalToConstant: 200),
            stadiumImageView.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 0),
            stadiumImageView.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -0),
            
            objectNameLabel.topAnchor.constraint(equalTo: stadiumImageView.bottomAnchor, constant: 10),
            objectNameLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 10),
            
            descriptionLabel.topAnchor.constraint(equalTo: objectNameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 25),
            
        ])
    }
    
}
