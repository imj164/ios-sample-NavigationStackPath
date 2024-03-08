//
//  ItemListView.swift
//  NavigationStackPath
//
//  Created by Hiroshi IMAJO on 2024/03/08.
//

import SwiftUI

// 一覧画面
struct ItemListView: View {
    // 表示対象データ一覧
    var items: [Item]
    
    // ビュー本体
    var body: some View {
        // 一覧部
        List {
            // 各データについて
            ForEach(items) { item in
                // ナビゲーションリンク付きで
                NavigationLink(value: item) {
                    // タイトルを表示
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.title)
                    }
                }
            }
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("List")
    }
}

// プレビュー
#Preview {
    ItemListView(items: ItemManager().items)
}
