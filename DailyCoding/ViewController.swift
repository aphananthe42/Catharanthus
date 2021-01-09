//
//  ViewController.swift
//  DailyCoding
//
//  Created by Aphananthe on 2021/01/06.
//

import UIKit

class ViewController: UIViewController {
    
    private let RxSwift_PracticeID = "RxSwift_Practice"
    private let Delegate_PracticeID = "Delegate_Practice"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //画面遷移の方法は主に3つ
    //①StoryboardReferenceを貼る → UIButton等から直接Segueを生やす方法(ただ画面遷移したい時に使う)
    //②StoryboardReferenceを貼る → UIViewControllerからSegue(SegueIDを設定すること)を生やす方法(画面遷移前後に何かやりたい時に使う)
    //③ViewControllerにStoryboardIDを設定し、コードで画面遷移を実装する方法(UIを全部コードで実装している時とかに使う)
    //
    //このViewControllerでは③で画面遷移している
    //
    //Q. instantiateInitialViewController()とinstantiateViewController()の違いとは?
    //A. instantiateInitialViewController()はInitialとあるように、各StoryboardでisInitialとなっているものを呼ぶ
    //   instantiateViewController()は引数でIdentifierを設定する なのでisInitialでなくとも任意のVCを呼ぶことができる
    //   ただ今回のようなUINavegationControllerつきのVCに遷移する場合は注意
    //   UINavigationControllerにはModal遷移はできるがPush遷移はできないので、isInitialがUINavigationControllerになっているStoryboardに
    //   instantiateInitialViewController()を実行すると遷移元がnavigationControllerだった場合に落ちる
    
    @IBAction func pushToRxSwiftViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: RxSwift_PracticeID, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: RxSwift_PracticeID) as? RxSwift_PracticeViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pushToDelegate_PracticeViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: Delegate_PracticeID, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: Delegate_PracticeID) as? Delegate_PracticeViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


