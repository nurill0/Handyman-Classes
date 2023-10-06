//
//  AddFeedbackVC.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 07/10/23.
//

import UIKit
import Cosmos

class AddFeedbackVC: BaseVC, UITextViewDelegate {
    
    lazy var informationFeedbackImgView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "addFB")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    lazy var feedbackFrameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 0.7176470588, green: 0.8784313725, blue: 1, alpha: 1)
        
        return view
    }()
    
    lazy var sendBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "sendBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(didTapSendBtn), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var okayBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "okayBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(didTapOkayBtn), for: .touchUpInside)
        btn.isHidden = true
        
        return btn
    }()
    
    lazy var infoSavedImgView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "savedInfo")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.isHidden = true
        
        return img
    }()
    
    lazy var cosmosView: CosmosView = {
        let cosmos = CosmosView()
        cosmos.translatesAutoresizingMaskIntoConstraints = false
        cosmos.settings.totalStars = 5
        cosmos.settings.starSize = 30
        cosmos.settings.fillMode = .full
        cosmos.settings.filledImage = UIImage(named: "filledStar")
        cosmos.settings.emptyImage = UIImage(named: "emptyStar")
        
        return cosmos
    }()
    
    lazy var nicknameFrame: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "nicknameBg")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var nickNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "nickname"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "IstokWeb-Regular", size: 15)
        
        return lbl
    }()
    
    lazy var classNameTV: UITextView = {
        let txtv = UITextView()
        txtv.translatesAutoresizingMaskIntoConstraints = false
        txtv.text = informationOfApp
        txtv.textAlignment = .center
        txtv.backgroundColor = .white
        txtv.showsVerticalScrollIndicator = false
        txtv.textColor = .black
        txtv.isEditable = false
        txtv.font = UIFont(name: "IstokWeb-Bold", size: 15)
        txtv.layer.cornerRadius = 8
        
        return txtv
    }()
    
    lazy var feedbackLetterTV: UITextView = {
        let txtv = UITextView()
        txtv.translatesAutoresizingMaskIntoConstraints = false
        txtv.delegate = self
        txtv.textColor = .gray
        txtv.text = "Type your feedback here"
        txtv.textAlignment = .left
        txtv.showsVerticalScrollIndicator = false
        txtv.textColor = .black
        txtv.font = UIFont(name: "IstokWeb-Bold", size: 15)
        txtv.layer.cornerRadius = 8
        txtv.backgroundColor = .clear
        
        return txtv
    }()
    
    var classRating = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAddFeedBackVCUI()
    }
    
}



extension AddFeedbackVC {
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if !textView.text.isEmpty {
            textView.text = ""
            textView.textColor = .black
        }else{
            textView.textColor = .gray
            textView.text = "Type your feedback here"
        }
    }
    
    
    @objc func didTapSendBtn(){
        if feedbackLetterTV.text == "Type your feedback here" || feedbackLetterTV.text == "" {
            print("not saved")
            let alert = UIAlertController(title: "Warning", message: "Please enter your feedback", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alert, animated: true)
        }else{
            playTapSound()
            feedbackFrameView.isHidden = true
            cosmosView.isHidden = true
            sendBtn.isHidden = true
            okayBtn.isHidden = false
            infoSavedImgView.isHidden = false
        }
    }
    
    
    @objc func didTapOkayBtn(){
        playTapSound()
        let presentingViewController = self.presentingViewController
        self.dismiss(animated: false, completion: {
            presentingViewController?.dismiss(animated: false, completion: {})
        })
    }
    
    
}



