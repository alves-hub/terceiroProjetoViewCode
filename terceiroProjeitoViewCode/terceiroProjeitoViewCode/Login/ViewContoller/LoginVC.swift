//
//  ViewController.swift
//  terceiroProjeitoViewCode
//
//  Created by Jefferson Alves on 26/09/24.
//

import UIKit

class LoginVC: UIViewController {
    
    
    
    var loginScreen: LoginScreen?

    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)

    }
    
    
}

extension LoginVC: LoginScreenProtocol{
    func tappedLoginButton() {
        print("Pode comemorar pois passou na  VC tambem" )
        
// para chamar tela formato modal
//        let vc: HomeVC = HomeVC()
//        present(vc, animated: true)
        
// para trabalhar com telas NavigationController
// necessario alterar o SceneDelegate
        let vc: HomeVC = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

extension LoginVC: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.layer.borderColor = UIColor.red.cgColor
//        textField.layer.borderWidth = 1.0

        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let user: String = loginScreen?.userTextField.text ?? ""
        let password: String = loginScreen?.passwordTextField.text ?? ""
        
        
        if !user.isEmpty && !password.isEmpty {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
            loginScreen?.loginButtton.isEnabled = true
            loginScreen?.loginButtton.backgroundColor = .darkGray
            print("Botão Habilitado")
            
        }else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
            print("Botão Desabilitado")
            loginScreen?.loginButtton.isEnabled = false
            loginScreen?.loginButtton.backgroundColor?.withAlphaComponent(0.2)
            print(#function)

        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
    
        return true
    }
}
