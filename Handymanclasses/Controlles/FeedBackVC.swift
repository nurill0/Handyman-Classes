//
//  FeedBackVC.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 06/10/23.
//

import UIKit

class FeedBackVC: BaseVC {
    
    lazy var informationFeedbackImgView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "informationFeedback")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.register(FeedbackCell.self, forCellReuseIdentifier: FeedbackCell.id)
        table.estimatedRowHeight = 100
        
        return table
    }()
    
    lazy var anotherBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "anotherBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(didTapAnotherBtn), for: .touchUpInside)
        
        return btn
    }()
    
    let feedbackData = FeedbackDatas()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFeedBackVC()
    }
    
    
}


extension FeedBackVC{
    
    
    @objc func didTapAnotherBtn(){
        playTapSound()
        let vc = AddFeedbackVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        vc.classNameTV.text = "unknown class"
        present(vc, animated: true)
    }
    
    
}



extension FeedBackVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedbackData.getSize()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedbackCell.id, for: indexPath) as! FeedbackCell
        cell.initItems(index: indexPath.row)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AddFeedbackVC()
        playTapSound()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        vc.classNameTV.text = feedbackData.getItems(index: indexPath.row).uppercased()
        present(vc, animated: true)
    }
    
    
}


extension FeedBackVC {
    
    
    fileprivate func setUpFeedBackVC(){
        baseBGImg.image = UIImage(named: "baseBlurBg")
        informationFeedBackImgConst()
        anotherBtnConst()
        tableViewConst()
    }
    
    
    fileprivate func informationFeedBackImgConst(){
        view.addSubview(informationFeedbackImgView)
        informationFeedbackImgView.top(backBtn.bottomAnchor, 20)
        informationFeedbackImgView.right(view.rightAnchor, -20)
        informationFeedbackImgView.left(view.leftAnchor, 20)
        informationFeedbackImgView.height(70)
    }
    
    
    fileprivate func anotherBtnConst(){
        view.addSubview(anotherBtn)
        anotherBtn.bottom(view.safeAreaLayoutGuide.bottomAnchor, -10)
        anotherBtn.centerX(view.centerXAnchor)
        anotherBtn.height(60)
        anotherBtn.width(200)
    }
    
    
    fileprivate func tableViewConst(){
        view.addSubview(tableView)
        tableView.top(informationFeedbackImgView.bottomAnchor, 20)
        tableView.right(view.rightAnchor, -10)
        tableView.left(view.leftAnchor, 10)
        tableView.bottom(anotherBtn.topAnchor, -10)
    }
    
}
