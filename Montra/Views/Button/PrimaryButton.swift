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
            update()
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
    
    func setup() {
//        tintColor = UIColor.white
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        let color = UIColor(named: "Violet100", in: Bundle(for: self.classForCoder), compatibleWith: nil)
        backgroundColor = color
        
        update()
    }
    
    func update() {
        layer.cornerRadius = cornerRadius
    }
    
}