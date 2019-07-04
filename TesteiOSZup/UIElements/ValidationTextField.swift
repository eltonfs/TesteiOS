//
//  ValidationTextField.swift
//  TesteiOS-Zup
//
//  Created by Elton Santana on 03/07/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit


class ValidationTextField: UIView {
    var textField: UITextField!
    var clearButton: UIButton!
    var bottonView: UIView!
    var titleLabel: UILabel!
    
    var isEditing: Bool = false
    var title: String = "" {
        didSet {
            self.titleLabel.text = self.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupVisualComponents()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupVisualComponents()
        
    }
    fileprivate func setupVisualComponents() {
        self.setClearButton()
        self.setTextField()
        self.setTitleLabel()
        self.setBottonView()
        self.setRelativeConstraints()
        
    }
    
    
    func setBottonView() {
        self.bottonView = UIView(frame: .zero)
        self.bottonView.backgroundColor = ColorPallete.gray.uiColor
        self.addSubview(self.bottonView)
        NSLayoutConstraint(item: self.bottonView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1).isActive = true
    }
        
    func setTitleLabel() {
        self.titleLabel = UILabel(frame: .zero)
        self.titleLabel.textColor = ColorPallete.gray.uiColor
        self.titleLabel.text = self.title
        self.addSubview(self.titleLabel)
        
    }
    
    func setTextField() {
        self.textField = UITextField(frame: .zero)
        self.textField.borderStyle = .none
        self.addSubview(self.textField)
    }
    
    
    func setClearButton() {
        self.clearButton = UIButton(frame: .zero)
        self.clearButton.setImage(nil, for: .normal)
        self.clearButton.alpha = 0
        self.addSubview(self.clearButton)
        if let button = self.clearButton {
            NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10).isActive = true

        }
        
    }
    
    func setRelativeConstraints() {
        //bottom view related with superview
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: self.bottonView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: self.bottonView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: self.bottonView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        
        //clearButton with surround views
        NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: self.clearButton, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: self.clearButton, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.textField as UITextField, attribute: .trailing, relatedBy: .equal, toItem: self.clearButton, attribute: .leading, multiplier: 1, constant: 0).isActive = true


        
    }
}
