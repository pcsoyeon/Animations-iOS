//
//  SelectVC.swift
//  ExpandViewAnimation
//
//  Created by soyeon on 2021/06/29.
//

import UIKit
import SnapKit

class SelectVC: UIViewController {
    
    // MARK: - UIComponents
    
    private lazy var brandListView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    @IBOutlet weak var brandSelectButton: UIView!
    @IBOutlet weak var lensSelectButton: UIView!
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
        setConstraint()
        
        initBrandSelectButton()
        initLensSelectButton()
    }

}

// MARK: - Custom Methods

extension SelectVC {
    func setView() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(brandListView)
    }
    
    func setConstraint() {
        brandListView.snp.makeConstraints { make in
            make.top.equalTo(brandSelectButton.snp.bottom).offset(25)
            make.centerX.width.equalTo(brandSelectButton)
            make.height.equalTo(200)
        }
    }
    
    func initBrandSelectButton() {
        brandSelectButton.layer.cornerRadius = 15
        brandSelectButton.layer.masksToBounds = true
        
        
    }
    
    func initLensSelectButton() {
        lensSelectButton.layer.cornerRadius = 15
        lensSelectButton.layer.masksToBounds = true
    }
}

// MARK: - Action Methods

extension SelectVC {
    @objc
    func touchUpBrandSelectButton() {
        
    }
}
