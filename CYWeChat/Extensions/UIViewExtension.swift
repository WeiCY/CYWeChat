//
//  UIViewExtension.swift
//  MySwiftGithubDemo
//
//  Created by CityDoWCY on 2022/3/2.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: 属性
    var cy_x: CGFloat {
        get {
            return self.frame.origin.x
        }
        
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    var cy_y: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
        
    }
    
    var cy_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var cy_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    var cy_size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    var cy_cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
            guard self.layer.masksToBounds else {
                return
            }
            self.layer.masksToBounds = true
        }
    }
    
    var cy_borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        
        set {
            self.layer.borderWidth = newValue
            guard self.layer.masksToBounds else {
                return
            }
            self.layer.masksToBounds = true
        }
    }
    
    // MARK: 方法
    
    /// 指定方向设置圆角
    /// - Parameters:
    ///   - size: 圆角大小
    ///   - cornerType: 圆角方向
    func cy_makeCorner(size: CGSize?, cornerType: UIRectCorner) {
        guard let size = size else {
            return
        }
        
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: type, cornerRadii: size)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = bezierPath.cgPath
        self.layer.mask = maskLayer
    }
}
