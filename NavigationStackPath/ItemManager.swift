//
//  ItemManager.swift
//  NavigationStackPath
//
//  Created by Hiroshi IMAJO on 2024/03/08.
//  ダミーデータのdescriptionはChatGPTで生成
//

import Foundation

// 複数の表示対象データを管理するオブジェクト
final class ItemManger: ObservableObject {
    // 管理する表示対象データ群
    @Published var items: [Item] = []
    
    // イニシャライザ
    init() {
        // ダミーデータを生成、保持
        items = [
            Item(title: "Apple", description: "Apples are versatile fruits known for their crisp texture, sweet flavor, and nutritional benefits, commonly used in cooking and enjoyed fresh worldwide."),
            Item(title: "Banana", description: "Bananas are elongated, curved fruits with a soft texture and sweet taste, packed with essential nutrients like potassium and fiber, often eaten fresh or used in smoothies and baking."),
            Item(title: "Cherry", description: "Cherries are small, round fruits with a bright red or deep purple color, prized for their juicy flesh and sweet-tart flavor, commonly enjoyed fresh, dried, or used in desserts and preserves."),
            Item(title: "Durian", description: "Durian is a large, spiky fruit known for its strong odor and unique taste, often described as a combination of creamy custard and onions, popular in Southeast Asian cuisine."),
            Item(title: "Elderberry", description: "Elderberries are small, dark purple berries packed with antioxidants and vitamins, known for their tart flavor and medicinal properties, often used in jams, syrups, and herbal remedies.")
        ]
    }
}
