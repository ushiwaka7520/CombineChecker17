//
//  ViewModel.swift
//  NarouRankingViewer17
//
//  Created by cmStudent on 2022/07/10.
//

import Foundation
import Combine

final class ViewModel: ObservableObject{
    
    var cancellables: [Cancellable] = []
    @Published var text = ""
    @Published var updateButton = false
    @Published var isShown = true
    @Published var list: [String]?
    @Published var defaultList: [String] = ["bou01", "bou02", "bou03", "bou04", "bou05", "bou06"]
    @Published var image:String?
    @Published var reList: [String]?
    @Published var num = 0
    
    init(){
        
        //ListViewでタップされた画像を別の画像に置き換える
        list = defaultList
        //値の変更に合わせ、.sinkの後の処理が動く
        //算出された値を変数（今回は$image）に格納する
        let imageCancellable = $image.sink { [weak self](image) in
            guard let self = self, let imageFrame = image else { return }
            self.list![self.num] = imageFrame
        }
        //処理後の値をimageCancellableに加える
        cancellables.append(imageCancellable)
        
        //リセットして元々の配列に戻す
        //値の変更に合わせ、.sinkの後の処理が動く
        //算出された値を変数（今回は$image）に格納する
        let arrayCancellable = $reList.sink { [weak self](image) in
            guard let self = self, let resetList = image else { return }
            self.list! = resetList
        }
        //処理後の値をarrayCancellableに加える
        cancellables.append(arrayCancellable)
    }
}
