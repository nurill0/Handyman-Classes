//
//  SignUpVC.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 09/10/23.
//

import UIKit

class SignUpVC: BaseVC {
    
    var visitNumber = ""
    var classTitle = ""
    var isSaved: Bool?
    
    
    lazy var frameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0.7176470588, green: 0.8784313725, blue: 1, alpha: 1)
        
        return view
    }()
    
    lazy var doneBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "doneBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(didTapDone), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var usernameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = udManager.getNickName()
        tf.textColor = #colorLiteral(red: 0.07602102309, green: 0.166934818, blue: 0.4153885245, alpha: 1)
        tf.textAlignment = .center
        tf.font = UIFont(name: "IstokWeb-Bold", size: 20)
        tf.layer.cornerRadius = 7
        tf.backgroundColor = .white
        tf.isUserInteractionEnabled = false
        
        return tf
    }()
    
    lazy var classTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = classTitle
        tf.textColor = #colorLiteral(red: 0.07602102309, green: 0.166934818, blue: 0.4153885245, alpha: 1)
        tf.textAlignment = .center
        tf.font = UIFont(name: "IstokWeb-Bold", size: 20)
        tf.layer.cornerRadius = 7
        tf.backgroundColor = .white
        tf.isUserInteractionEnabled = false
        
        return tf
    }()
    
    lazy var visitTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = visitNumber
        tf.textColor = #colorLiteral(red: 0.07602102309, green: 0.166934818, blue: 0.4153885245, alpha: 1)
        tf.textAlignment = .center
        tf.font = UIFont(name: "IstokWeb-Bold", size: 20)
        tf.layer.cornerRadius = 7
        tf.backgroundColor = .white
        tf.isUserInteractionEnabled = false
        
        return tf
    }()
    
    lazy var emailTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "phone/ e-mail/ another".uppercased()
        tf.textColor = #colorLiteral(red: 0.07602102309, green: 0.166934818, blue: 0.4153885245, alpha: 1)
        tf.textAlignment = .center
        tf.font = UIFont(name: "IstokWeb-Bold", size: 20)
        tf.layer.cornerRadius = 7
        tf.backgroundColor = .white
        
        return tf
    }()
    
    lazy var nameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Your name"
        tf.textColor = #colorLiteral(red: 0.07602102309, green: 0.166934818, blue: 0.4153885245, alpha: 1)
        tf.textAlignment = .center
        tf.font = UIFont(name: "IstokWeb-Bold", size: 20)
        tf.layer.cornerRadius = 7
        tf.backgroundColor = .white
        
        return tf
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 15
        stack.backgroundColor = .clear
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    lazy var savedImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "savedData")
        img.contentMode = .scaleAspectFit
        img.isHidden = true
        
        return img
    }()
    
}



//MARK: lifecycle
extension SignUpVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isSaved = false
        setupSignUpUI()
    }
    
    
}



//MARK: functions
extension SignUpVC {
    
    
    @objc func didTapDone(){
        savedSound()
        if isSaved! {
            let presentingViewController = self.presentingViewController
            self.dismiss(animated: false, completion: {
                presentingViewController?.dismiss(animated: false, completion: {
                    self.isSaved = false
                })
            })
        }else{
            guard let email = emailTF.text, !email.isEmpty else {
                showAlert()
                return}
            guard let name = nameTF.text, !name.isEmpty else {
                showAlert()
                return}
            isSaved = true
            frameView.isHidden = true
            doneBtn.setImage(UIImage(named: "okayBtn"), for: .normal)
            savedImageView.isHidden = false
        }
    }
    
    
    func showAlert(){
        let alert = UIAlertController(title: "Warning", message: "Please enter all information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
    
    func initItems(visitnum: String, className: String){
        self.visitNumber = visitnum
        self.classTitle = className
    }
    
    
}



//MARK: ui
extension SignUpVC {
    
    
    fileprivate func setupSignUpUI(){
        baseBGImg.image = UIImage(named: "baseBlurBg")
        doneBtnCoonst()
        frameViewConst()
        stackViewConst()
        savedInfoConst()
    }
    
    
    fileprivate func savedInfoConst(){
        view.addSubview(savedImageView)
        savedImageView.top(backBtn.bottomAnchor, 30)
        savedImageView.right(view.rightAnchor, -20)
        savedImageView.left(view.leftAnchor, 20)
        savedImageView.bottom(doneBtn.topAnchor, -20)
    }
    
    
    fileprivate func frameViewConst(){
        view.addSubview(frameView)
        frameView.top(backBtn.bottomAnchor, 30)
        frameView.right(view.rightAnchor, -20)
        frameView.left(view.leftAnchor, 20)
        frameView.bottom(doneBtn.topAnchor, -20)
    }
    
    
    fileprivate func doneBtnCoonst(){
        view.addSubview(doneBtn)
        doneBtn.top(view.centerYAnchor, 150)
        doneBtn.centerX(view.centerXAnchor)
        doneBtn.height(50)
        doneBtn.width(180)
    }
    
    
    fileprivate func stackViewConst(){
        frameView.addSubview(stackView)
        stackView.addArrangedSubview(usernameTF)
        stackView.addArrangedSubview(classTF)
        stackView.addArrangedSubview(visitTF)
        stackView.addArrangedSubview(emailTF)
        stackView.addArrangedSubview(nameTF)
        stackView.top(frameView.topAnchor, 20)
        stackView.right(frameView.rightAnchor, -20)
        stackView.left(frameView.leftAnchor, 20)
        stackView.bottom(frameView.bottomAnchor, -20)
    }
    
    
}
