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
        }
        
        struct ColorPalette {
            static let green = UIColor(red:0.00, green:0.87, blue:0.71, alpha:1.0)
        }
    }
    
    enum Side {
        case left
        case right
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
        setUpUnderlineView()
        
        notificationButton.tintColor = Constants.ColorPalette.green
        notificationButton.addTarget(self, action: #selector(touchUpNotificationButton(_:)), for: .touchUpInside)
        
        myStuffButton.tintColor = Constants.ColorPalette.green
        myStuffButton.addTarget(self, action: #selector(touchUpMyStuffButton(_:)), for: .touchUpInside)
    }
}


extension ViewController {
    
    // MARK: - ActionMethods
    @objc
    func touchUpNotificationButton(_ sender: UIButton) {
        animateUnderlineBar(underlineView, toSide: .left)
    }
    
    @objc
    func touchUpMyStuffButton(_ sender: UIButton) {
        animateUnderlineBar(underlineView, toSide: .right)
    }
    
    
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
        let widthConstraint = underlineView.widthAnchor.constraint(equalToConstant: (optionBar.frame.width / 2.5))
        
        let leftButton = optionBar.arrangedSubviews[0]
        let centerLeftConstraint = underlineView.centerXAnchor.constraint(equalTo: leftButton.centerXAnchor)
        centerLeftConstraint.identifier = Constants.ConstraintIdentifiers.centerLeftConstraintIdentifier
        
        NSLayoutConstraint.activate([topConstraint, heightConstraint, widthConstraint, centerLeftConstraint])
    }
    
    func animateUnderlineBar(_ underlineView: Underline, toSide: Side) {
        switch toSide {
        case .left:
            for constraint in underlineView.superview!.constraints {
                if constraint.identifier == Constants.ConstraintIdentifiers.centerRightConstraintIdentifier {
                    
                    constraint.isActive = false
                    
                    let leftButton = optionBar.arrangedSubviews[0]
                    let centerLeftConstraint = underlineView.centerXAnchor.constraint(equalTo: leftButton.centerXAnchor)
                    centerLeftConstraint.identifier = Constants.ConstraintIdentifiers.centerLeftConstraintIdentifier
                    
                    NSLayoutConstraint.activate([centerLeftConstraint])
                }
            }
            
        case .right:
            for constraint in underlineView.superview!.constraints {
                if constraint.identifier == Constants.ConstraintIdentifiers.centerLeftConstraintIdentifier {
                    
                    constraint.isActive = false
                    
                    let rightButton = optionBar.arrangedSubviews[1]
                    let centerRightConstraint = underlineView.centerXAnchor.constraint(equalTo: rightButton.centerXAnchor)
                    centerRightConstraint.identifier = Constants.ConstraintIdentifiers.centerRightConstraintIdentifier
                    
                    NSLayoutConstraint.activate([centerRightConstraint])
                }
            }
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [], animations: {
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
}

