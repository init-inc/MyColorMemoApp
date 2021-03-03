//
//  HomeViewController.swift
//  MyColorMemoApp
//
//  Created by Taku Yamada on 2021/03/03.
//

import Foundation
import UIKit // UIに関するクラスが格納されたモジュール

// HomeViewControllerにUIViewControllerを「クラス継承」する
class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        // このクラスの画面が表示される際に呼び出されるメソッド
        // 画面の表示・非表示に応じて実行されるメソッドを「ライフサイクルメソッド」と呼ぶ
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
