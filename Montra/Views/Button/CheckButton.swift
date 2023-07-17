//
//  CheckButton.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 12/07/23.
//

import UIKit

@IBDesignable
public class CheckButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }

    @IBInspectable public var isChecked: Bool = false {
        didSet { updateInspectable() }
    }
    
    public override func prepareForInterfaceBuilder() {
        setup()
    }
    
    func setup() {
        updateInspectable()
    }
    
    func updateInspectable() {
        let bundle = Bundle(for: self.classForCoder)
        let imageName = isChecked ? "checkedBox" : "checkBox_blank"
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysOriginal)
        setImage(image, for: .normal)
    }
    
}
