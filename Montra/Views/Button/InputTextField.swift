//
//  InputTextField.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 10/07/23.
//

import UIKit

@IBDesignable
public class InputTextField: UITextField {
    
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

    @IBInspectable var cornerRadius: CGFloat = 16 {
        didSet { updateInspectable() }
    }
    
    // Button on Cell
    private weak var rightButton: UIButton?
    private weak var leftButton: UIButton?
    
    @IBInspectable var rightImage: UIImage? = nil {
        didSet { updateInspectable() }
    }
    @IBInspectable var leftImage: UIImage? = nil {
        didSet { updateInspectable() }
    }
    
    // Margin Image Right
    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var frame = super.rightViewRect(forBounds: bounds)
        frame.origin.x -= rightImage == nil ? 0 : 16
        return frame
    }
    
    // Margin Image Left
    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var frame = super.leftViewRect(forBounds: bounds)
        frame.origin.x += leftImage == nil ? 0 : 16
        return frame
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        let left: CGFloat = leftImage == nil ? 16 : 16 + (leftImage?.size.width ?? 0) + 8
        let right: CGFloat = rightImage == nil ? 16 : 16 + (rightImage?.size.width ?? 0) + 8
        
        return bounds.inset(by: UIEdgeInsets(top: 0, left: left, bottom: 0, right: right))
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let left: CGFloat = leftImage == nil ? 16 : 16 + (leftImage?.size.width ?? 0) + 8
        let right: CGFloat = rightImage == nil ? 16 : 16 + (rightImage?.size.width ?? 0) + 8
        
        return bounds.inset(by: UIEdgeInsets(top: 0, left: left, bottom: 0, right: right))
    }
    
    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let left: CGFloat = leftImage == nil ? 16 : 16 + (leftImage?.size.width ?? 0) + 8
        let right: CGFloat = rightImage == nil ? 16 : 16 + (rightImage?.size.width ?? 0) + 8
        
        return bounds.inset(by: UIEdgeInsets.init(top: 0, left: left, bottom: 0, right: right))
    }
    
    private func setup() {
        let bundle = Bundle(for: self.classForCoder)
        
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "Light60", in: bundle, compatibleWith: nil)?.cgColor
        
        updateInspectable()
    }
    
    // MARK: - HELPERS
    
    func updateInspectable() {
        layer.cornerRadius = cornerRadius
        
        // Right Image Button
        if let image = rightImage {
            let button: UIButton
            if let rightButton = self.rightButton {
                button = rightButton
            }
            else {
                button = UIButton(type: .system)
                rightView = button
                rightButton = button
            }
            button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            button.addTarget(self, action: #selector(self.rightButtonTapped(_:)), for: .touchUpInside)
            rightViewMode = .always
        }
        else {
            rightView = nil
            rightButton = nil
            rightViewMode = .never
        }
        
        // Left Image Button
        if let image = leftImage {
            let button: UIButton
            if let leftButton = self.leftButton {
                button = leftButton
            }
            else {
                button = UIButton(type: .system)
                leftView = button
                leftButton = button
            }
            button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            button.addTarget(self, action: #selector(self.leftButtonTapped(_:)), for: .touchUpInside)

            leftViewMode = .always
        }
        else {
            leftView = nil
            leftButton = nil
            leftViewMode = .never
        }
    }
    
    public var rightImageTapped: () -> Void = { }
    @objc private func rightButtonTapped(_ sender: Any) {
        rightImageTapped()
    }
    
    public var leftImageTapped: () -> Void = { }
    @objc private func leftButtonTapped(_ sender: Any) {
        leftImageTapped()
    }

}
