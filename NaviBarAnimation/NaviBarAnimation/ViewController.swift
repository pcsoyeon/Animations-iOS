//
//  ViewController.swift
//  NaviBarAnimation
//
//  Created by soyeon on 2021/06/15.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UIComponents

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Types
    
    struct Constants {
        struct Images {
            static let one = "one"
            static let two = "two"
            static let three = "three"
            static let four = "four"
            static let five = "five"
            static let six = "six"
        }
    }
    
    // MARK: - Properties
    var entries = [Entry(title: "First Entry", image: UIImage(named: "one")!),
                   Entry(title: "Exploring", image: UIImage(named: "two")!),
                   Entry(title: "Traveling Abroad", image: UIImage(named: "three")!),
                   Entry(title: "Scuba Diving", image: UIImage(named: "four")!),
                   Entry(title: "Trip Together", image: UIImage(named: "five")!),
                   Entry(title: "The Unknown", image: UIImage(named: "six")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationController()
        tableView.dataSource = self
    }


}

extension ViewController {
    func configureNavigationController() {
        navigationController?.hidesBarsOnSwipe = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EntryCell.identifier) as? EntryCell else {
            return UITableViewCell()
        }
        let data = entries[indexPath.row]
        cell.entryLabel.text = data.title
        cell.entryImage.image = data.image
        return cell
    }
}

