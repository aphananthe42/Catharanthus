//
//  GCD_PracticeViewController.swift
//  DailyCoding
//
//  Created by Aphananthe on 2021/01/10.
//

import UIKit

class GCD_PracticeViewController: UIViewController {

    @IBOutlet weak var queueConditionLabel: UILabel!
    private let queueGroup = DispatchGroup() //グループにまとめることができる
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressExecution(_ sender: Any) {
        DispatchQueue.global(qos: .userInteractive).async(group: queueGroup) { //最優先, 即座にタスクが実行されてほしい時
            for _ in 0...10 {
                print("🟦")
            }
        }
        DispatchQueue.global(qos: .userInitiated).async(group: queueGroup) { //優先, ユーザーが待っている場合や対話的に反応したい時
            for _ in 0...10 {
                print("🟩")
            }
        }
        DispatchQueue.global(qos: .default).async(group: queueGroup) { //デフォルト, QoSを指定しないとこれになる
            for _ in 0...10 {
                print("🟨")
            }
        }
        DispatchQueue.global(qos: .utility).async(group: queueGroup) { //遅め, プログレス表示や計算・ネットワーク通信などに使う
            for _ in 0...10 {
                print("🟥")
            }
        }
        DispatchQueue.global(qos: .background).async(group: queueGroup) { //一番遅い, データのプリフェッチとかに使う
            for _ in 0...10 {
                print("🟪")
            }
        }
        queueGroup.wait() //DispatchGroupに指定した一群の処理が全部終わるまで待つ
        queueGroup.notify(queue: DispatchQueue.main) { //DispatchGroupの処理が完了したことを知らせるメソッド, 今回はUIの更新を行うので締めはメインスレッドで行う
            self.queueConditionLabel.text = "All Completed"
        }
    }
    
}
