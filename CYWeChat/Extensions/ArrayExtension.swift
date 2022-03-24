//
//  ArrayExtension.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/24.
//

import UIKit

extension Array {
    // https://www.jianshu.com/p/082d5ca406f6
    // data[safe: 10]
    subscript (safe index: Int) -> Element? {
        return (0..<count).contains(index) ? self[index] : nil
    }
    
    func toJSonString() -> String {
        let data = try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        let strJson = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        return strJson! as String
    }
    
    func toData() -> Data {
        let data = try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        return data!
    }
}

extension Array where Element: Hashable {
    // 数组去重处理
    var uniqueArray:[Element] {
        var uniq = Set<Element>()
        uniq.reserveCapacity(self.count)
        return self.filter {
            return uniq.insert($0).inserted
        }
    }
}
