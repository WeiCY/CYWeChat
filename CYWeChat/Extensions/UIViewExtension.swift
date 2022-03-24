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
    
    // MARK: frame
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
    
    // MARK: layer
    var cy_cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
//            guard self.layer.masksToBounds else {
//                return
//            }
            self.layer.masksToBounds = true
        }
    }
    
    var cy_borderColor: CGColor {
        get {
            return self.layer.borderColor!
        }
        
        set {
            self.layer.borderColor = newValue
//            guard self.layer.masksToBounds else {
//                return
//            }
            self.layer.masksToBounds = true
        }
    }
    
    var cy_borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        
        set {
            self.layer.borderWidth = newValue
//            guard self.layer.masksToBounds else {
//                return
//            }
            self.layer.masksToBounds = true
        }
    }
    
 // TODO: 添加badge 两种。一种是无数字右上角添加圆角。一种是数字 超过99显示99+，最小为1
    // MARK: badge
//    var numBadge: Int {
//        set {
//
//        }
//    }
    
    // MARK: 方法
    
    /// 指定方向设置圆角
    /// - Parameters:
    ///   - size: 圆角大小
    ///   - cornerType: 圆角方向
    func cy_makeCorner(size: CGSize?, cornerType: UIRectCorner) {
        guard let size = size else {
            return
        }
        let bezierPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: cornerType, cornerRadii: size)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = bezierPath.cgPath
        self.layer.mask = maskLayer
    }
}
