//
//  RegistrationVC.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 06/10/23.
//

import UIKit
import AVFoundation


class RegistrationVC: UIViewController {
    
    lazy var bgImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "RegBg")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var infoLabel: UITextView = {
        let txtv = UITextView()
        txtv.translatesAutoresizingMaskIntoConstraints = false
        txtv.text = informationOfApp
        txtv.textAlignment = .center
        txtv.backgroundColor = .clear
        txtv.showsVerticalScrollIndicator = false
        txtv.textColor = .black
        txtv.isEditable = false
        txtv.font = UIFont(name: "IstokWeb-Bold", size: 20)
        
        return txtv
    }()
    
    lazy var nickNameBgImgV: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "nicknameBg")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var nickNameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont(name: "IstokWeb-Regular", size: 25)
        tf.placeholder = "nickname"
        tf.textColor = .white
        tf.backgroundColor = .clear
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(
            string: "nickname",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.6)]
        )
        tf.autocorrectionType = .no

        return tf
    }()
    
    lazy var continueBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "continueBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(didContinueBtnTap), for: .touchUpInside)
        
        return btn
    }()
    
    var player = AVAudioPlayer()
    let udManager = UserDefaultsManager.shared

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgSound()
        setUpRegistrationVCUI()
    }
    
    func bgSound(){
        let url = Bundle.main.url(forResource: "BG app", withExtension: "mp3")
        player = try!AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
 
    @objc func didContinueBtnTap(){
        guard let txt = nickNameTF.text, !txt.isEmpty else {
            let alert = UIAlertController(title: "Warning", message: "Please enter your nickname", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alert, animated: true)
            return
        }
        let vc = MenuVC()
        udManager.saveNickName(nickName: txt)
        playTapSound()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle =  .flipHorizontal
        present(vc, animated: true) { [self] in
            let url = Bundle.main.url(forResource: "BG app", withExtension: "mp3")
            player = try!AVAudioPlayer(contentsOf: url!)
            player.stop()
        }
    }
    
    
    func playTapSound() {
        let url = Bundle.main.url(forResource: "Tap button", withExtension: "mp3")
        player = try!AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
}


extension RegistrationVC {
    
    fileprivate func setUpRegistrationVCUI(){
        bgImageViewConst()
        continueBtnConst()
        nicknameBgImgConst()
        nicknameTFConst()
        informationLblConst()
    }
    
    
    fileprivate func bgImageViewConst(){
        view.addSubview(bgImage)
        bgImage.top(view.topAnchor)
        bgImage.bottom(view.bottomAnchor)
        bgImage.left(view.leftAnchor)
        bgImage.right(view.rightAnchor)
    }
    
    
    fileprivate func continueBtnConst(){
        view.addSubview(continueBtn)
        continueBtn.bottom(view.safeAreaLayoutGuide.bottomAnchor, -10)
        continueBtn.centerX(view.centerXAnchor)
        continueBtn.height(60)
        continueBtn.width(250)
    }
    
    
    fileprivate func nicknameBgImgConst(){
        view.addSubview(nickNameBgImgV)
        nickNameBgImgV.bottom(continueBtn.topAnchor, -20)
        nickNameBgImgV.right(continueBtn.rightAnchor)
        nickNameBgImgV.left(continueBtn.leftAnchor)
        nickNameBgImgV.height(60)
    }
    
    
    fileprivate func nicknameTFConst(){
        view.addSubview(nickNameTF)
        nickNameTF.left(nickNameBgImgV.leftAnchor, 10)
        nickNameTF.right(nickNameBgImgV.rightAnchor, -10)
        nickNameTF.top(nickNameBgImgV.topAnchor)
        nickNameTF.bottom(nickNameBgImgV.bottomAnchor)
    }
    
    
    fileprivate func informationLblConst(){
        view.addSubview(infoLabel)
        infoLabel.top(view.safeAreaLayoutGuide.topAnchor, 10)
        infoLabel.right(view.rightAnchor, -10)
        infoLabel.left(view.leftAnchor, 10)
        infoLabel.bottom(nickNameTF.topAnchor, -10)
    }
    
}
