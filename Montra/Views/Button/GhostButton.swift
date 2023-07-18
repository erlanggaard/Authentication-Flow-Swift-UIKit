//
//  GhostButton.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 12/07/23.
//

import UIKit

@IBDesignable
public class GhostButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    @IBInspectable var cornerRadius: CGFloat = 16 {
        didSet {
            updateInspectable()
        }
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
        setTitleColor(UIColor(named: "Dark50"), for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        let bundle = Bundle(for: self.classForCoder)
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "Light60", in: bundle, compatibleWith: nil)?.cgColor
        
        let imageName = "flat-color-icons_google"
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysOriginal)
        setImage(image, for: .normal)

        
//        let color = UIColor(named: "Violet100", in: Bundle(for: self.classForCoder), compatibleWith: nil)
//        backgroundColor = color
        
        updateInspectable()
    }
    
    func updateInspectable() {
        layer.cornerRadius = cornerRadius
        alpha = isEnabled ? 1.0 : 0.3
    }

}
