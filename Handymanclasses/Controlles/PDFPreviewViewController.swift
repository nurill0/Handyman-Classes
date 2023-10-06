import UIKit
import PDFKit

class PDFPreviewViewController: BaseVC {
    
    var classTitle = ""
    var visit = ""
    var comment = ""
    var img = UIImage()
    var pdfView = PDFView()
    var isMenuOpened = false
    var pdfData: Data?
    
    
    lazy var menuBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "menuBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(didTapMenuBtn), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var optionsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.08550687879, green: 0.338368535, blue: 0.5536838174, alpha: 1)
        view.layer.cornerRadius = 12
        view.isHidden = true
        
        return view
    }()
    
    lazy var shareBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "share"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var downloadBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "download"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
        
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedSound()
        let data = PDFCreator(masetClassName: classTitle, visitNumberString: visit, commentSting: comment, cerImgName: img)
        pdfView.document = PDFDocument(data: data.createFlyer())
        pdfView.autoScales = true
        pdfData = data.createFlyer()
        setUpUI()
    }
    
    
}



extension PDFPreviewViewController {
    
    
    @objc func didTapShare(){
        savedSound()
        let vc = UIActivityViewController(activityItems: [pdfData as Any], applicationActivities: [])
        present(vc, animated: true, completion: nil)
    }
    
    
    @objc func didTapMenuBtn(){
        savedSound()
        isMenuOpened.toggle()
        if isMenuOpened {
            optionsView.isHidden = false
        }else{
            optionsView.isHidden = true
        }
    }
    
}

extension PDFPreviewViewController {
    
    
    fileprivate func setUpUI(){
        pdfViewConst()
        baseBGImg.isHidden = true
        view.backgroundColor = .white
        view.bringSubviewToFront(backBtn)
        menuBtnConst()
        optionsViewConst()
        shareBtnConst()
        downloadBtnConst()
    }
    
    
    fileprivate func pdfViewConst(){
        view.addSubview(pdfView)
        view.sendSubviewToBack(pdfView)
        pdfView.backgroundColor = .clear
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        pdfView.top(view.topAnchor)
        pdfView.bottom(view.bottomAnchor)
        pdfView.right(view.rightAnchor)
        pdfView.left(view.leftAnchor)
    }
    
    
    fileprivate func menuBtnConst(){
        view.addSubview(menuBtn)
        menuBtn.top(view.safeAreaLayoutGuide.topAnchor, 10)
        menuBtn.right(view.rightAnchor, -20)
        menuBtn.height(40)
        menuBtn.width(40)
    }
    
    
    fileprivate func optionsViewConst(){
        view.addSubview(optionsView)
        optionsView.top(backBtn.bottomAnchor, 50)
        optionsView.right(view.rightAnchor, -20)
        optionsView.left(view.leftAnchor, 20)
        optionsView.height(290)
    }
    
    
    fileprivate func shareBtnConst(){
        optionsView.addSubview(shareBtn)
        shareBtn.top(optionsView.topAnchor, 20)
        shareBtn.left(optionsView.leftAnchor, 15)
        shareBtn.right(optionsView.rightAnchor, -15)
        shareBtn.height(60)
    }
    
    
    fileprivate func downloadBtnConst(){
        optionsView.addSubview(downloadBtn)
        downloadBtn.top(shareBtn.bottomAnchor, 20)
        downloadBtn.left(optionsView.leftAnchor, 15)
        downloadBtn.right(optionsView.rightAnchor, -15)
        downloadBtn.height(60)
    }
    
}
