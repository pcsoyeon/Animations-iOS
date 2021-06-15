//
//  ListTVC.swift
//  NaviBarAnimation
//
//  Created by soyeon on 2021/06/15.
//

import UIKit

class EntryCell: UITableViewCell {
    static let identifier = "EntryCell"
    
    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var entryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
