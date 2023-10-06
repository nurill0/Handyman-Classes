//
//  BaseVC.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 06/10/23.
//

import UIKit
import AVFoundation
var soundEnabled = true

class BaseVC: UIViewController {
    
    lazy var baseBGImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "baseBg")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "backBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(didTapBackBtn), for: .touchUpInside)
        
        return btn
    }()
    
    let udManager = UserDefaultsManager.shared
    var player = AVAudioPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBaseVCUI()
    }
    
    @objc func didTapBackBtn(){
        playTapSound()
        dismiss(animated: true)
    }
    
    
    
    func playTapSound() {
        if soundEnabled {
            let url = Bundle.main.url(forResource: "Tap button", withExtension: "mp3")
            player = try!AVAudioPlayer(contentsOf: url!)
            player.play()
        }else {
            let url = Bundle.main.url(forResource: "Tap button", withExtension: "mp3")
            player = try!AVAudioPlayer(contentsOf: url!)
        }
    }
    
    func savedSound(){
        let url = Bundle.main.url(forResource: "certificate", withExtension: "mp3")
        player = try!AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}



extension BaseVC {
    
    fileprivate func setUpBaseVCUI(){
        baseBgImgVConst()
        backBtnConst()
    }
    
    
    fileprivate func baseBgImgVConst(){
        view.addSubview(baseBGImg)
        baseBGImg.top(view.topAnchor)
        baseBGImg.right(view.rightAnchor)
        baseBGImg.left(view.leftAnchor)
        baseBGImg.bottom(view.bottomAnchor)
    }
    
    
    fileprivate func backBtnConst(){
        view.addSubview(backBtn)
        backBtn.top(view.safeAreaLayoutGuide.topAnchor, 10)
        backBtn.left(view.leftAnchor, 20)
        backBtn.height(40)
        backBtn.width(40)
    }
    
}
