//
//  SettingsVC.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 07/10/23.
//

import UIKit

class SettingsVC: BaseVC {
    
    lazy var feedbackFrameView: UIView = {
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
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(didTapDoneBtn), for: .touchUpInside)
        
        return btn
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
        tf.text = udManager.getNickName()
        tf.textColor = .gray
        tf.backgroundColor = .clear
        tf.textAlignment = .center
        tf.autocorrectionType = .no
        tf.isUserInteractionEnabled = false
        
        return tf
    }()
    
    lazy var editBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "editBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(didTapEditBtn), for: .touchUpInside)
        
        return btn
    }()
    
    
    lazy var soundOnBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "soundOn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tag = 1
        btn.addTarget(self, action: #selector(didTapSoundBtn(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var soundSettingBgImgV: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        if soundEnabled {
            img.image = UIImage(named: "on")
        }else {
            img.image = UIImage(named: "off")
        }
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var soundOffBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "soundOff"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(didTapSoundBtn(sender:)), for: .touchUpInside)
        btn.tag = 2
        
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSettingUI()
    }
    
    
}



//functions
extension SettingsVC {
    
    
    @objc func didTapSoundBtn(sender: UIButton){
        switch sender.tag {
        case 1:
            soundSettingBgImgV.image = UIImage(named: "on")
            udManager.setStatus(status: !udManager.getSoundStatus())
            soundEnabled = true
        case 2:
            soundSettingBgImgV.image = UIImage(named: "off")
            udManager.setStatus(status: !udManager.getSoundStatus())
            soundEnabled = false
        default: print("error of set sound")
        }
    }
    
    
    @objc func didTapDoneBtn(){
        dismiss(animated: true)
        guard let txt = nickNameTF.text, !txt.isEmpty else {return}
        udManager.saveNickName(nickName: txt)
        playTapSound()
    }
    
    
    @objc func didTapEditBtn(){
        nickNameTF.isUserInteractionEnabled = true
        nickNameTF.textColor = .white
    }
    
    
}



extension SettingsVC {
    
    
    fileprivate func setupSettingUI(){
        baseBGImg.image = UIImage(named: "baseBlurBg")
        feedBackFrameImgConst()
        doneBtnConst()
        nicknameBgImgConst()
        nicknameTFConst()
        editBtnConst()
        soundOnBtnConst()
        soundOffBtnConst()
        soundSettingImgConst()
    }
    
    
    fileprivate func feedBackFrameImgConst(){
        view.addSubview(feedbackFrameView)
        feedbackFrameView.top(backBtn.bottomAnchor, 60)
        feedbackFrameView.right(view.rightAnchor, -20)
        feedbackFrameView.left(view.leftAnchor, 20)
        feedbackFrameView.bottom(view.centerYAnchor, 60)
    }
    
    
    fileprivate func doneBtnConst(){
        view.addSubview(doneBtn)
        doneBtn.bottom(view.safeAreaLayoutGuide.bottomAnchor, -20)
        doneBtn.centerX(view.centerXAnchor)
        doneBtn.height(60)
        doneBtn.width(200)
    }
    
    
    fileprivate func nicknameBgImgConst(){
        feedbackFrameView.addSubview(nickNameBgImgV)
        nickNameBgImgV.top(feedbackFrameView.topAnchor, 50)
        nickNameBgImgV.centerX(view.centerXAnchor)
        nickNameBgImgV.height(60)
        nickNameBgImgV.width(210)
    }
    
    
    fileprivate func nicknameTFConst(){
        feedbackFrameView.addSubview(nickNameTF)
        nickNameTF.top(nickNameBgImgV.topAnchor, 5)
        nickNameTF.left(nickNameBgImgV.leftAnchor, 5)
        nickNameTF.bottom(nickNameBgImgV.bottomAnchor, -5)
        nickNameTF.right(nickNameBgImgV.rightAnchor, -5)
    }
    
    
    fileprivate func editBtnConst(){
        feedbackFrameView.addSubview(editBtn)
        editBtn.centerY(nickNameBgImgV.centerYAnchor)
        editBtn.left(nickNameBgImgV.rightAnchor, 20)
        editBtn.height(30)
        editBtn.width(30)
    }
    
    
    fileprivate func soundOnBtnConst(){
        feedbackFrameView.addSubview(soundOnBtn)
        soundOnBtn.top(nickNameBgImgV.bottomAnchor, 50)
        soundOnBtn.right(nickNameBgImgV.leftAnchor, -10)
        soundOnBtn.height(40)
        soundOnBtn.width(40)
    }
    
    
    fileprivate func soundSettingImgConst(){
        feedbackFrameView.addSubview(soundSettingBgImgV)
        soundSettingBgImgV.centerY(soundOnBtn.centerYAnchor)
        soundSettingBgImgV.height(40)
        soundSettingBgImgV.right(soundOffBtn.leftAnchor, -10)
        soundSettingBgImgV.left(soundOnBtn.rightAnchor, 10)
    }
    
    
    fileprivate func soundOffBtnConst(){
        feedbackFrameView.addSubview(soundOffBtn)
        soundOffBtn.top(soundOnBtn.topAnchor)
        soundOffBtn.left(nickNameBgImgV.rightAnchor, 10)
        soundOffBtn.height(40)
        soundOffBtn.width(40)
    }
    
    
}
