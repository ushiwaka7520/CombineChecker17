//
//  RankingView.swift
//  NarouRankingViewer17
//
//  Created by cmStudent on 2022/07/10.
//

import SwiftUI
import Combine

struct ListView: View {
    @ObservedObject var viewmodel: ViewModel
    
    var body: some View {
        List{
            ForEach(0..<viewmodel.list!.count, id: \.self){num in
                Button {
                    //押された画像を"sick01"画像を交換する
                    //ファイル名を格納した配列のタップされた値を交換する（課題の要点であるCombineを利用する形で）
                    viewmodel.list?[num] = "sick01"
                    
                } label: {
                    Image("\(viewmodel.list?[num] ?? "")")
                        .resizable()
                }
            }
        }
    }
}
