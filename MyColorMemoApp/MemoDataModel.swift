//
//  MemoDataModel.swift
//  MyColorMemoApp
//
//  Created by Taku Yamada on 2021/03/14.
//

import Foundation
import RealmSwift

class MemoDataModel: Object {
    @objc dynamic var id: String = UUID().uuidString // データを一意に識別するための識別子
    @objc dynamic var text: String = ""
    @objc dynamic var recordDate: Date = Date()
}
