//
//  UIViewController+Extension.swift
//  LoginProject
//
//  Created by 공서은 on 2022/03/29.
//

import UIKit

extension UIViewController{
    func generateButtonAttribute(_ button:UIButton, texts:String..., fonts:UIFont..., colors:UIColor...) -> NSMutableAttributedString{
        
        //UiButton에 입력된 text를 가져온다.
        guard let wholeText = button.titleLabel?.text else { fatalError("버튼에 텍스트가 없음.")}
        
        //폰트
        let customFonts: [UIFont] = fonts
        
        //설정하고자 하는 string의 NSRanges
        let customTextRanges = texts.indices.map { index in
                                                 (wholeText as NSString).range(of:texts[index])
        }
        
        //설정하고자 하는 색상들
        let customColors = colors
        
        //attribute 객체를 생성한다.
        let attributeString = NSMutableAttributedString(string: wholeText)
        
        //텍스트에 맞는 설정을 추가한다.
        texts.indices.forEach{index in
            attributeString.addAttribute(.font, value: customFonts[index], range: customTextRanges[index])
            attributeString.addAttribute(.foregroundColor, value: customColors[index], range: customTextRanges[index])
        }
    return attributeString
}
    }
