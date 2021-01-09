//
//  RxSwift-PracticeViewController.swift
//  DailyCoding
//
//  Created by Aphananthe on 2021/01/07.
//
//  RxSwiftまわりの練習, 試し書き

import UIKit
import RxSwift
import RxCocoa

class RxSwift_PracticeViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    private let count: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtonToValue()
        bindCountToText()
    }
    
    private func bindButtonToValue() {
        button.rx.tap
            .subscribe(onNext: { [weak self] _ in
                self?.increment()
            })
            .disposed(by: disposeBag)
    }
    
    private func increment() {
        count.accept(count.value + 1)
    }
    
    private func bindCountToText() {
        count.asObservable()
            .map { String($0) }
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }

}
