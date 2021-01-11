//
//  URLSession_PracticeViewController.swift
//  DailyCoding
//
//  Created by Aphananthe on 2021/01/10.
//

import UIKit

class URLSession_PracticeViewController: UIViewController {
    
    
    @IBOutlet weak var activityLabel: UILabel!
    private let url = URL(string: "https://www.boredapi.com/api/activity/")! //何か暇つぶしになることを返してくれるAPI
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressFindButton(_ sender: Any) {
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){ [weak self] data, responce, error in //循環参照を避けるためweak self
            guard let _self = self, let _data = data else { return } //weakをつけるとオプショナルになるためselfをバインディング
            do {
                let object = try JSONDecoder().decode(BoredAPI.self, from: _data) //BoredAPI.selfの.selfって何だよバカ
                DispatchQueue.main.async { //UI更新なのでDispatchQuere.main内に書く
                    _self.activityLabel.text = object.activity
                }
            } catch let error { //なぜまたerrorを定数で宣言するの？
                print(error)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}

