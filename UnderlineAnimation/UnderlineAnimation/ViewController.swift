//
//  ViewController.swift
//  UnderlineAnimation
//
//  Created by soyeon on 2021/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Types
    
    struct Constants {
        struct ConstraintIdentifiers {
            static let centerLeftConstraintIdentifier = "centerLeftConstraintIdentifier"
            static let centerRightConstraintIdentifier = "centerRightConstraintIdentifier"
            static let widthConstraintIdentifier = "widthConstraintIdentifier"
        }
        
        struct ColorPalette {
            static let green = UIColor(red:0.00, green:0.87, blue:0.71, alpha:1.0)
        }
    }
    
    // MARK: - UIComponents
 
    @IBOutlet weak var optionBar: UIStackView!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var myStuffButton: UIButton!
    
    
    // MARK: - Local Variables
    
    var underlineView: Underline!
    
    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        notificationButton.tintColor = Constants.ColorPalette.green
        myStuffButton.tintColor = Constants.ColorPalette.green
        
        setUpUnderlineView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for constraint in underlineView.constraints {
            if constraint.identifier == Constants.ConstraintIdentifiers.widthConstraintIdentifier {
                constraint.constant = (optionBar.frame.width / 2.5)
                self.view.layoutIfNeeded()
            }
        }
    }
}

extension ViewController {
    
    // MARK: - CustomMethods
    
    func configureNavBar() {
        self.navigationController?.navigationBar.barTintColor = Constants.ColorPalette.green
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
    func setUpUnderlineView() {
        underlineView = Underline()
        view.addSubview(underlineView)
        
        let topConstraint = underlineView.topAnchor.constraint(equalTo: optionBar.bottomAnchor)
        let heightConstraint = underlineView.heightAnchor.constraint(equalToConstant: 2)
        
        let leftButton = optionBar.arrangedSubviews[0]
        let centerLeftConstraint = underlineView.centerXAnchor.constraint(equalTo: leftButton.centerXAnchor)
        centerLeftConstraint.identifier = Constants.ConstraintIdentifiers.centerLeftConstraintIdentifier
        
        let widthConstraint = underlineView.widthAnchor.constraint(equalToConstant: (optionBar.frame.width / 2.5))
        widthConstraint.identifier = Constants.ConstraintIdentifiers.widthConstraintIdentifier
        
        NSLayoutConstraint.activate([topConstraint, heightConstraint, widthConstraint, centerLeftConstraint])
    }
    
}

