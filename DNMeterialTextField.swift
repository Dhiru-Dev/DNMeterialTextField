//
//  DNMeterialTextField.swift
//  DNMeterialTextField
//
//  Created by Dhiru on 19/02/20.
//  Copyright © 2020 DDNSoftech pvt. ltd. All rights reserved.
//

import Foundation
import UIKit

//@IBDesignable
public class DNMeterialTextField:UITextField
{
    
    @IBInspectable public var cornerRadius:CGFloat =  10.0
    @IBInspectable public var activeBorderColor:UIColor = .orange
    @IBInspectable public var inactiveColor:UIColor = .darkGray
    @IBInspectable public var leftSideIcon:UIImage?
    
    private let leftIconWidth:CGFloat = 20.0;
    
    var imgleftSideIconView:UIImageView?
    
    // for padding
    @IBInspectable public var padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    
    
    // For Floating Lable
    var floatingLabel: UILabel!
    var placeHolderText: String!
    
    var isTextFiledActive = false
    
    var floatingLabelColor: UIColor = UIColor.blue {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
        }
    }
    
   public var floatingLabelFont: UIFont = UIFont.systemFont(ofSize: 15) {
        didSet {
            self.floatingLabel.font = floatingLabelFont
        }
    }
 public   var floatingLabelHeight: CGFloat = 30
    //New Custom drawing Vars
   public var leftSideFloatingLablePaddding:CGFloat = 20.0
    var mainBorderOutline:CAShapeLayer!
    var hiddenBorderOtline:CAShapeLayer!
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        addLeftSideIcons()
        addborderLayerOnView()
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        addLeftSideIcons()
        
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        addborderLayerOnView()
        //decideBorderStrokeColor()
    }
    
    
    
   open  func addborderLayerOnView()
    {
        
        self.layer.sublayers?.forEach { if $0.name == "dhiru_border_main" || $0.name == "dhiru_border_hidden"
        {$0.removeFromSuperlayer()} }
        
        let initialPoint = (leftSideFloatingLablePaddding + placeHolderText.dk_width(withConstrainedHeight: floatingLabelHeight, font:self.floatingLabelFont))
        
        let path = UIBezierPath()
        path.move(to:CGPoint(x:initialPoint,y:0))
        path.addLine(to:CGPoint(x: self.frame.size.width - cornerRadius, y: 0))
        // Corner Radius Right Top
        path.addQuadCurve(to: CGPoint(x: self.frame.size.width, y: cornerRadius), controlPoint: CGPoint(x: self.frame.size.width, y: 0))
        path.addLine(to:CGPoint(x: self.frame.size.width, y: self.frame.size.height - cornerRadius))
        
        // Corner Radius Right Bottom
        path.addQuadCurve(to: CGPoint(x: self.frame.size.width-cornerRadius, y: self.frame.size.height), controlPoint: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        path.addLine(to:CGPoint(x: cornerRadius, y: self.frame.size.height))
        // Corner Radius Left  Bottom
        path.addQuadCurve(to: CGPoint(x: 0, y: self.frame.size.height - cornerRadius), controlPoint: CGPoint(x: 0, y: self.frame.size.height))
        
        path.addLine(to:CGPoint(x: 0, y: cornerRadius))
        
        // Corner Radius Left  Top
        path.addQuadCurve(to: CGPoint(x: cornerRadius, y: 0), controlPoint: CGPoint(x: 0, y: 0))
        
        
        mainBorderOutline = CAShapeLayer()
        mainBorderOutline.name = "dhiru_border_main"
        mainBorderOutline.path = path.cgPath
        mainBorderOutline.fillColor = UIColor.clear.cgColor
        mainBorderOutline.lineCap = .round
        self.layer.addSublayer(mainBorderOutline)
        
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: cornerRadius, y:0))
        path2.addLine(to: CGPoint(x: initialPoint, y: 0))
        
        hiddenBorderOtline = CAShapeLayer()
        hiddenBorderOtline.name = "dhiru_border_hidden"
        hiddenBorderOtline.path = path2.cgPath
        hiddenBorderOtline.fillColor = UIColor.clear.cgColor
        hiddenBorderOtline.lineCap = .round  //kCALineCapRound
        self.layer.addSublayer(hiddenBorderOtline)
        
        decideBorderStrokeColor()
        
    }
    
    func addLeftSideIcons()
    {
        if let oldView = self.viewWithTag(9901){oldView.removeFromSuperview() }
        
        if let tintedImage = leftSideIcon?.withRenderingMode(.alwaysTemplate)
        {
            imgleftSideIconView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: leftIconWidth, height: leftIconWidth))
            imgleftSideIconView?.image = tintedImage
            imgleftSideIconView?.contentMode = .scaleAspectFit
            imgleftSideIconView?.backgroundColor = UIColor.clear
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            view.addSubview(imgleftSideIconView!)
            view.backgroundColor = .clear
            view.tag = 9901
            self.leftViewMode = .always
            self.leftView = view
        }else
        {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: leftSideFloatingLablePaddding, height: 40))
            view.backgroundColor = .clear
            view.tag = 9901
            self.leftViewMode = .always
            self.leftView = view
        }
    }
    
    func decideBorderStrokeColor()
    {
        if isTextFiledActive
        {
            // set ative border color
            mainBorderOutline.strokeColor = activeBorderColor.cgColor
            hiddenBorderOtline.strokeColor = UIColor.clear.cgColor
            imgleftSideIconView?.tintColor = activeBorderColor
        }else
        {
            imgleftSideIconView?.tintColor = inactiveColor
            if  (self.text?.isEmpty)!
            {
                mainBorderOutline.strokeColor = inactiveColor.cgColor
                hiddenBorderOtline.strokeColor = inactiveColor.cgColor
            }else
            {
                mainBorderOutline.strokeColor = inactiveColor.cgColor
                hiddenBorderOtline.strokeColor = UIColor.clear.cgColor
                
                self.floatingLabel.frame = CGRect(x: self.cornerRadius + 5.0, y: -self.floatingLabelHeight/2, width: (self.placeHolderText?.dk_width(withConstrainedHeight: self.floatingLabelHeight, font: self.floatingLabelFont))!, height: self.floatingLabelHeight)
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        let flotingLabelFrame = CGRect(x: 0, y: 0, width: (placeHolderText?.dk_width(withConstrainedHeight: self.floatingLabelHeight, font: self.floatingLabelFont)) ?? 0, height: 0)
        
        floatingLabel = UILabel(frame: flotingLabelFrame)
        floatingLabel.textColor = floatingLabelColor
        floatingLabel.font = floatingLabelFont
        floatingLabel.text = self.placeholder
        floatingLabel.textColor = activeBorderColor
        self.addSubview(floatingLabel)
        placeHolderText = placeholder
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidBeginEditing), name: UITextField.textDidBeginEditingNotification, object: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidEndEditing), name: UITextField.textDidEndEditingNotification, object: self)
        
        self.bringSubviewToFront(self.floatingLabel)
        
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        self.floatingLabel.textColor = activeBorderColor
        isTextFiledActive = true
        layoutSubviews()
        if self.text == "" {
            UIView.animate(withDuration: 0.3) {
                self.floatingLabel.frame = CGRect(x: self.cornerRadius + 5.0, y: -self.floatingLabelHeight/2, width: (self.placeHolderText?.dk_width(withConstrainedHeight: self.floatingLabelHeight, font: self.floatingLabelFont))!, height: self.floatingLabelHeight)
            }
            self.placeholder = ""
        }
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        self.floatingLabel.textColor = inactiveColor
        isTextFiledActive = false
        layoutSubviews()
        if self.text == "" {
            UIView.animate(withDuration: 0.2) {
                self.floatingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 0)
            }
            self.placeholder = placeHolderText
        }
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
        
    }
    
    
}

extension DNMeterialTextField
{
    //    override open func textRect(forBounds bounds: CGRect) -> CGRect {
    //        return bounds.inset(by: padding)
    //    }
    //
    //    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    //        return bounds.inset(by: padding)
    //    }
    //
    //    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    //        return bounds.inset(by: padding)
    //    }
}


extension String {
    func dk_height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func dk_width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
