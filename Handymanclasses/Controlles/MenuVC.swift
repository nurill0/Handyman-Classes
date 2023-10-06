//
//  MenuVC.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 06/10/23.
//

import UIKit

class MenuVC: BaseVC {
    
    lazy var masterClassBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "classBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tag = 1
        btn.addTarget(self, action: #selector(didtapButtons(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var settingsBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "settingsBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tag = 2
        btn.addTarget(self, action: #selector(didtapButtons(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var feedbackBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "feedbackBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tag = 3
        btn.addTarget(self, action: #selector(didtapButtons(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMenuVCUI()
    }
    
}



extension MenuVC {
    
    
    @objc func didtapButtons(sender: UIButton){
        playTapSound()
        var vc = UIViewController()
        switch sender.tag {
        case 1: vc = MasterClassVC()
        case 2: vc = SettingsVC()
        case 3: vc = FeedBackVC()
        default : vc = UIViewController()
        }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true)
    }
    
    
}



extension MenuVC {
    
    
    fileprivate func setUpMenuVCUI(){
        backBtn.isHidden = true
        masterClassBtnConst()
        settingsBtnConst()
        feedbackBtnConst()
    }
    
    
    fileprivate func masterClassBtnConst(){
        view.addSubview(masterClassBtn)
        masterClassBtn.bottom(view.centerYAnchor, -50)
        masterClassBtn.right(view.rightAnchor, -20)
        masterClassBtn.left(view.leftAnchor, 20)
        masterClassBtn.height(80)
    }
    
    
    fileprivate func settingsBtnConst(){
        view.addSubview(settingsBtn)
        settingsBtn.top(masterClassBtn.bottomAnchor, 20)
        settingsBtn.right(view.rightAnchor, -20)
        settingsBtn.left(view.leftAnchor, 20)
        settingsBtn.height(80)
    }
    
    
    fileprivate func feedbackBtnConst(){
        view.addSubview(feedbackBtn)
        feedbackBtn.top(settingsBtn.bottomAnchor, 20)
        feedbackBtn.right(view.rightAnchor, -20)
        feedbackBtn.left(view.leftAnchor, 20)
        feedbackBtn.height(80)
    }
    
}
