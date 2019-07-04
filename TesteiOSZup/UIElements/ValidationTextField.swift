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

class ValidationTextFieldCell: UITableViewCell {
    internal init(textField: UITextField?, clearButton: UIButton?, bottonView: UIView?, titleLabel: UILabel?) {
        self.textField = textField
        self.clearButton = clearButton
        self.bottonView = bottonView
        self.titleLabel = titleLabel
    }
    
    var textField: UITextField!
    var clearButton: UIButton!
    var bottonView: UIView!
    var titleLabel: UILabel!
    
    var isTyping: Bool = false {
        didSet {
            self.animateAccordingToStatus()
        }
    }
    var title: String = "" {
        didSet {
            self.titleLabel.text = self.title
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupVisualComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupVisualComponents()
    }

    fileprivate func setupVisualComponents() {
        self.setTextField()
        self.setTitleLabel()
        self.setBottonView()
        self.setClearButton()
        self.setConstraints()
    }
    
    private func setBottonView() {
        self.bottonView = UIView(frame: .zero)
        self.bottonView.backgroundColor = ColorPallete.gray.uiColor
        self.contentView.addSubview(self.bottonView)
    }
    
    private func setTitleLabel() {
        self.titleLabel = UILabel(frame: .zero)
        self.titleLabel.textColor = ColorPallete.gray.uiColor
        self.titleLabel.text = self.title
        self.titleLabel.font = UIFont(name: "DINPro-Regular", size: 16)
        self.contentView.addSubview(self.titleLabel)
    }
    
    private func setTextField() {
        self.textField = UITextField(frame: .zero)
        self.textField.borderStyle = .none
        self.textField.delegate = self
        self.textField.font = UIFont(name: "DINPro-Medium", size: 18)

        self.contentView.addSubview(self.textField)
    }
    
    
    private func setClearButton() {
        self.clearButton = UIButton(frame: .zero)
        self.clearButton.setImage(UIImage(named:"clear_button_icon"), for: .normal)
        self.clearButton.alpha = 0
        self.clearButton.addTarget(self, action: #selector(self.clearTextField), for: .touchUpInside)
        self.contentView.addSubview(self.clearButton)
  
    }
    
    @objc func clearTextField() {
        self.textField.text = ""
    }
    
    private func setConstraints() {
        
        self.clearButton.snp.makeConstraints { (make) in
            make.height.equalTo(self.clearButton.snp.width)
            make.height.equalTo(20)
            make.left.equalTo(self.textField.snp.right)
            make.right.equalTo(self.bottonView)
            make.centerY.equalTo(self.textField)
        }
        
        self.textField.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.bottonView.snp.top)
            make.left.equalTo(self.bottonView)
            make.top.equalTo(self.titleLabel.snp.bottom)
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).inset(23)
            make.left.equalTo(self.bottonView).inset(15)
        }
        
        self.bottonView.snp.makeConstraints { (make) in
            make.height.equalTo(2)
            make.bottom.equalTo(self.contentView)
            make.left.right.equalTo(self.contentView).inset(40)
        }
        
    }
    
    private func animateAccordingToStatus() {
        if self.isTyping {
            self.titleLabel.snp.makeConstraints { (make) in
                make.top.equalTo(self.contentView).inset(14)
                make.left.equalTo(self.bottonView).inset(3)
            }
        } else {
            self.titleLabel.snp.makeConstraints { (make) in
                make.top.equalTo(self.contentView).inset(23)
                make.left.equalTo(self.bottonView).inset(15)
            }
        }
        
        let fontSizeToGo: CGFloat = self.isTyping ? 11 : 16
        let clearButtonAlphaToGo: CGFloat = self.isTyping ? 1 : 0
        
        UIView.animate(withDuration: 0.2) {
            self.clearButton.alpha = clearButtonAlphaToGo
            self.titleLabel.font = UIFont(name: "DINPro-Regular", size: fontSizeToGo)
            self.layoutIfNeeded()
        }
    }
  
}


extension ValidationTextFieldCell: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.isTyping = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.isTyping = false
    }
}
