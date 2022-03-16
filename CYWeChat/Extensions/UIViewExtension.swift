//
//  UIViewExtension.swift
//  MySwiftGithubDemo
//
//  Created by CityDoWCY on 2022/3/2.
//

import Foundation
import UIKit

extension UIView {
    var cy_x: CGFloat {
        return self.frame.origin.x
    }
    
    var cy_y: CGFloat {
        return self.frame.origin.y
    }
    
    var cy_width: CGFloat {
        return self.frame.size.width
    }
    
    var cy_height: CGFloat {
        return self.frame.size.height
    }
}
