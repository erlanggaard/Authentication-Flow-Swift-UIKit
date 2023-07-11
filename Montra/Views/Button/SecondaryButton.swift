//
//  SecondaryButton.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 09/07/23.
//

import UIKit

@IBDesignable
public class SecondaryButton: UIButton {
    
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
        let bundle = Bundle(for: self.classForCoder)
        let textColor = UIColor(named: "Violet100", in: bundle , compatibleWith: nil)
        let bgColor = UIColor(named: "Violet20", in: bundle, compatibleWith: nil)
        
        setTitleColor(textColor, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        backgroundColor = bgColor
        
        update()
    }
    
    func update() {
        layer.cornerRadius = cornerRadius
    }

}
