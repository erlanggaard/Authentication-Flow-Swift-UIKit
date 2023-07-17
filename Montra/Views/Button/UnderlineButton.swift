//
//  UnderlineButton.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 13/07/23.
//

import UIKit

@IBDesignable
class UnderlineButton: UIButton {

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
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        updateInspectable(state: state)
    }
    
    func setup() {
        updateInspectable()
    }
    
    func updateInspectable(state: UIControl.State = .normal) {
        let bundle = Bundle(for: self.classForCoder)
        let textColor = UIColor(named: "Violet100", in: bundle, compatibleWith: nil)!
        let font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        setAttributedTitle(
            NSAttributedString(
                string: currentTitle ?? "",
                attributes: [
                    .foregroundColor: textColor,
                    .font: font,
                    .underlineStyle: NSUnderlineStyle.single.rawValue
                ]
            ), for: state)
        alpha = isEnabled ? 1.0 : 0.3
    }
}
