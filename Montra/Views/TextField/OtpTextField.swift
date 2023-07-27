//
//  OtpTextField.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 21/07/23.
//

import UIKit

@IBDesignable
public class OtpTextField: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public override func prepareForInterfaceBuilder() {
        setup()
    }
    
    @IBInspectable public var digitsCode: Int = 6 {
        didSet { setup() }
    }
    
    @IBInspectable public var otp: String {
        get {
            return textField.text ?? ""
        }
        set {
            setOtp(newValue)
        }
    }
    
    weak var textField: UITextField!
    weak var button: UIButton!
    weak var stackView: UIStackView!
    
    private func setup () {
        // Texfield
        if self.textField == nil {
            let textField = UITextField(frame: .zero)
            addSubview(textField)
            self.textField = textField
            
            textField.alpha = 0
            textField.borderStyle = .none
            textField.keyboardType = .numberPad
            textField.textContentType = .oneTimeCode // ketika sms masuk, otomatis input ke textfield
            textField.textColor = .clear
            textField.tintColor = .clear
            textField.delegate = self
            
            textField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                textField.heightAnchor.constraint(equalToConstant: 0), // height
                textField.widthAnchor.constraint(equalToConstant: 0), // width
                textField.centerXAnchor.constraint(equalTo: self.centerXAnchor), // horizontal center
                textField.centerYAnchor.constraint(equalTo: self.centerYAnchor) // vertical center
            ])
        }
        
        // Button
        if self.button == nil {
            let button = UIButton(frame: .zero)
            addSubview(button)
            self.button = button
            
            button.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                button.topAnchor.constraint(equalTo: self.topAnchor),
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
        
        // StackView
        if self.stackView == nil {
            let stackView = UIStackView()
            addSubview(stackView)
            self.stackView = stackView
            
            stackView.axis = .horizontal
            stackView.spacing = 16
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.isUserInteractionEnabled = false
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                stackView.topAnchor.constraint(equalTo: self.topAnchor),
                stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
        
        stackView.arrangedSubviews.forEach { (view) in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        for i in 0..<digitsCode {
            let textField = UITextField(frame: .zero)
            
            stackView.addArrangedSubview(textField)
            textField.tag = i
            textField.font = UIFont.systemFont(ofSize: 32, weight: .bold)
            textField.placeholder = "•"
            textField.textAlignment = .center
            
            textField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                textField.widthAnchor.constraint(equalToConstant: 22)
            ])
        }
        setOtp(otp)
    }
    
    private func setOtp(_ otp: String) {
        let characters = [Character](otp)
        for i in 0..<digitsCode {
            let textField = stackView.arrangedSubviews[i] as? UITextField
            if characters.count > i {
                textField?.text = String(characters[i])
            }
            else {
                textField?.text = nil
            }
        }
        textField.text = otp
    }
    
    @objc private func buttonTapped(_ sender: Any) {
        textField.becomeFirstResponder()
    }

}

extension OtpTextField: UITextFieldDelegate {
    // replacementString
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        guard text.count <= digitsCode else {
            return false
        }
        setOtp(text)
        return false
    }
}
