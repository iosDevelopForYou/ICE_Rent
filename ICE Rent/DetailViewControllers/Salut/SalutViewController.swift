//
//  SalutViewController.swift
//  ICE Rent
//
//  Created by Marat Guseynov on 05.07.2023.
//

import UIKit
import AVKit

class SalutViewController: UIViewController {
    
    private var model: [SalutModel] = SalutGallery.getImage()
    private var selectedCell: UICollectionViewCell? = nil
    
    //MARK: - Background foto
    
    let mainBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "mainBackground")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    //MARK: - Photo CollectionVIew configure
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SalutCollectionViewCell.self, forCellWithReuseIdentifier: "SalutCollectionViewCell")
        return collectionView
    }()
    
    //MARK: - Layout
    
    private func addviewLayout() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: 140),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
        ])
    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainBackground)
        self.view.sendSubviewToBack(mainBackground)
        
        addviewLayout()
        
        //MARK: - Large title config
        
        navigationController?.navigationBar.prefersLargeTitles = true // Включение крупного заголовка
        if let navigationBar = navigationController?.navigationBar {
            let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)] // Размер и стиль шрифта
            navigationBar.largeTitleTextAttributes = attributes
        }
        title = "Ледовая Арена - САЛЮТ"
    }
}

extension SalutViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SalutCollectionViewCell", for: indexPath) as! SalutCollectionViewCell
        cell.collectionImage.image = UIImage(named: model[indexPath.item].imageName)
        return cell
    }
}

extension SalutViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 10 }
    private var elementCount: CGFloat { return 3 }
    private var insetsCount: CGFloat { return elementCount + 1 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * insetsCount) / elementCount
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
}

extension SalutViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            self.selectedCell = cell
            showSelectedCell(image: UIImage(named: model[indexPath.item].imageName)!)
        }
    }
}

//MARK: - Image detail view animation config

extension SalutViewController {
    
    private func showSelectedCell(image: UIImage) {
        guard let cell = self.selectedCell else { return }
        
        let subImageView = UIView(frame: UIScreen.main.bounds)
        view.addSubview(subImageView)
        view.bringSubviewToFront(subImageView)
        
        let closeButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "xmark"), for: .normal)
            button.tintColor = .systemBlue
            button.translatesAutoresizingMaskIntoConstraints = false
            button.alpha = 0
            button.addTarget(self, action: #selector(hideSelectedCell), for: .touchUpInside)
            return button
        }()
        subImageView.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        let imageView: UIImageView = {
            let imageView = UIImageView(frame: cell.bounds)
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideSelectedCell)))
            imageView.isUserInteractionEnabled = true
            return imageView
        }()
        subImageView.addSubview(imageView)
        
        let scaleWidth = min(subImageView.bounds.width, subImageView.bounds.height)/cell.bounds.width
        let scaleHeight = min(subImageView.bounds.width, subImageView.bounds.height)/cell.bounds.height
        
        let cellPosition: CGPoint = cell.convert(cell.bounds.origin, to: view)
        imageView.center = CGPoint(x: cellPosition.x + cell.bounds.width/2, y: cellPosition.y + cell.bounds.height/2)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            imageView.transform = CGAffineTransform(scaleX: scaleWidth, y: scaleHeight)
            imageView.center = imageView.centerInContainingWindow()
            subImageView.backgroundColor = .black.withAlphaComponent(0.8)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3) {
                closeButton.alpha = 1.0
                imageView.layer.borderColor = UIColor.systemGray.cgColor
            }
        })
    }
    
    @objc private func hideSelectedCell() {
        
        guard let cell = self.selectedCell,
              let subImageView = view.subviews.first(where: { $0.bounds.size == UIScreen.main.bounds.size }),
              let closeButton = subImageView.subviews.first(where: { $0 is UIButton }),
              let imageView = subImageView.subviews.first(where: { $0 is UIImageView })
        else { return }
        
        let cellPosition: CGPoint = cell.convert(cell.bounds.origin, to: view)
        let cellCenter = CGPoint(x: cellPosition.x + cell.bounds.width/2, y: cellPosition.y + cell.bounds.height/2)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            imageView.transform = CGAffineTransformIdentity
            imageView.center = cellCenter
            subImageView.backgroundColor = .clear
        }, completion: { _ in
            UIView.animate(withDuration: 0.3) {
                closeButton.alpha = 0
            }
            subImageView.removeFromSuperview()
        })
    }
}

extension UIView {
    
    func centerInContainingWindow() -> CGPoint {
        if let window = self.window, let superview = self.superview {
            let windowCenter = CGPoint(x: window.frame.midX, y: window.frame.midY)
            return superview.convert(windowCenter, from: nil)
        } else { return self.center }
    }
}
