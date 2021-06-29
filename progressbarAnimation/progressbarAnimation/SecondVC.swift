//
//  SecondVC.swift
//  progressbarAnimation
//
//  Created by soyeon on 2021/06/29.
//

import UIKit

class SecondVC: UIViewController {
    
    var progressView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()

        initProgressView()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
    }
    
    func initProgressView() {
        progressView = UIProgressView()
        
        // Hide progressView2 object.
        progressView.isHidden = false
        
        // Set progressView2's initialize progress value.
        progressView.progress = 0.25
        
        // Set translatesAutoresizingMaskIntoConstraints property value to false, so that you can change progressView2's layout constraints in swift source code.
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add progressView2 to the app's root view.
        self.view.addSubview(progressView)
        
        // Change progressView2's centerx, width and top anchor layout.
        let centerXAnchor = progressView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        centerXAnchor.isActive = true
        
        let widthAnchor = progressView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
        widthAnchor.isActive = true
        
        let topAnchor = progressView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        topAnchor.isActive = true
    }
    
    

    @objc func updateProgressView() {
        UIView.animate(withDuration: 0.3) {
            if self.progressView.progress != 0.5 {
                self.progressView.setProgress(0.5, animated: true)
            }
        }
        
    }
    
    @IBAction func touchUpNext(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "ThirdVC") as? ThirdVC else {
            return
        }
        navigationController?.pushViewController(dvc, animated: true)
    }
    

}
