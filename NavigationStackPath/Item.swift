//
//  Item.swift
//  NavigationStackPath
//
//  Created by Hiroshi IMAJO on 2024/03/08.
//

import Foundation

// 表示対象データ
struct Item: Identifiable, Hashable {
    // ID（Identifiable用）
    var id = UUID()
    // 表題
    var title = ""
    // 説明
    var description = ""
}
