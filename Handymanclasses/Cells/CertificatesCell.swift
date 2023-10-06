//
//  CertificatesCell.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 11/10/23.
//

import UIKit



class CertificatesCell: UICollectionViewCell {
    
    static let id = "CertificatesCell"
    
    lazy var certificatesImgView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "cc1")
        img.contentMode = .scaleAspectFill
        
        
        return img
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupCertificatesCellUI()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initItems(img: String){
        self.certificatesImgView.image = UIImage(named: img)
    }
    
    
}



//MARK: UI
extension CertificatesCell {
    
    
    fileprivate func setupCertificatesCellUI(){
        certificatesImgConst()
    }
    
    
    fileprivate func certificatesImgConst(){
        self.addSubview(certificatesImgView)
        certificatesImgView.top(self.topAnchor, 10)
        certificatesImgView.bottom(self.bottomAnchor, -10)
        certificatesImgView.right(self.rightAnchor, -10)
        certificatesImgView.left(self.leftAnchor, 10)
    }
    
}
