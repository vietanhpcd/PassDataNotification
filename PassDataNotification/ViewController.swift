//
//  ViewController.swift
//  PassDataNotification
//
//  Created by Anhdzai on 1/5/18.
//  Copyright © 2018 Anhdzai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var dataInt: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = String(dataInt!)
    }

    @IBAction func buttonSave(_ sender: Any) {
        if let textInt = Int(textField.text!) {
            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "PostVC"), object: nil, userInfo: ["key": textInt])
            navigationController?.popViewController(animated: true)
        }
    }
}

