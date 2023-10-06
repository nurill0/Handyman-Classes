//
//  MasterClassVC.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 09/10/23.
//

import UIKit

class MasterClassVC: BaseVC {
    
    lazy var classesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(MasterClassCell.self, forCellWithReuseIdentifier: MasterClassCell.id)
        
        return collectionView
    }()
    
    let datas = FeedbackDatas()
    
}



//MARK: life cycle
extension MasterClassVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMasterClassVCUI()
    }
    
    
}



//MARK: collectionView delegate + data source
extension MasterClassVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.getSize()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MasterClassCell.id, for: indexPath) as! MasterClassCell
        cell.initItems(img: datas.getItems(index: indexPath.item))
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-10)/2, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        playTapSound()
        let vc = ClassesVC()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        vc.initItems(index: indexPath.item)
        present(vc, animated: true)
    }
    
    
}



//MARK: UI
extension MasterClassVC {
    
    fileprivate func setupMasterClassVCUI(){
        baseBGImg.image = UIImage(named: "baseBlurBg")
        classesCollectionViewConst()
    }
    
    
    fileprivate func classesCollectionViewConst(){
        view.addSubview(classesCollectionView)
        classesCollectionView.top(backBtn.bottomAnchor, 10)
        classesCollectionView.right(view.rightAnchor, -10)
        classesCollectionView.left(view.leftAnchor, 10)
        classesCollectionView.bottom(view.safeAreaLayoutGuide.bottomAnchor, -5)
        
    }
    
    
}
