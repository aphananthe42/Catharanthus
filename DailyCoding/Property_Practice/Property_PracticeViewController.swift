//
//  Property_PracticeViewController.swift
//  DailyCoding
//
//  Created by Aphananthe on 2021/01/24.
//

import UIKit

class Property_PracticeViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var textField: UITextField!
    
    private var storedProperty: Int = 100 {
        willSet {
            print("値が\(newValue)に更新されます")
        }
        didSet {
            print("値が\(oldValue)から\(storedProperty)に変更されました")
        }
    }
    
    private var computedProperty: Int {
        get {
            storedProperty * 2
        }
        set {
            storedProperty = newValue / 2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressButton(_ sender: Any) {
        computedProperty = Int(textField.text ?? "") ?? 2
        label.text = String(computedProperty)
    }
    
}
