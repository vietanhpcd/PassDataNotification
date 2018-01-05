//
//  TableViewController.swift
//  PassDataNotification
//
//  Created by Anhdzai on 1/5/18.
//  Copyright © 2018 Anhdzai. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var array = [Int](0...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: NSNotification.Name.init(rawValue: "PostVC"), object: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let data = segue.destination as? ViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            data.dataInt = array[indexPath.row]
        }
    }
    
    @objc func onNotification(notification: Notification) {
        if let msg = notification.userInfo,
            let indexPath = tableView.indexPathForSelectedRow {
            array[indexPath.row] = msg["key"] as! Int
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}
