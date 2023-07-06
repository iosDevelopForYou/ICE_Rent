//
//  ViewController.swift
//  ICE Rent
//
//  Created by Marat Guseynov on 03.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private var model = Model.makeModel()
    private var salutVC = SalutViewController()
    
    //MARK: - Background foto
    
    let mainBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "mainBackground")
        image.contentMode = .scaleAspectFill
        return image
    }()
    //MARK: - Header title
    
    let titleBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.alpha = 0.5
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
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.sizeToFit()
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "cервис бронирования льда"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    //MARK: -  TableView
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    //MARK: - Layout
    func addViewLayout() {
        view.addSubview(titleBackView)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            titleBackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleBackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleBackView.heightAnchor.constraint(equalToConstant: 78),
            titleBackView.widthAnchor.constraint(equalToConstant: 258),
            
            titleLabel.topAnchor.constraint(equalTo: titleBackView.topAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: titleBackView.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainBackground)
        self.view.sendSubviewToBack(mainBackground)
        
        addViewLayout()
    }
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.setupCell(indexPath: indexPath)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(salutVC, animated: true)
    }
}
