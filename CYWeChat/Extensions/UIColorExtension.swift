//
//  UIColorExtension.swift
//  MySwiftGithubDemo
//
//  Created by CityDoWCY on 2022/3/1.
//

import Foundation
import UIKit

extension UIColor {
    
    /// 16进制转化Color
    /// - Parameter hexValue: 16进制颜色
    /// - Returns: color
    class func hexColor(_ hexValue: Int) -> UIColor {
        return hexColor(hexValue, alphaValue: 1)
    }
    
    class func hexColor(_ hexValue: Int, alphaValue: Float) -> UIColor {
        return UIColor(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255, green: CGFloat((hexValue & 0x00FF00) >> 8) / 255, blue: CGFloat(hexValue & 0x0000FF) / 255, alpha: CGFloat(alphaValue))
    }
    
    convenience init(_ hexValue: Int, alphaValue: Float) {
        self.init(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255, green: CGFloat((hexValue & 0x00FF00) >> 8) / 255, blue: CGFloat(hexValue & 0x0000FF) / 255, alpha: CGFloat.init(alphaValue))
    }
    
    convenience init(_ hexValue: Int) {
        self.init(hexValue, alphaValue: 1)
    }
    
    class func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    
    class func RGBAColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a/1.0)
    }
    
    func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
}
