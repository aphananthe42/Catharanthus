//
//  ViewController.swift
//  DailyCoding
//
//  Created by Aphananthe on 2021/01/06.
//

import UIKit

class ViewController: UIViewController {
    
    private let storyboardIdentifier = "RxSwift_Practice"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushToEachViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? RxSwift_PracticeViewController else { return }
        present(vc, animated: true, completion: nil)
    }
    
}


