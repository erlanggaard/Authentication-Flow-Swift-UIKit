//
//  OnboardingViewController.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 08/07/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    
    var itemsOnboarding: [Onboarding] = [
        Onboarding(imageName: "img_onboarding_1",
                   title: "Gain total of your money",
                   subtitle: "Become your own money manager and make every cent count"),
        Onboarding(imageName: "img_onboarding_2",
                   title: "Know where money goes",
                   subtitle: "Track your transaction with categories and financial report"),
        Onboarding(imageName: "img_onboarding_3",
                   title: "Planning ahead",
                   subtitle: "Setup your budget for each category so you in control"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = itemsOnboarding.count
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        showSignUpViewController()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        showLoginViewController()
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsOnboarding.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboarding_cell", for: indexPath) as! OnboardingCollectionViewCell
        let item = itemsOnboarding[indexPath.item]
        
        cell.img_onboarding.image = UIImage(named: item.imageName)
        cell.title.text = item.title
        cell.subtitle.text = item.subtitle
        
        return cell
    }
}

// MENGATUR LAYOUT PADA ITEM COLLECTION VIEW
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    //size for item at
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let height = collectionView.frame.height
        
        return CGSize(width: screenWidth, height: height)
    }
    
    // Mengatur jarak antar section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension OnboardingViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(page)
    }
}
