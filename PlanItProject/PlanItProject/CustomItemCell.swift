//
//  CustomItemCell.swift
//  PlanItProject
//
//  Created by MacBook on 2.02.24.
//

import UIKit
import SnapKit


class CustomItemCell: UICollectionViewCell {
    
    // Меняем режим отображения по клику
    override var isSelected: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor(red: 40/255, green: 49/255, blue: 58/255, alpha: 1)
        stackView.spacing = 12
        
        contentView.addSubview(stackView)
        
        return stackView
    }()
    
    lazy var topContainer: UIView = {
        var topContainer = UIView()
        topContainer.backgroundColor = UIColor(red: 51/255, green: 62/255, blue: 73/255, alpha: 1)
        topContainer.layer.cornerRadius = 10
        
        stackView.addArrangedSubview(topContainer)
        
        return topContainer
    }()
    
    lazy var bottomContainer: UIView = {
        var bottomContainer = UIView()
        bottomContainer.backgroundColor = UIColor(red: 51/255, green: 62/255, blue: 73/255, alpha: 1)
        bottomContainer.layer.cornerRadius = 10
        
        stackView.addArrangedSubview(bottomContainer)
        
        return bottomContainer
    }()
    
    lazy var checkButton: UIButton = {
        var checkButton = UIButton()
        checkButton.setImage(UIImage(named: "checked-data 1"), for: .normal)
        checkButton.backgroundColor = UIColor(red: 40/255, green: 49/255, blue: 58/255, alpha: 1)
        checkButton.addTarget(self, action: #selector(checkButtonAction), for: .touchUpInside)
        
        topContainer.addSubview(checkButton)
        
        return checkButton
    }()
    
    lazy var editButton: UIButton = {
        var editButton = UIButton()
        editButton.setImage(UIImage(named: "edit"), for: .normal)
        
        topContainer.addSubview(editButton)
        
        return editButton
    }()
    
    lazy var nameLabel: UILabel = {
        var nameLabel = UILabel()
        nameLabel.text = "Test"
        nameLabel.font = UIFont(name: "Montserrat", size: 12)
        nameLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        topContainer.addSubview(nameLabel)
        
        return nameLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        var descriptionLabel = UILabel()
        descriptionLabel.font = UIFont(name: "Montserrat", size: 12)
        descriptionLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.isHidden = true
        
        bottomContainer.addSubview(descriptionLabel)
        
        return descriptionLabel
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
        
    func updateAppearance() {
    //Выключаем констрейнты если ячейка не выбрана
        
        UIView.animate(withDuration: 0.3) {
            if self.isSelected {
                UIView.animate(withDuration: 0.3) {
                    self.descriptionLabel.isHidden = false
                    self.layoutIfNeeded()
                }
            } else {
                self.bottomContainer.snp.removeConstraints()
                self.descriptionLabel.isHidden = true
                self.layoutIfNeeded()
            }
        }
    }
    
    @objc func checkButtonAction(_ sender: UIButton) {
        
            if !sender.isSelected {
                // Если кнопка нажата, показываем изображение с галочкой
                sender.setImage(UIImage(named: "Checked"), for: .normal )
                sender.isSelected = !sender.isSelected
            } else {
                // Если кнопка не нажата, показываем изображение без галочки
                sender.isSelected = !sender.isSelected
                sender.setImage(UIImage(named: "Unchecked"), for: .normal)
                
            }
    }
    
    func configureStackView() {
        
    }

    func setupLayout() {
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        topContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.snp_topMargin).offset(45)
        }
        
        bottomContainer.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(155)
        }
        
        checkButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
            make.left.equalToSuperview().offset(7)
        }
        
        editButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(29)
            make.right.equalToSuperview().offset(-10)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(checkButton.snp.right).offset(10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.top.equalToSuperview().inset(5)
            make.right.equalToSuperview().offset(-5)
        }
    }
}
