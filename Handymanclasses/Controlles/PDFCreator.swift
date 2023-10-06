import Foundation
import PDFKit
import UIKit


class PDFCreator: NSObject{
    let masetClassName: String
    let visitNumberString: String
    let commentSting: String
    let cerImgName: UIImage
    
    init(masetClassName: String, visitNumberString: String, commentSting: String, cerImgName: UIImage) {
        self.masetClassName = masetClassName
        self.visitNumberString = visitNumberString
        self.commentSting = commentSting
        self.cerImgName = cerImgName
    }
    
    
    
    func createFlyer() -> Data {
        let pdfMetaData = [
            kCGPDFContextCreator: "Flyer Builder",
            kCGPDFContextAuthor: "raywenderlich.com"
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        let data = renderer.pdfData { (context) in
            context.beginPage()
            let attributes = [
                NSAttributedString.Key.font: UIFont(name: "IstokWeb-Bold", size: 25)
            ]
            let className = masetClassName.uppercased()
            let visit = visitNumberString.uppercased()
            let comment = commentSting.uppercased()
            
            let bgImage = cerImgName
            let titleImage = UIImage(named: "titleImg")
            let classLine = UIImage(named: "1")
            let visitLine = UIImage(named: "1")
            let commentLine = UIImage(named: "1")
            
            bgImage.draw(in: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight))
            titleImage?.draw(in: CGRect(x: 45, y: 70, width: pageWidth-80, height: 60))
            className.draw(at: CGPoint(x: pageWidth/2-Double(visit.count)-40, y: pageHeight/2-80), withAttributes: attributes as [NSAttributedString.Key : Any])
            classLine?.draw(in: CGRect(x: 45, y: pageHeight/2-65, width: pageWidth-80, height: 40))
            visit.draw(at: CGPoint(x: pageWidth/2-Double(visit.count)-40, y: pageHeight/2), withAttributes: attributes as [NSAttributedString.Key : Any])
            visitLine?.draw(in: CGRect(x: 45, y: pageHeight/2+15, width: pageWidth-80, height: 40))
            comment.draw(at: CGPoint(x: pageWidth/2-Double(visit.count)-40, y: pageHeight/2+80), withAttributes: attributes as [NSAttributedString.Key : Any])
            commentLine?.draw(in: CGRect(x: 45, y: pageHeight/2+95, width: pageWidth-80, height: 40))
        }
        return data
    }
    
    
}
