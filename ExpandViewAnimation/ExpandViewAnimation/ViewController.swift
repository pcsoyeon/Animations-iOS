//
//  ViewController.swift
//  ExpandViewAnimation
//
//  Created by soyeon on 2021/06/29.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UIComponents
    
    @IBOutlet weak var brandSelectButton: UIView!
    @IBOutlet weak var triangleButton: UIButton!
    
    @IBOutlet weak var lensSelectButton: UIView!
    @IBOutlet weak var listViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lensButtonTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var listView: UIView!
    
    
    private var foldBrandList = false
    private var foldLensList = false
    
//    private var brandListView: UIView!
//    private var brandListViewHeightConstant: NSLayoutConstraint!
    
    // MARK: - LifyCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initListView()
        
        initBrandSelectButton()
        initLensSelectButton()
        
//        initBrandListView()
    }
}

// MARK: - Custom Methods

extension ViewController {
    func initListView() {
        listView.isHidden = true
        
        listView.layer.cornerRadius = 15
        listView.layer.masksToBounds = true
        
        listViewHeightConstraint.constant = 0
    }
    
    func initBrandSelectButton() {
        brandSelectButton.layer.cornerRadius = 15
        brandSelectButton.layer.masksToBounds = true
        
         let brandTapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpBrandSelectButton))
        
        brandSelectButton.addGestureRecognizer(brandTapGesture)

    }
    
    func initLensSelectButton() {
        lensSelectButton.layer.cornerRadius = 15
        lensSelectButton.layer.masksToBounds = true
        
         let lensTapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpLensSelectButton))
        
        lensSelectButton.addGestureRecognizer(lensTapGesture)
    }
    
//    func initBrandListView() {
//        brandListView = UIView(frame: CGRect(x: 36, y: 225, width: 342, height: 10))
//        brandListView.isHidden = true
//
//        brandListView.backgroundColor=UIColor.lightGray
//        brandListView.layer.cornerRadius=25
//        brandListView.layer.borderWidth=2
//        brandListView.layer.borderColor = UIColor.lightGray.cgColor
//
//        self.view.addSubview(brandListView)
//
//        let centerXAnchor = brandListView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//        centerXAnchor.isActive = true
//
//        let topAnchor = brandListView.topAnchor.constraint(equalTo: self.brandSelectButton.bottomAnchor, constant: 100)
//        topAnchor.isActive = true
//
//        let widthAnchor = brandListView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
//        widthAnchor.isActive = true
//
//        let heightAnchor = brandListView.heightAnchor.constraint(equalToConstant: 100)
//        heightAnchor.isActive = true
//        brandListViewHeightConstant = heightAnchor
//
//    }
}

// MARK: - Aciton

extension ViewController {
    @objc
    func touchUpBrandSelectButton(_ sender: UITapGestureRecognizer) {
        print("🍎 브랜드 선택 버튼 눌림")
//        self.brandListViewHeightConstant.constant = 100
        
//        UIView.animate(withDuration: 4) {
//            self.brandListView.isHidden = false
//
//            self.brandListView.transform = CGAffineTransform(scaleX: 1, y: 10)
////            self.view.layoutIfNeeded()
//
//            self.lensSelectButton.isHidden = true
//        }
        
        if !foldBrandList {
            
            foldBrandList = true
            
            self.listView.isHidden = false
            self.listViewHeightConstraint.constant = 305
            self.lensButtonTopConstraint.constant = 330
            
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        } else {
            
            foldBrandList = false
            
            self.listViewHeightConstraint.constant = 0
            self.lensButtonTopConstraint.constant = 25
            
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            
//            self.listView.isHidden = true
        }
        
        
        
    }
    
    @objc
    func touchUpLensSelectButton(_ sender: UITapGestureRecognizer) {
        print("🍏 렌즈 선택 버튼 눌림")
        
    }
}

