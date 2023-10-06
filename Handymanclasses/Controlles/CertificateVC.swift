//
//  CertificateVC.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 09/10/23.
//

import UIKit
import PDFKit

class CertificateVC: BaseVC {
    
    lazy var certificateImgView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "c1")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var titleImgView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "titleImg")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var viewBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "viewBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(didTapViewBtn), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var cerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(CertificatesCell.self, forCellWithReuseIdentifier: CertificatesCell.id)
        
        return collectionView
    }()
    
    lazy var classTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "MASTER CLASSES"
        tf.textColor = #colorLiteral(red: 0.07602102309, green: 0.166934818, blue: 0.4153885245, alpha: 1)
        tf.textAlignment = .center
        tf.font = UIFont(name: "IstokWeb-Bold", size: 16)
        tf.layer.cornerRadius = 7
        tf.backgroundColor = .white
        
        return tf
    }()
    
    lazy var visitTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "NUMBER OF VISITS"
        tf.textColor = #colorLiteral(red: 0.07602102309, green: 0.166934818, blue: 0.4153885245, alpha: 1)
        tf.textAlignment = .center
        tf.font = UIFont(name: "IstokWeb-Bold", size: 16)
        tf.layer.cornerRadius = 7
        tf.backgroundColor = .white
        
        return tf
    }()
    
    lazy var commentTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Commentary".uppercased()
        tf.textColor = #colorLiteral(red: 0.07602102309, green: 0.166934818, blue: 0.4153885245, alpha: 1)
        tf.textAlignment = .center
        tf.font = UIFont(name: "IstokWeb-Bold", size: 16)
        tf.layer.cornerRadius = 7
        tf.backgroundColor = .white
        
        return tf
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 15
        stack.backgroundColor = .clear
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    let data  = CertificatesData()
    public var documentData: Data?
    
    
}



//MARK: lifecycle
extension CertificateVC{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseBGImg.image = UIImage(named: "baseBlurBg")
        setupCertificateUI()
    }
    
    
}



//MARK: collectionView delegate + data source
extension CertificateVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CertificatesCell.id, for: indexPath) as! CertificatesCell
        cell.initItems(img: data.getCertificates(index: indexPath.item).large)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-40)/5, height: 100)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        certificateImgView.image = UIImage(named: data.getCertificates(index: indexPath.item).small)
    }
    
    
}



//MARK: functions
extension CertificateVC{
    
    
    @objc func didTapViewBtn(){
        guard let className = classTF.text, !className.isEmpty else {
            showEmptyAlert()
            return
        }
        
        guard let visitNumber = visitTF.text, !visitNumber.isEmpty else {
            showEmptyAlert()
            return
        }
        
        guard let comment = commentTF.text, !comment.isEmpty else {
            showEmptyAlert()
            return
        }
        
        savedSound()
        let vc =  PDFPreviewViewController()
        vc.classTitle = className
        vc.visit = visitNumber
        vc.comment = comment
        vc.img = certificateImgView.image ?? UIImage(named: "cc2")!
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true) {
            self.visitTF.text = ""
            self.classTF.text = ""
            self.commentTF.text = ""
        }
    }
    
    
    func showEmptyAlert(){
        let alert = UIAlertController(title: "Warning", message: "Please enter all data for create certificate", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
}



//MARK: UI
extension CertificateVC{
    
    
    fileprivate func setupCertificateUI(){
        baseBGImg.isHidden = true
        view.backgroundColor = #colorLiteral(red: 0.84677881, green: 0.9320825338, blue: 1, alpha: 1)
        certificateImgConst()
        viewBtnConst()
        certificatesCollectionViewConst()
        titleImgConst()
        stackViewConst()
    }
    
    
    fileprivate func certificateImgConst(){
        view.addSubview(certificateImgView)
        certificateImgView.top(backBtn.bottomAnchor, 10)
        certificateImgView.right(view.rightAnchor, -15)
        certificateImgView.left(view.leftAnchor, 15)
        certificateImgView.bottom(view.centerYAnchor)
    }
    
    
    fileprivate func viewBtnConst(){
        view.addSubview(viewBtn)
        viewBtn.bottom(view.safeAreaLayoutGuide.bottomAnchor, -30)
        viewBtn.centerX(view.centerXAnchor)
        viewBtn.height(50)
        viewBtn.width(190)
    }
    
    
    fileprivate func certificatesCollectionViewConst(){
        view.addSubview(cerCollectionView)
        cerCollectionView.top(certificateImgView.bottomAnchor, 20)
        cerCollectionView.right(view.rightAnchor, -20)
        cerCollectionView.left(view.leftAnchor, 20)
        cerCollectionView.bottom(viewBtn.topAnchor, -10)
    }
    
    
    fileprivate func titleImgConst(){
        view.addSubview(titleImgView)
        titleImgView.top(certificateImgView.topAnchor, 40)
        if self.view.frame.height > 670 {
            titleImgView.right(certificateImgView.rightAnchor, -55)
            titleImgView.left(cerCollectionView.leftAnchor, 55)
        }else{
            titleImgView.right(certificateImgView.rightAnchor, -70)
            titleImgView.left(cerCollectionView.leftAnchor, 70)
        }
        titleImgView.height(40)
    }
    
    
    fileprivate func stackViewConst(){
        view.addSubview(stackView)
        stackView.addArrangedSubview(classTF)
        stackView.addArrangedSubview(visitTF)
        stackView.addArrangedSubview(commentTF)
        stackView.top(titleImgView.bottomAnchor, 20)
        stackView.right(titleImgView.rightAnchor)
        stackView.left(titleImgView.leftAnchor)
        stackView.bottom(certificateImgView.bottomAnchor, -20)
    }
    
    
}
