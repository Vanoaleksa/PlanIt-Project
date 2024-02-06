//
//  ViewController.swift
//  PlanItProject
//
//  Created by MacBook on 31.01.24.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    
    private lazy var headerImageView: UIImageView = {
        let headerImageView = UIImageView()
        headerImageView.image = UIImage(named: "Rectangle 1")
        
        view.addSubview(headerImageView)
        
        return headerImageView
    }()
    
    private lazy var secondHeaderImageView: UIImageView = {
        let secondHeaderImageView = UIImageView()
        secondHeaderImageView.image = UIImage(named: "Exclude")
        secondHeaderImageView.alpha = 0.8
        
        view.addSubview(secondHeaderImageView)
        
        return secondHeaderImageView
    }()
    
    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.text = "Have a nice day!"
        headerLabel.font = UIFont(name: "Montserrat", size: 14)
        headerLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        view.addSubview(headerLabel)
        
        return headerLabel
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView( frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = true
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 40/255, green: 49/255, blue: 58/255, alpha: 1)
        
        
        view.addSubview(collectionView)
        
        return collectionView
    }()
    
    var items = [
        Item(id: 0, title: "Test title", description: "Test desription"),
        Item(id: 1, title: "Test 22", description: "Test 222222"),
        Item(id: 2, title: "Test 33", description: "Test 333333333")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setupLayout()
    }
    
    func configUI() {
        
        self.view.backgroundColor = UIColor(red: 40/255, green: 49/255, blue: 58/255, alpha: 1)

        collectionView.register(CustomItemCell.self, forCellWithReuseIdentifier: "\(CustomItemCell.self)")
    }
    
    func setupLayout() {
        
        headerImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(210)
        }
        
        secondHeaderImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(210)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(headerImageView.snp_bottomMargin)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(210)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CustomItemCell.self)",
                                                      for: indexPath) as! CustomItemCell
        
        let item = items[indexPath.item]
        cell.nameLabel.text = item.title
        cell.descriptionLabel.text = item.description
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isSelected = collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false
        return CGSize(width: collectionView.bounds.width - 20, height: isSelected ? 210 : 45)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionView.performBatchUpdates(nil)
        
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        collectionView.performBatchUpdates(nil)
        
        return true
    }
}

