//
//  ViewController.swift
//  Chapter03-CSButton
//
//  Created by 공서은 on 2022/05/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let frame = CGRect(x: 30, y: 150, width: 150, height: 30)
        let csBtn = CSButton(frame: frame)
        self.view.addSubview(csBtn)
        
        // 인자값에 따라 다른 스타일로 결정돠는 버튼 1
        let rectBtn = CSButton(type: .rect)
        rectBtn.frame = CGRect(x: 30,y: 300, width: 150, height: 30)
        self.view.addSubview(rectBtn)
        
        // 인자값에 따라 다른 스타일로 결정돠는 버튼 2
        let circleBtn = CSButton(type: .circle)
        circleBtn.frame = CGRect(x: 200, y: 300, width: 150, height: 30)
        self.view.addSubview(circleBtn)
        
        //circleBtn.style = .rect // 타원 형태로 정의된 버튼의 스타일을 다시 사각형으로 설정
    }
    


}

