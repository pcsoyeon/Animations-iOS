//
//  ViewController.swift
//  NaviBarAnimation
//
//  Created by soyeon on 2021/06/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var entries = [Entry(title: "First Entry", image: UIImage(named: "one")!),
                   Entry(title: "Exploring", image: UIImage(named: "two")!),
                   Entry(title: "Traveling Abroad", image: UIImage(named: "three")!),
                   Entry(title: "Scuba Diving", image: UIImage(named: "four")!),
                   Entry(title: "Trip Together", image: UIImage(named: "five")!),
                   Entry(title: "The Unknown", image: UIImage(named: "six")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

