//
//  LoginViewController.swift
//  LoginProject
//
//  Created by 공서은 on 2022/03/29.
//

import UIKit

class LoginViewController: UIViewController {

    var email = String()
    var password = String()
    var userInfo:UserInfo?
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        
        
        //뷰 그림자
        loginButton.layer.shadowColor = UIColor.black.cgColor // 색깔
        loginButton.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        loginButton.layer.shadowRadius = 5 // 반경
        loginButton.layer.shadowOpacity = 0.3 // alpha값
    }
    

    
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        
        //Optional
        //값이 있을 수도 있고 없을 수도 있음
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor = text.isValidEmail() ? UIColor.init(red: 65/255, green: 147/255, blue: 239/255, alpha: 1.0) : UIColor.init(red: 198/255, green: 222/255, blue: 250/255, alpha: 1.0)
        
        self.email = text
        
    }
    
    @IBAction func pwTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor = text.count>2 ? UIColor.init(red: 65/255, green: 147/255, blue: 239/255, alpha: 1.0) : UIColor.init(red: 198/255, green: 222/255, blue: 250/255, alpha: 1.0)
        
     
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        //회원가입정보를 전달받아서, 그것과 textField 데이터가 일치하면,
        //로그인을 해야함.
        guard let userInfo = self.userInfo else {return}
        if userInfo.email == self.email && userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            print("다음화면으로 이동")
        }else{
        }
        
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //화면전환
        // 1.스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 2. 뷰컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3. 화면전환 메소드를 이용해서 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        //ARC -> 강한참조/약한참조 -> ARC
        registerViewController.userInfo = {[weak self](userInfo) in self?.userInfo = userInfo
            
        }
    }
    
    private func setupAttribute(){
        //registerButton
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
       // let color2 = UIColor.init(red: 65/255, green: 147/255, blue: 239/255, alpha: 1.0)
        let color2 = UIColor(named: "FacebookColor")!

        
        let attributes = generateButtonAttribute(self.registerButton, texts: text1,text2, fonts: font1,font2, colors: color1,color2)
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}
