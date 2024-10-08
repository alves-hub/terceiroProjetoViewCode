//
//  LoginScreen.swift
//  terceiroProjeitoViewCode
//
//  Created by Jefferson Alves on 27/09/24.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
}

class LoginScreen: UIView {
    
    // WEAK: cria uma referencia fraca ao próprio objeto ( self ) dentro de uma closure. Essa abordagem é primordial para evitar vazamentos de memória que podem ocorrer devido a ciclos de referências fortes.
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?){
        self.delegate = delegate
    }
    

    
    // lazy:  denominacao para algo preguicoso : o elemento deixa de existir ate que ele seja invocado/executado.
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        
        return label
    }()
    
    
    lazy var userLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Usuário:"
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        
        return lb
    }()
    
    lazy var passwordLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Senha:"
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        
        return lb
    }()
    
    lazy var userTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite nome do usuário:"
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.autocorrectionType = .no
        tf.keyboardType = .emailAddress
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.black.cgColor
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8.0
        
        return tf
        
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf: UITextField = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua senha:"
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.autocorrectionType = .no
        tf.keyboardType = .decimalPad
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.black.cgColor
        tf.textColor = UIColor.black
        tf.isSecureTextEntry = true
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8.0
        
        return tf
        
    }()
    
    lazy var loginButtton: UIButton = {
        let bt: UIButton = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.isEnabled = false
        bt.backgroundColor = .clear
        bt.setTitle("Login", for:.normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        bt.setTitleColor(.white, for: .normal)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 8.0
        bt.backgroundColor = .darkGray.withAlphaComponent(0.2)
        bt.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return bt
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton){
        print("Esse ai passou!! Esse ai Passou!!!")
        
        delegate?.tappedLoginButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        
        addElement()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
  
    
    private func addElement(){
        addSubview(loginLabel)
        addSubview(userLabel)
        addSubview(passwordLabel)
        addSubview(userTextField)
        addSubview(passwordTextField)
        addSubview(loginButtton)
    }
    
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            //Title
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            //Label User
            userLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 70),
            userLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            // textField User
            userTextField.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 10),
            userTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            userTextField.heightAnchor.constraint(equalToConstant: 45),
            //Label Password
            passwordLabel.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            // textField Password
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalTo: userTextField.heightAnchor),
            //Button Login
            loginButtton.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 150),
            loginButtton.leadingAnchor.constraint(equalTo: userTextField.leadingAnchor),
            loginButtton.trailingAnchor.constraint(equalTo: userTextField.trailingAnchor),
            loginButtton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    // criando contrato protocol textField
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        userTextField.delegate = delegate
        passwordTextField.delegate = delegate
            
        
    }
}
