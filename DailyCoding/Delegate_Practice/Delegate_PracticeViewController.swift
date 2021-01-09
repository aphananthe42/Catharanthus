//
//  Delegate_PracticeViewController.swift
//  DailyCoding
//
//  Created by Aphananthe on 2021/01/09.
//
//  デリゲートパターンの復習

import UIKit

class Delegate_PracticeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let reuseIdentifier = "tableViewCell"
    private let toDo = ["発狂する", "朝ごはんを食べる", "二度寝する", "雨乞いする", "寝る"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
}

extension Delegate_PracticeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = toDo[indexPath.row]
        return cell
    }
}
