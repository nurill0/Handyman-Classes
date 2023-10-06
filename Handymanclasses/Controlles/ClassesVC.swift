//
//  ClassesVC.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 09/10/23.
//

import UIKit

class ClassesVC: BaseVC {
    
    lazy var frameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0.7176470588, green: 0.8784313725, blue: 1, alpha: 1)
        
        return view
    }()
    
    lazy var classImageVieew: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Carving")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var subFrameImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "subFrame")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var descLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 0, green: 0.3438251019, blue: 0.5637580752, alpha: 1)
        lbl.font = UIFont(name: "IstokWeb-Bold", size: 19)
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Back", for: .normal)
        btn.titleLabel?.font = UIFont(name: "IstokWeb-Bold", size: 19)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(goMasterClasses), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var signUpFirstBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "signUp"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tag = 1
        btn.addTarget(self, action: #selector(goSignUp(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var signUpSecondBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "signUp"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tag = 2
        btn.addTarget(self, action: #selector(goSignUp(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var signUpThirdBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "signUp"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tag = 3
        btn.addTarget(self, action: #selector(goSignUp(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var cerFirstBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "Certificate"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.tag = 4
        btn.addTarget(self, action: #selector(getCertificate(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var cerSecondBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "Certificate"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tag = 5
        btn.addTarget(self, action: #selector(getCertificate(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var cerThirdBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "Certificate"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tag = 6
        btn.addTarget(self, action: #selector(getCertificate(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    var className = ""
    let datas = FeedbackDatas()
    
}



//MARK: life cycle
extension ClassesVC{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClassesUI()
    }
    
    
}



//MARK: functions
extension ClassesVC{
    
    
    func initItems(index: Int){
        self.descLbl.text = datas.getDescriptions(index: index)
        self.classImageVieew.image = UIImage(named: datas.getItems(index: index))
        self.className = datas.getItems(index: index)
    }
    
    
    @objc func goMasterClasses(){
        playTapSound()
        dismiss(animated: true)
    }
    
    
    @objc func goSignUp(sender: UIButton) {
        playTapSound()
        var vc = SignUpVC()
        switch sender.tag {
        case 1: vc.initItems(visitnum: "1 VISIT", className: className)
        case 2: vc.initItems(visitnum: "2 VISIT", className: className)
        case 3: vc.initItems(visitnum: "3 VISIT", className: className)
        default: print("error")
        }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true)
    }
    
    
    @objc func getCertificate(sender: UIButton){
        playTapSound()
        let vc = CertificateVC()
        switch sender.tag {
        case 4: print("")
        case 5: print("")
        case 6: print("")
        default: print("error")
        }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true)
    }
    
    
}



//MARK: UI
extension ClassesVC {
    
    
    fileprivate func setupClassesUI(){
        baseBGImg.image = UIImage(named: "baseBlurBg")
        frameViewConst()
        classImgConst()
        backBtnConstt()
        subFrameImgVConst()
        desclblConst()
        firstCertifcateConst()
        firstSignUpConst()
        secondCertifcateConst()
        secondSignUpConst()
        thirdCertifcateConst()
        thirdSignUpConst()
    }
    
    
    fileprivate func frameViewConst(){
        view.addSubview(frameView)
        frameView.top(backBtn.bottomAnchor, 20)
        frameView.left(view.leftAnchor, 15)
        frameView.right(view.rightAnchor, -15)
        frameView.bottom(view.safeAreaLayoutGuide.bottomAnchor, -50)
    }
    
    
    fileprivate func classImgConst(){
        frameView.addSubview(classImageVieew)
        classImageVieew.top(frameView.topAnchor, 20)
        classImageVieew.centerX(frameView.centerXAnchor)
        classImageVieew.height(120)
        classImageVieew.width(180)
    }
    
    
    fileprivate func backBtnConstt(){
        frameView.addSubview(backButton)
        backButton.bottom(frameView.bottomAnchor, -10)
        backButton.centerX(frameView.centerXAnchor)
        backButton.height(25)
        backButton.width(100)
    }
    
    
    fileprivate func subFrameImgVConst(){
        view.addSubview(subFrameImageView)
        if view.frame.height < 670 {
            subFrameImageView.bottom(backButton.topAnchor, -25)
        }else{
            subFrameImageView.bottom(backButton.topAnchor, -40)
        }
        subFrameImageView.right(frameView.rightAnchor, -15)
        subFrameImageView.left(frameView.leftAnchor, 15)
        subFrameImageView.height(120)
    }
    
    
    fileprivate func desclblConst(){
        frameView.addSubview(descLbl)
        descLbl.top(classImageVieew.bottomAnchor, 5)
        descLbl.right(frameView.rightAnchor, -5)
        descLbl.left(frameView.leftAnchor, 5)
        descLbl.bottom(subFrameImageView.topAnchor, -5)
    }
    
    
    fileprivate func firstCertifcateConst(){
        view.addSubview(cerFirstBtn)
        cerFirstBtn.right(subFrameImageView.rightAnchor, -15)
        cerFirstBtn.top(subFrameImageView.topAnchor, -5)
        cerFirstBtn.height(25)
        cerFirstBtn.width(80)
    }
    
    
    fileprivate func firstSignUpConst(){
        view.addSubview(signUpFirstBtn)
        signUpFirstBtn.right(cerFirstBtn.leftAnchor, -10)
        signUpFirstBtn.centerY(cerFirstBtn.centerYAnchor)
        signUpFirstBtn.height(25)
        signUpFirstBtn.width(80)
    }
    
    
    fileprivate func secondCertifcateConst(){
        view.addSubview(cerSecondBtn)
        cerSecondBtn.right(cerFirstBtn.rightAnchor)
        cerSecondBtn.centerY(subFrameImageView.centerYAnchor)
        cerSecondBtn.height(25)
        cerSecondBtn.width(80)
    }
    
    
    fileprivate func secondSignUpConst(){
        view.addSubview(signUpSecondBtn)
        signUpSecondBtn.right(cerSecondBtn.leftAnchor, -10)
        signUpSecondBtn.centerY(cerSecondBtn.centerYAnchor)
        signUpSecondBtn.height(25)
        signUpSecondBtn.width(80)
    }
    
    
    fileprivate func thirdCertifcateConst(){
        view.addSubview(cerThirdBtn)
        cerThirdBtn.right(cerFirstBtn.rightAnchor)
        cerThirdBtn.bottom(subFrameImageView.bottomAnchor, 5)
        cerThirdBtn.height(25)
        cerThirdBtn.width(80)
    }
    
    
    fileprivate func thirdSignUpConst(){
        view.addSubview(signUpThirdBtn)
        signUpThirdBtn.right(cerThirdBtn.leftAnchor, -10)
        signUpThirdBtn.centerY(cerThirdBtn.centerYAnchor)
        signUpThirdBtn.height(25)
        signUpThirdBtn.width(80)
    }
    
    
}
