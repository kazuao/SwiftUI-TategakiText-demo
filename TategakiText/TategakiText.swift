//
//  TategakiText.swift
//  TategakiText
//
//  Created by kazunori.aoki on 2022/11/07.
//

import SwiftUI
import UIKit
import CoreText

struct TategakiText: UIViewRepresentable {
    typealias UIViewType = TategakiTextView

    var text: String?
    var fontSize: CGFloat = 20

    func makeUIView(context: Context) -> TategakiTextView {
        let uiView = TategakiTextView()
        uiView.isOpaque = false
        uiView.text = text
        uiView.fontSize = fontSize
        return uiView
    }

    func updateUIView(_ uiView: TategakiTextView, context: Context) {
        uiView.text = text
        uiView.fontSize = fontSize
    }
}

struct TategakiText_Previews: PreviewProvider {
    static var previews: some View {
        TategakiText(text:
"""
こんにちは、
わたしの名前はふじきです。
これはswiftuiで実装されています。
「どうやって実装してるのか」って？
それはQiitaの記事を読むとわかりますよ！
記事のリンクですか……
それは、ヒ・ミ・ツ ♡
"""
        )
        .padding(40)
    }
}

final class TategakiTextView: UIView {
    var text: String? = nil {
        didSet {
            ctFrame = nil
        }
    }
    var fontSize: CGFloat = 20

    private var ctFrame: CTFrame? = nil

    override func draw(_ rect: CGRect) {
        guard let context: CGContext = UIGraphicsGetCurrentContext() else { return }
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -rect.height)

        let baseAttributes: [NSAttributedString.Key: Any] = [
            .verticalGlyphForm: true,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize),
        ]

        let attributedText = NSMutableAttributedString(string: text ?? "", attributes: baseAttributes)
        let setter = CTFramesetterCreateWithAttributedString(attributedText)
            let path = CGPath(rect: rect, transform: nil)
        let frameAttrs = [
            kCTFrameProgressionAttributeName: CTFrameProgression.rightToLeft.rawValue,
        ]

        let ct = CTFramesetterCreateFrame(setter, CFRangeMake(0, 0), path, frameAttrs as CFDictionary)
        ctFrame = ct

        CTFrameDraw(ct, context)
    }
}
