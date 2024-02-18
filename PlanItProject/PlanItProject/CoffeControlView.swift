//
//  CoffeControlView.swift
//  PlanItProject
//
//  Created by MacBook on 18.02.24.
//

import UIKit
import SnapKit

class CoffeControlView: UIView {
    
    lazy var headerCoffeLabel: UILabel = {
        var headerLabel = UILabel()
        headerLabel.backgroundColor = UIColor(red: 40/255, green: 49/255, blue: 59/255, alpha: 1)
    
        self.addSubview(headerLabel)
    
        return headerLabel
    }()
    
    lazy var moveBackButton: UIButton = {
        var moveBackButton = UIButton()
        moveBackButton.setImage(UIImage(named: "Group"), for: .normal)
    
        self.addSubview(moveBackButton)
    
        return moveBackButton
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
    }
}
