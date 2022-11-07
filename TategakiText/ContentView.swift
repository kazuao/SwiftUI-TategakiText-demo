//
//  ContentView.swift
//  TategakiText
//
//  Created by kazunori.aoki on 2022/11/07.
//

import SwiftUI

// ref: https://qiita.com/fuziki/items/b31055a69330a3ce55a5

struct ContentView: View {
    var body: some View {
        VStack {
            TategakiText(text: """
メロスは激怒した。
必ず、かの邪智暴虐じゃちぼうぎゃくの王を除かなければならぬと決意した。
メロスには政治がわからぬ。
メロスは、村の牧人である。笛を吹き、羊と遊んで暮して来た。
""",
                         fontSize: 20)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
