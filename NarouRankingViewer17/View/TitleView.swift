//
//  ContentView.swift
//  NarouRankingViewer17
//
//  Created by cmStudent on 2022/07/10.
//

import SwiftUI

struct TitleView: View {
    @StateObject var viewmodel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                Image("book_icon")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                Text("Picture　　　　")
                    .font(.title)
                
                Text("　　　Changer")
                    .font(.title)
                
                NavigationLink(destination: DataInputView(viewmodel: viewmodel)){
                    //Dataloadボタンを押すことで遷移
                    Text("Start")
                        .padding()
                        .font(.title)
                }
            }
            Spacer()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
