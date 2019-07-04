//
//  ValidationTextField.swift
//  TesteiOS-Zup
//
//  Created by Elton Santana on 03/07/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

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
        
    }
    
    func setBottonView() {
        self.bottonView = UIView(frame: .zero)
        self.bottonView.backgroundColor = ColorPallete.gray.uiColor
        self.addSubview(self.bottonView)
        
        self.bottonView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.right.bottom.equalTo(self)
        }
    }
    
    func setTitleLabel() {
        self.titleLabel = UILabel(frame: .zero)
        self.titleLabel.textColor = ColorPallete.gray.uiColor
        self.titleLabel.text = self.title
        self.addSubview(self.titleLabel)
        
        self.textField.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self).inset(15)
        }
        
    }
    
    func setTextField() {
        self.textField = UITextField(frame: .zero)
        self.textField.borderStyle = .none
        self.addSubview(self.textField)
        
        self.textField.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.bottonView.snp.top)
            make.left.equalTo(self)
            make.top.equalTo(self.titleLabel.snp.bottom)
        }
        
    }
    
    
    func setClearButton() {
        self.clearButton = UIButton(frame: .zero)
        self.clearButton.setImage(nil, for: .normal)
        self.clearButton.alpha = 0
        self.addSubview(self.clearButton)
        
        self.clearButton.snp.makeConstraints { (make) in
            make.height.equalTo(self.clearButton.snp.height)
            make.height.equalTo(20)
            make.left.equalTo(self.textField)
            make.right.equalTo(self)
            make.centerY.equalTo(self.textField.snp.top)
            
        }
       
    }
  
}
