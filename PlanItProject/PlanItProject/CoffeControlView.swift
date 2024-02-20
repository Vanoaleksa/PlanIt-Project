//
//  CoffeControlView.swift
//  PlanItProject
//
//  Created by MacBook on 18.02.24.
//

import UIKit
import SnapKit

class CoffeControlView: UIView {
    
    var cupsImages = [UIImage]()
    
    lazy var headerCoffeLabel: UILabel = {
        var headerLabel = UILabel()
        headerLabel.backgroundColor = UIColor(red: 40/255, green: 49/255, blue: 59/255, alpha: 1)
        headerLabel.text = "Coffe control"
        headerLabel.font = .systemFont(ofSize: 25)
        headerLabel.textColor = UIColor(red: 153/255, green: 199/255, blue: 121/255, alpha: 1)
        headerLabel.textAlignment = .center
    
        self.addSubview(headerLabel)
    
        return headerLabel
    }()
    
    lazy var moveBackButton: UIButton = {
        var moveBackButton = UIButton()
        moveBackButton.setImage(UIImage(named: "Group"), for: .normal)
    
        self.addSubview(moveBackButton)
    
        return moveBackButton
    }()
    
    lazy var mainCupsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.backgroundColor = UIColor(red: 51/255, green: 62/255, blue: 73/255, alpha: 1)
        
        self.addSubview(stackView)
        
        return stackView
    }()
    
    lazy var topCupsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        mainCupsStackView.addArrangedSubview(stackView)
        
        return stackView
    }()
    
    lazy var bottomCupsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        mainCupsStackView.addArrangedSubview(stackView)

        return stackView
    }()
    
    lazy var controllStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.layer.cornerRadius = 10
        stackView.backgroundColor = UIColor(red: 40/255, green: 49/255, blue: 59/255, alpha: 1)
        
        self.addSubview(stackView)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        self.backgroundColor = UIColor(red: 51/255, green: 62/255, blue: 73/255, alpha: 1)
        
        for i in 0...5 {
            if let image = UIImage(named: "coffee-cup \(i)") {
                var cupImageView = UIImageView(image: image)
                cupImageView.tag = i
                
                topCupsStackView.addArrangedSubview(cupImageView)
                cupsImages.append(image)
            }
        }
        
        for i in 5..<10 {
            if let image = UIImage(named: "coffee-cup \(i)") {
                var cupImageView = UIImageView(image: image)
                cupImageView.tag = i
                
                bottomCupsStackView.addArrangedSubview(cupImageView)
                cupsImages.append(image)
            }
        }
    }
}
extension CoffeControlView {
    func setupConstraints() {
        
        headerCoffeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(45)
        }
        
        moveBackButton.snp.makeConstraints { make in
            make.centerY.equalTo(headerCoffeLabel.snp.centerY)
            make.left.equalTo(headerCoffeLabel.snp.left).offset(15)
        }
        
        mainCupsStackView.snp.makeConstraints { make in
            make.top.equalTo(headerCoffeLabel.snp.bottom).offset(30)
            make.trailing.equalToSuperview().offset(-25)
            make.leading.equalToSuperview().offset(25)
            make.height.equalTo(150)
        }
        
        topCupsStackView.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        bottomCupsStackView.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        controllStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainCupsStackView.snp.bottom).offset(30)
            make.height.equalTo(160)
            make.width.equalTo(210)
        }
        
    }
}
