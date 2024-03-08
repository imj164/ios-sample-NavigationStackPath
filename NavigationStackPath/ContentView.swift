//
//  ContentView.swift
//  NavigationStackPath
//
//  Created by Hiroshi IMAJO on 2024/03/08.
//

import SwiftUI

// メイン画面
struct ContentView: View {
    // NavigationStack用ビュースタック（パス）
    @State private var navigationPath = NavigationPath()
    // 表示対象データ管理オブジェクト
    @StateObject private var itemManager = ItemManger()

    // ボタンによる詳細画面切り替えのためのインデックス（デモ用）
    @State private var index = 0
    
    // ビュー本体
    var body: some View {
        // ナビゲーションを有効にする
        NavigationStack(path: $navigationPath) {
            VStack {
                // データ一覧画面を表示
                ItemListView(items: itemManager.items)
                Spacer()
                // ボタンによる画面遷移
                Button(action: {
                    // スタックに表示対象データを追加することで画面遷移させている
                    navigationPath.append(itemManager.items[index])
                    // 次に遷移する対象を順次変えている
                    index = (index + 1) % itemManager.items.count
                }) {
                    // ボタンラベルも順次変えている
                    Text("Show \(itemManager.items[index].title)")
                }
            }
            // NavigationLinkやビュースタックの操作による遷移先を指定（あえてこんなところに定義）
            .navigationDestination(for: Item.self) { item in
                // データ詳細画面へ
                ItemDetailView(navigationPath: $navigationPath, item: item)
            }
        }
    }
}

// プレビュー
#Preview {
    ContentView()
}
