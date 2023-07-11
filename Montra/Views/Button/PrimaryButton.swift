//
//  PrimaryButton.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 09/07/23.
//

import UIKit

@IBDesignable
public class PrimaryButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 16 {
        didSet {
            updateInspectable()
        }
    }

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
    
    public override var isEnabled: Bool {
        didSet {
            updateInspectable()
        }
    }
    
    func setup() {
//        tintColor = UIColor.white
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        let color = UIColor(named: "Violet100", in: Bundle(for: self.classForCoder), compatibleWith: nil)
        backgroundColor = color
        
        updateInspectable()
    }
    
    func updateInspectable() {
        layer.cornerRadius = cornerRadius
        alpha = isEnabled ? 1.0 : 0.3
    }
    
}
