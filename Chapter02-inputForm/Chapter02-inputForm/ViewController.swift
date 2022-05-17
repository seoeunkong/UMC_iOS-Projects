//
//  ViewController.swift
//  Chapter02-inputForm
//
//  Created by 공서은 on 2022/04/09.
//

import UIKit

class ViewController: UIViewController {
    var paramEmail: UITextField! // 이메일 입력 필드
    var paramUpdate: UISwitch! // 스위치 객체
    var paramInterval: UIStepper! // 스테퍼
    var txtUpdate: UILabel! // 스위치 컨트롤의 값을 표현할 레아블
    var txtInterval: UILabel! // 스테퍼 컨트롤의 값을 표현할 레아블

    
    override func viewDidLoad() {
        
        
        // 1. 내비게이션 바 타아틀을 입력한다.
        self.navigationItem.title = "설정"
        
        // 2. 이메일 레이블을 생성하고 영역과 가본 문구를 설정的匕
        let IblEmail = UILabel()
        IblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        IblEmail.text = "이메일"

        // 3. 레아블의 폰트를 설정한다.
        IblEmail.font = UIFont.systemFont(ofSize: 14)
        

        // 4. 레아블을 루트 뷰에 추가한다.
        self.view.addSubview(IblEmail)
        
        // 자동갱신 레아블을 생성하고 루트 뷰에 추가한다.
        let IblUpdate = UILabel()
        IblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        IblUpdate.text = "자동갱신"
        IblUpdate.font = UIFont.systemFont(ofSize: 14)
        
        self.view.addSubview(IblUpdate)
        
        // 갱신주기 레아블을 생성하고 루트 뷰에 추가한다.
        let Ibllnterval = UILabel()
        Ibllnterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        Ibllnterval.text = "갱신주기"
        Ibllnterval.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(Ibllnterval)
        
        // 이메일 입력을 위한 텍스트 필드를 추가한다.
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = .roundedRect
        self.view.addSubview(self.paramEmail)
        
        // 스위치 객체를 생성핸다.
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        // 스위치가 On 되어 있는 상태를 가본값으로 설정한다. self.paramllpdate.setOn(true, animated: true)
        self.view.addSubview( self.paramUpdate)
        
        // 갱신주가를 위한 스테파를 추가한다.
        self.paramInterval = UIStepper()
        
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0 // 1. 스테퍼가 가질 수 있는 촤소값
        self.paramInterval.maximumValue = 100 // 2. 스테퍼가 가질 수 있는 최대값
        self.paramInterval.stepValue = 1 // 3. 스테퍼의 값 변경 단위
        self.paramInterval.value = 0 // 4. 초기값 설정
        self.view.addSubview(self.paramInterval)
        
        // 스위치 객체의 값을 표현할 레아블을 추가한다.
        self.txtUpdate = UILabel()
        
        self.txtUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red // 1. 텍스트의 색상 설정
        self.txtUpdate.text = "갱신함" // 2. ”갱신함 or ”갱신하지 않음“
        
        self.view.addSubview(self.txtUpdate)
        
        
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "0분마다"
        self.view.addSubview(self.txtInterval)
        
        // 스위치와 스테퍼 컨트롤의 Value Changed 이벤트를 각각 액션 메소드에 연결한다.
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        // 잔송 버튼을 내비게이션 아이템에 추가하고, submit 메소드에 연결한다.
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submitBtn
        
        for family: String in UIFont.familyNames { print(family)
            for names: String in UIFont.fontNames(forFamilyName: family) {
                print("==\(names)")
                
            }
            
        }

        
        let customFont = UIFont(name: "GrapeNuts", size: 12)
        IblEmail.font = customFont

        
        
    }
    
    // 스위치와 싱호반응할 액션 메소드
    @objc func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpdate.text = (sender.isOn == true ? "갱신함" : "갱신하지 않음")
    }
    
    // 스테퍼와 싱호반응할 액션 메소드
    @objc func presentIntervalValue(_ sender: UIStepper) {
    self.txtInterval.text = ("\( Int(sender.value)) 분마다")
        }
    
    // 잔송 버튼과 상호반응할 액션 메소드
    @objc func submit(_ sender: Any) {
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        self.navigationController?.pushViewController(rvc, animated:true)

}

}
