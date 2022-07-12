//
//  DataInputView.swift
//  NarouRankingViewer17
//
//  Created by cmStudent on 2022/07/10.
//

import SwiftUI
import Combine

struct DataInputView: View {
    @ObservedObject var viewmodel: ViewModel
    
    var body: some View {
        
        ZStack {
            VStack{
                Spacer()
                
                NavigationLink(destination: ListView(viewmodel: viewmodel)){
                    Text("Picture Changer")
                        .font(.title)
                }
                
                Text("リセット適用時刻")
                    .padding()
                    .font(.title2)
                
                Text(viewmodel.text)
                    .font(.title2)
                
                HStack{
                    Spacer()
                    
                    //defaultに格納した交換前のlistに更新するボタン
                    Button {
                        if(viewmodel.updateButton == false){
                            //更新時刻を出す
                            viewmodel.text = Model().getDate()
                            //配列をDefaultに戻す機能(Combineを利用)
                            viewmodel.reList = viewmodel.defaultList
                            
                        }else{
                            //処理なし
                        }
                    } label: {
                        Text("Reset Picture")
                            .font(.title)
                            .padding()
                    }
                }
                
                //タップ時にイラスト表示を切り替える、ループする処理
                Button {
                    if(viewmodel.num == 5){
                        viewmodel.num = 0
                    }else{
                        viewmodel.num = viewmodel.num + 1
                    }
                } label: {
                    Text("View Picture")
                        .padding()
                        .font(.title)
                }
                
                //交換後の配列を表示する処理
                Image("\(viewmodel.list?[viewmodel.num] ?? "")")
                    .resizable()
                
                Spacer()
            }
            //最初の段階でリセット時刻として現在時刻を表示
            .onAppear{
                viewmodel.text = Model().getDate()
            }
        }
    }
}
