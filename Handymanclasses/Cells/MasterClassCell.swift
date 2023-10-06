//
//  MasterClassCell.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 09/10/23.
//

import UIKit

class MasterClassCell: UICollectionViewCell {
    
    static let id = "classCell"
    
    lazy var classImageVieew: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Carving")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupMasterClassCellUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initItems(img: String){
        self.classImageVieew.image = UIImage(named: img)
    }
    
    
}



//MARK: UI
extension MasterClassCell {
    
    
    fileprivate func setupMasterClassCellUI(){
        classImgViewwConst()
    }
    
    
    fileprivate func classImgViewwConst(){
        self.addSubview(classImageVieew)
        classImageVieew.top(self.topAnchor, 5)
        classImageVieew.bottom(self.bottomAnchor, -5)
        classImageVieew.right(self.rightAnchor, -5)
        classImageVieew.left(self.leftAnchor, 5)
    }
    
    
}
