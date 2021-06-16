//
//  ViewController.swift
//  LockScreenAnimation
//
//  Created by soyeon on 2021/06/15.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var topLock: UIImageView!
    @IBOutlet weak var bottomLock: UIImageView!
    @IBOutlet weak var lockBorder: UIImageView!
    @IBOutlet weak var lockKeyhole: UIImageView!
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openLock()
    }
    
    // MARK: - Custom Methods
    func openLock() {
        UIView.animate(withDuration: 0.4, delay: 3.0, options: [], animations: {
            
            // Rotate keyhole.
            self.lockKeyhole.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            
            }, completion: { _ in
                UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                    
                    // Open lock.
                    let yDelta = self.lockBorder.frame.maxY
                    
                    self.topLock.center.y -= yDelta
                    self.lockKeyhole.center.y -= yDelta
                    self.lockBorder.center.y -= yDelta
                    self.bottomLock.center.y += yDelta
                    }, completion: { _ in
                        self.topLock.removeFromSuperview()
                        self.lockKeyhole.removeFromSuperview()
                        self.lockBorder.removeFromSuperview()
                        self.bottomLock.removeFromSuperview()
                })
        })
    }
    
    // MARK: - Status Bar
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

}

