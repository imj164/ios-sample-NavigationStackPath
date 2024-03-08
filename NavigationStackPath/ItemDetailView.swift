//
//  ItemDetailView.swift
//  NavigationStackPath
//
//  Created by Hiroshi IMAJO on 2024/03/08.
//

import SwiftUI

// 詳細画面
struct ItemDetailView: View {
    // NavigationStack用ビュースタック（パス）
    @Binding var navigationPath: NavigationPath
    // 表示対象データ管理オブジェクト
    @ObservedObject var itemManager: ItemManager
    // 表示対象データ
    var item: Item

    // ビュー本体
    var body: some View {
        // データ表示
        VStack {
            Text(item.title)
                .font(.title)
                .padding()
            Text(item.description)
            // 上寄せ
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Detail")
        // あえて自動表示される戻るボタンを隠す（navigationPathの操作によって画面を戻す機能の紹介のため）
        .navigationBarBackButtonHidden()
        // ツールバー部
        .toolbar {
            // 戻るボタン
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    // スタックの最後を削除することで、この画面を閉じる
                    navigationPath.removeLast()
                }) {
                    Text("<Back")
                }
            }
            // 次へボタン（次の表示対象があれば表示）
            if let nextItem = itemManager.nextItem(item) {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // 次の表示対象（画面）をスタックに積むことで、次の画面へ遷移する
                        navigationPath.append(nextItem)
                    }) {
                        Text("Next>")
                    }
                }
            }
        }
    }
}

// プレビュー
#Preview {
    ItemDetailView(navigationPath: .constant(NavigationPath()), itemManager: ItemManager(), item: ItemManager().items[0])
}
