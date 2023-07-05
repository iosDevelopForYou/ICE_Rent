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


    private var stadiumImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupCell(indexPath: IndexPath) {
        indexPathCell = indexPath
        stadiumImageView.image = model[indexPath.row].tableImage
        
    }
    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         
         addviewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addviewLayout() {
        contentView.addSubview(stadiumImageView)
        
        NSLayoutConstraint.activate([
        
            stadiumImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            stadiumImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            stadiumImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            stadiumImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
            
        ])
    }
    
}
