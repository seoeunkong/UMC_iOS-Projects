//
//  ViewController.swift
//  Chapter02-Button
//
//  Created by 공서은 on 2022/04/09.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        
        // 버튼 객체를 생성하고, 속성을 설정한다.
        let btn = UIButton(type: .system) // 1
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30) // 2
        btn.setTitle("테스트 버튼", for: .normal) // 3
        
        //버튼을 수평 중앙 정렬한다.
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        
        //루트 뷰에 버튼을 추가한다.
        self.view.addSubview(btn)
        
        // 버튼의이벤트와메소드 btnOnClick(_:)을연결한다.
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
        
    }
    
    @objc func btnOnClick(_ sender: Any) { // 호출한 객체가 버튼이라면
    if let btn = sender as? UIButton {
    btn.setTitle("클릭되었습니다" , for: . normal)
        }
        
    }
        

    
}