//UI
extension AddFeedbackVC {
    
    
    fileprivate func setUpAddFeedBackVCUI(){
        baseBGImg.image = UIImage(named: "baseBlurBg")
        cosmosView.didTouchCosmos = { [self] rat in
            classRating =  Int(rat)
        }
        nickNameLbl.text = udManager.getNickName()
        informationFeedBackImgConst()
        sendBtnConst()
        okayBtnConst()
        cosmosViewConst()
        feedbackSavedImgConst()
        feedBackFrameImgConst()
        nickNameViewConst()
        nickNameLblConst()
        classTVConst()
        feedbackLetterConst()
    }
    
    
    fileprivate func informationFeedBackImgConst(){
        view.addSubview(informationFeedbackImgView)
        informationFeedbackImgView.top(backBtn.bottomAnchor, 20)
        informationFeedbackImgView.right(view.rightAnchor, -20)
        informationFeedbackImgView.left(view.leftAnchor, 20)
        informationFeedbackImgView.height(70)
    }
    
    
    fileprivate func sendBtnConst(){
        view.addSubview(sendBtn)
        sendBtn.bottom(view.safeAreaLayoutGuide.bottomAnchor, -20)
        sendBtn.centerX(view.centerXAnchor)
        sendBtn.height(60)
        sendBtn.width(200)
    }
    
    
    fileprivate func okayBtnConst(){
        view.addSubview(okayBtn)
        okayBtn.bottom(view.safeAreaLayoutGuide.bottomAnchor, -20)
        okayBtn.centerX(view.centerXAnchor)
        okayBtn.height(60)
        okayBtn.width(200)
    }
    
    
    fileprivate func cosmosViewConst(){
        view.addSubview(cosmosView)
        cosmosView.bottom(sendBtn.topAnchor, -30)
        cosmosView.centerX(view.centerXAnchor)
        cosmosView.height(60)
        
    }
    
    
    fileprivate func feedBackFrameImgConst(){
        view.addSubview(feedbackFrameView)
        feedbackFrameView.top(informationFeedbackImgView.bottomAnchor, 20)
        feedbackFrameView.right(view.rightAnchor, -20)
        feedbackFrameView.left(view.leftAnchor, 20)
        feedbackFrameView.bottom(cosmosView.topAnchor, -20)
    }
    
    
    fileprivate func feedbackSavedImgConst(){
        view.addSubview(infoSavedImgView)
        infoSavedImgView.top(informationFeedbackImgView.bottomAnchor, 20)
        infoSavedImgView.right(view.rightAnchor, -20)
        infoSavedImgView.left(view.leftAnchor, 20)
        infoSavedImgView.bottom(cosmosView.topAnchor, -20)
    }
    
    
    fileprivate func nickNameViewConst(){
        feedbackFrameView.addSubview(nicknameFrame)
        nicknameFrame.top(feedbackFrameView.topAnchor, 20)
        nicknameFrame.centerX(view.centerXAnchor)
        nicknameFrame.width(200)
        nicknameFrame.height(30)
    }
    
    
    fileprivate func nickNameLblConst(){
        nicknameFrame.addSubview(nickNameLbl)
        nickNameLbl.top(nicknameFrame.topAnchor, 5)
        nickNameLbl.bottom(nicknameFrame.bottomAnchor, -5)
        nickNameLbl.right(nicknameFrame.rightAnchor, -5)
        nickNameLbl.left(nicknameFrame.leftAnchor, 5)
    }
    
    
    fileprivate func classTVConst(){
        feedbackFrameView.addSubview(classNameTV)
        classNameTV.top(nicknameFrame.bottomAnchor, 20)
        classNameTV.right(feedbackFrameView.rightAnchor, -15)
        classNameTV.left(feedbackFrameView.leftAnchor, 15)
        classNameTV.height(50)
    }
    
    
    fileprivate func feedbackLetterConst(){
        feedbackFrameView.addSubview(feedbackLetterTV)
        feedbackLetterTV.top(classNameTV.bottomAnchor, 15)
        feedbackLetterTV.left(feedbackFrameView.leftAnchor, 15)
        feedbackLetterTV.right(feedbackFrameView.rightAnchor, -15)
        feedbackLetterTV.bottom(feedbackFrameView.bottomAnchor, -15)
    }
    
    
}
