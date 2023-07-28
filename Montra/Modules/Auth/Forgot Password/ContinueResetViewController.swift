//
//  ContinueResetViewController.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 28/07/23.
//

import UIKit

class ContinueResetViewController: UIViewController {

    @IBOutlet weak var subtitleLabel: UILabel!
    var email: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setup() {
        let attText = NSMutableAttributedString(
            string: "Check your email \(email ?? "") and follow the instructions to reset your password",
            attributes: [
                .font: UIFont.systemFont(ofSize: 16, weight: .medium),
                .foregroundColor: UIColor(named: "Dark50")!
            ]
        )
        
        attText.addAttributes(
            [
                .font: UIFont.systemFont(ofSize: 16, weight: .medium),
                .foregroundColor: UIColor(named: "Violet100")!
            ],
            range: NSString(string: attText.string).range(of: email)
        )

        subtitleLabel.attributedText = attText
    }
    

    @IBAction func backToLoginPressed(_ sender: Any) {
        showLoginViewController()
    }
}
