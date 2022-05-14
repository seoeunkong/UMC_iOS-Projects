//
//  RegisterViewController.swift
//  LoginProject
//
//  Created by 공서은 on 2022/03/29.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    
    var email:String = ""
    var name:String = ""
    var nickname:String = ""
    var password:String = ""
    
    var userInfo: ((UserInfo)->Void)?
    
    var isValidEmail = false{ //프로퍼티 옵져버
        didSet{
            self.validateUserInfo()
        }
    }
    
    var isValidName = false{ //프로퍼티 옵져버
        didSet{
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false{ //프로퍼티 옵져버
        didSet{
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false{ //프로퍼티 옵져버
        didSet{
            self.validateUserInfo()
        }
    }
    
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var popToLoginButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields:[UITextField]{
    [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextField()
        setupAttribute()
        
        //bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender:UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
            
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing TextField...")
        }
    }
    
    
    @IBAction func backButtonDIdTap(_ sender: UIBarButtonItem) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonDIdtap(_ sender: UIButton) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    // MARK: - Helpers
    private func setupTextField(){
        
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }

    }
    
    // 사용자가 입력한 회원정보를 확인하고 -> UI 업데이트
    private func validateUserInfo(){
        
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword{
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.init(red: 65/255, green: 147/255, blue: 239/255, alpha: 1.0)
                self.signupButton.isEnabled = true
            }
            
        }else{
            UIView.animate(withDuration: 0.33) {
                self.signupButton.isEnabled = false
                self.signupButton.backgroundColor = UIColor.init(red: 198/255, green: 222/255, blue: 250/255, alpha: 1.0)
            }
        }
    }
    
    private func setupAttribute(){
        //registerButton
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        //let color2 = UIColor.init(red: 65/255, green: 147/255, blue: 239/255, alpha: 1.0)
        let color2 = UIColor(named:"FacebookColor")!
        
        let attributes = generateButtonAttribute(self.popToLoginButton, texts: text1,text2, fonts: font1,font2, colors: color1,color2)
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }

}

extension String{
    //대문자, 소문자, 특수문자, 숫자 8자 이상일때 -> true
    func isValidPassword()->Bool{
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%%*?&]{8,}"
        let passwordVaildation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordVaildation.evaluate(with: self)
    }
    
    //@를 포함하는지 혹은 2글자 이상인지
    func isValidEmail()->Bool{
        let emailRegEx = "[A-Z0-9a-z,%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate.init(format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
}
