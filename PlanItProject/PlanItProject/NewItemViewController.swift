//
//  NewItemViewController.swift
//  PlanItProject
//
//  Created by MacBook on 6.02.24.
//

import SnapKit
import UIKit

class NewItemViewController: UIViewController {
    
//    var newItem = Item()
    weak var delegate: NewItemDelegate?
    
    lazy var headerLabel: UILabel = {
        var headerLabel = UILabel()
        headerLabel.backgroundColor = UIColor(red: 40/255, green: 49/255, blue: 59/255, alpha: 1)
        
        view.addSubview(headerLabel)
        
        return headerLabel
    }()
    
    lazy var nameTextfield: UITextField = {
        var nameTextfield = UITextField()
        nameTextfield.placeholder = "Name.."
        nameTextfield.backgroundColor = UIColor(red: 51/255, green: 62/255, blue: 73/255, alpha: 1)
        let placeholder = nameTextfield.placeholder
        nameTextfield.attributedPlaceholder = NSAttributedString(string: placeholder!,
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        nameTextfield.font = .systemFont(ofSize: 20)
        nameTextfield.textColor = .white
        nameTextfield.textAlignment = .center
        nameTextfield.layer.cornerRadius = 20
        nameTextfield.layer.masksToBounds = false
        nameTextfield.layer.shadowRadius = 1
        nameTextfield.layer.shadowColor = UIColor.black.cgColor
        nameTextfield.layer.shadowOpacity = 1
        nameTextfield.delegate = self
        nameTextfield.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        view.addSubview(nameTextfield)
        
        return nameTextfield
    }()
    
    lazy var descriptionTextView: UITextView = {
        var descriptionTextView = UITextView()

        descriptionTextView.backgroundColor = UIColor(red: 91/255, green: 91/255, blue: 91/255, alpha: 1)
        descriptionTextView.font = .systemFont(ofSize: 20)
        descriptionTextView.layer.cornerRadius = 20
        descriptionTextView.text = "Description.."
        descriptionTextView.textColor = .lightGray
        descriptionTextView.delegate = self
        
        view.addSubview(descriptionTextView)
        
        return descriptionTextView
    }()
    
    lazy var moveBackButton: UIButton = {
        var moveBackButton = UIButton()
        moveBackButton.setImage(UIImage(named: "Group"), for: .normal)
        moveBackButton.addTarget(self, action: #selector(moveBackButtonAction), for: .touchUpInside)
        
        view.addSubview(moveBackButton)
        
        return moveBackButton
    }()
    
    lazy var saveButton: UIButton = {
        var saveButton = UIButton()
        saveButton.setImage(UIImage(named: "Save"), for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        saveButton.isEnabled = false
        
        view.addSubview(saveButton)
        
        return saveButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setupLayout()
        configureNavBar()
    }
    
    func configUI() {
        
        view.backgroundColor = UIColor(red: 51/255, green: 62/255, blue: 73/255, alpha: 1)
    }
    
    func configureNavBar() {
        
    }
    
    @objc func saveButtonAction() {
        
        let newItem = Item()
        newItem.title = nameTextfield.text!
        newItem.descriptionItem = descriptionTextView.text
        
        StorageManager.saveObject(newItem)
                
        delegate?.didAddNewItem(newItem)
        dismiss(animated: true)
    }
    
    @objc func moveBackButtonAction() {
        dismiss(animated: true)
    }
    
    func setupLayout() {
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(45)
        }
        
        moveBackButton.snp.makeConstraints { make in
            make.centerY.equalTo(headerLabel.snp.centerY)
            make.left.equalTo(headerLabel.snp.left).offset(15)
        }
        
        saveButton.snp.makeConstraints { make in
            make.centerY.equalTo(headerLabel.snp.centerY)
            make.right.equalTo(headerLabel.snp.right).offset(-15)
            make.height.equalTo(32)
        }
        
        nameTextfield.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(33)
            make.width.equalTo(145)
        }
        
        descriptionTextView.snp.makeConstraints { make in
            make.top.equalTo(nameTextfield.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
}

extension NewItemViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionTextView.textColor == UIColor.lightGray {
            descriptionTextView.text = nil
            descriptionTextView.textColor = UIColor.white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionTextView.text.isEmpty {
            descriptionTextView.text = "Desciption.."
            descriptionTextView.textColor = .lightGray
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.descriptionTextView.resignFirstResponder()
    }
}

extension NewItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @objc func textFieldChanged() {
        if nameTextfield.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}

protocol NewItemDelegate: NSObject {
    func didAddNewItem(_ item: Item)
}
