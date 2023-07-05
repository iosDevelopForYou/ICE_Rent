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

    private var cellBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.alpha = 0.6
        return view
    }()
    
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
    
    func setupCell(indexPath: IndexPath) {
        indexPathCell = indexPath
        stadiumImageView.image = model[indexPath.row].tableImage
        
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
        
        NSLayoutConstraint.activate([
        
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            stadiumImageView.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 0),
            stadiumImageView.heightAnchor.constraint(equalToConstant: 200),
            stadiumImageView.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 0),
            stadiumImageView.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -0)
            
        ])
    }
    
}
