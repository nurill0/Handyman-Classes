//
//  FeedbackCell.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 06/10/23.
//

import UIKit

class FeedbackCell: UITableViewCell {
    
    static let id = "feedbackCell"
    
    lazy var iconImgV: UIImageView = {
        let img = UIImageView()
        img.image =  UIImage(named: "skillIcon")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = ""
        lbl.textAlignment = .left
        lbl.textColor = #colorLiteral(red: 0, green: 0.3438251019, blue: 0.5637580752, alpha: 1)
        lbl.font = UIFont(name: "IstokWeb-Bold", size: 18)
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    let datas = FeedbackDatas()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func initItems(index: Int){
        titleLbl.text = datas.getItems(index: index).uppercased()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        setupCellUI()
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}



extension FeedbackCell {
    
    
    fileprivate func setupCellUI(){
        iconImgConst()
        titleLblConst()
    }
    
    
    fileprivate func iconImgConst(){
        self.addSubview(iconImgV)
        iconImgV.left(self.leftAnchor, 10)
        iconImgV.centerY(self.centerYAnchor)
        iconImgV.height(30)
        iconImgV.width(30)
    }
    
    
    fileprivate func titleLblConst(){
        self.addSubview(titleLbl)
        titleLbl.centerY(self.centerYAnchor)
        titleLbl.left(iconImgV.rightAnchor, 20)
        titleLbl.right(self.rightAnchor, -10)
    }
    
    
}

