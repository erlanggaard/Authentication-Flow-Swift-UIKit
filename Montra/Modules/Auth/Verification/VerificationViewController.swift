//
//  VerificationViewController.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 18/07/23.
//

import UIKit

class VerificationViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var otpTexfield: OtpTextField!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var resendButton: UnderlineButton!
    @IBOutlet weak var verifyButton: PrimaryButton!
    
    var email: String!
    var name: String!
    var password: String!
    
    var timerActual: Timer?
    var startTime: Date = Date()
    let maxTime: TimeInterval = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        startTimer()
    }
    
    
    
    func setup() {
        
        // Attributed Text
        let attText = NSMutableAttributedString(
            string: "We send verification code to your email \(email ?? ""). You can check your inbox.",
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
    
    // TIMER FUNCTION
    func startTimer() {
        stopTimerActual()
        startTime = Date()
        timerActual = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
            let delta = Date().timeIntervalSince(self?.startTime ?? Date(timeIntervalSince1970: 0))
            let maxTime = self?.maxTime ?? 0
            
            if delta > maxTime {
                self?.timer.text = 0.timeString
                self?.resendButton.isEnabled = true
                self?.stopTimerActual()
            }
            else {
                self?.timer.text = (maxTime - delta).timeString
                self?.resendButton.isEnabled = false
            }
        })
    }
    
    deinit {
        stopTimerActual()
    }
    
    func stopTimerActual() {
        timerActual?.invalidate()
    }
    
    //MARK - Action
    @IBAction func verifyButtonPressed(_ sender: Any) {
        verify()
    }
    
    @IBAction func resendButtonPressed(_ sender: Any) {
        resend()
    }
    
    func resend() {
        
    }
    
    func verify() {
        let otp = otpTexfield.otp
        guard otp.count == otp.count else {
            showErrorAlert(message: "OTP is Not Valid")
            return
        }
        print("Success!")
        
        // go to success verified page
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
