//
//  Tab.swift
//  ScrollableHeader
//
//  Created by Osman Esad on 30.10.2021.
//

import SwiftUI

struct Urun: Identifiable{
    var id = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var image: String
}

var urunler = [

    Urun(title: "Zamir", description: "Hakan Günday - Yeni Kitabı", price: "46TL", image: "kitap1"),
    Urun(title: "Cyberpunk 2077", description: "PS5 Oyunu - Yakın gelecekte geçen aksiyon macera.", price: "249TL", image: "oyun2"),
    Urun(title: "Dune", description: "Frank Herbert - Çöl gezegeninde yeni bir peygamber.", price: "36TL", image: "kitap2"),
    Urun(title: "Var mısın?", description: "Doğan Cüceloğlu - Kişel gelişim, hayata bakış.", price: "29TL", image: "kitap3"),
    Urun(title: "NBK2K22", description: "NBA Yıldızlarından oluşan bir PS5 oyunu.", price: "450LT", image: "oyun1"),
    Urun(title: "Kaybedenler Kulübü", description: "Yeni seri yeni plak.", price: "69TL", image: "muzik1"),
    Urun(title: "Neşe Ertaş'tan Seçmeler", description: "Ustanın eserlerini şimdi plakta dinleyin.", price: "56TL", image: "muzik2"),
    Urun(title: "Nintendo", description: "Taşınabilir eğlence, oyun konsolu.", price: "1259TL", image: "konsol1"),
    Urun(title: "Metalik Kalem", description: "Faber Castel Boya kalemi seti.", price: "67TL", image: "kirtasiye1"),
    Urun(title: "Planlı Ajanda", description: "Sert karton kapak, tarihli ajanda.", price: "55TL", image: "kirtasiye2"),
    Urun(title: "Tüm Dersler Sorubankası 4", description: "Yazılıya hazırlık, konu özetli.", price: "78TL", image: "sorubankasi1"),
    Urun(title: "Matematik 0", description: "Üniversite sınavına hazırlık.", price: "94TL", image: "sorubankasi2")
    
]

struct Tab: Identifiable{
    var id = UUID().uuidString
    var tab: String
    var urunler: [Urun]
}


var tabsItems = [

    Tab(tab: "Kitap", urunler: urunler.shuffled()),
    
    Tab(tab: "Müzik", urunler: urunler.shuffled()),
    Tab(tab: "Elektronik", urunler: urunler.shuffled()),
    Tab(tab: "Oyun", urunler: urunler.shuffled())
]
