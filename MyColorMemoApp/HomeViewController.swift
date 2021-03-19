//
//  HomeViewController.swift
//  MyColorMemoApp
//
//  Created by Taku Yamada on 2021/03/03.
//

import Foundation
import UIKit // UIに関するクラスが格納されたモジュール
import RealmSwift

// HomeViewControllerにUIViewControllerを「クラス継承」する
class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var memoDataList: [MemoDataModel] = []
    
    override func viewDidLoad() {
        // このクラスの画面が表示される際に呼び出されるメソッド
        // 画面の表示・非表示に応じて実行されるメソッドを「ライフサイクルメソッド」と呼ぶ
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        setNavigationBarButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setMemoData()
        tableView.reloadData()
    }
    
    func setMemoData() {
        let realm = try! Realm()
        let result = realm.objects(MemoDataModel.self)
        memoDataList = Array(result)
    }
    
    @objc func tapAddButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memoDetailViewController = storyboard.instantiateViewController(identifier: "MemoDetailViewController") as! MemoDetailViewController
        navigationController?.pushViewController(memoDetailViewController, animated: true)
    }
    
    func setNavigationBarButton() {
        let buttonActionSelector: Selector = #selector(tapAddButton)
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: buttonActionSelector)
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        // indexPath.row→UItableViewに表示されるCellの(0から始まる)通り番号が順番に渡される
        let memoDataModel: MemoDataModel = memoDataList[indexPath.row]
        cell.textLabel?.text = memoDataModel.text
        cell.detailTextLabel?.text = "\(memoDataModel.recordDate)"
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboad = UIStoryboard(name: "Main", bundle: nil)
        let memoDetailViewController = storyboad.instantiateViewController(identifier: "MemoDetailViewController") as! MemoDetailViewController
        let memoData = memoDataList[indexPath.row]
        memoDetailViewController.configure(memo: memoData)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(memoDetailViewController, animated: true)
    }
}
