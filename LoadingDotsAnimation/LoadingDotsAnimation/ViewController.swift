//
//  ViewController.swift
//  LoadingDotsAnimation
//
//  Created by soyeon on 2021/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Local Variables
    
    var isStatusBarHidden: Bool = false
    
    @IBOutlet weak var firstDot: UIImageView!
    @IBOutlet weak var secondDot: UIImageView!
    @IBOutlet weak var thirdDot: UIImageView!

    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStatusBarAnimation()
        setDotsAnimation()
    }

    // MARK: - Custom Methods
    
    func setStatusBarAnimation() {
        self.isStatusBarHidden = !self.isStatusBarHidden
        
        UIView.animate(withDuration: 0.3, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        })
    }
    
    func setDotsAnimation() {
        firstDot.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        secondDot.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        thirdDot.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            self.firstDot.transform = CGAffineTransform.identity
            }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.2, options: [.repeat, .autoreverse], animations: {
            self.secondDot.transform = CGAffineTransform.identity
            }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.4, options: [.repeat, .autoreverse], animations: {
            self.thirdDot.transform = CGAffineTransform.identity
            }, completion: nil)
        
    }
    
    // MARK: - Status Bar
    
    override var prefersStatusBarHidden: Bool {
        return self.isStatusBarHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }


}

