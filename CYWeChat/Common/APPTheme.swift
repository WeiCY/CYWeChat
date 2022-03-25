//
//  APPTheme.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/24.
//

import UIKit

/**
 APP的主题设置
 主要是深色浅色模式
 
 // 控件颜色
 方法一：
    使用系统提供的颜色(systemBackgroun、systemRed等)
 
 但是在日常开发中我们都是使用UI设计的颜色，和官方提供颜色不一致 就要使用下面的方法了
 方法二：
    添加新的Assets或使用原来的Assets，推荐使用新的 单独设置 如在本项目中我新建了一个Color的assets
    使用如下：UIColor.init(named: "CYViewBackColor")!
 方法三：
    使用代码生成 如项目中的中的TEXT_BLACK_COLOR
 
 // 图片、
 方法一：
    系统提供的图片 SF Symbols
 方法二：
    类似颜色设置 在Assets中添加不同模式下的图片
 
 参考：https://www.jianshu.com/p/e6616e44cf60
 */

//let isDark = self.traitCollection.userInterfaceStyle == .dark


// 颜色
let THEME_COLOR: UIColor = UIColor{ traitCollection in
    if traitCollection.userInterfaceStyle == .light {
        return UIColor.hexColor(0x58BE6A)
    } else {
        return UIColor.hexColor(0x32A06A)
    }
}

let TABBAR_SELECT_COLOR = THEME_COLOR
let TABBAR_NORMAL_COLOR: UIColor = UIColor{ traitCollection in
    if traitCollection.userInterfaceStyle == .light {
        return UIColor.hexColor(0x1B1B1B)
    } else {
        return UIColor.hexColor(0x939393)
    }
}
let TABBAR_BACKGROUND_COLOR: UIColor = UIColor{ traitCollection in
    if traitCollection.userInterfaceStyle == .light {
        return UIColor.hexColor(0xF5F5F5)
    } else {
        return UIColor.hexColor(0x4B4B4B)
    }
}

let NAVIBAR_TITLE_COLOR: UIColor = UIColor{ traitCollection in
    if traitCollection.userInterfaceStyle == .light {
        return UIColor.hexColor(0x333333)
    } else {
        return UIColor.hexColor(0x888888)
    }
}
let NAVIBAR_BACKGROUND_COLOR: UIColor = TABBAR_BACKGROUND_COLOR
//let VIEW_BACK_COLOR: UIColor = UIColor.init(named: "CYViewBackColor")!
let VIEW_BACK_COLOR: UIColor = NAVIBAR_BACKGROUND_COLOR
let CELL_BACK_COLOR: UIColor = UIColor{ traitCollection in
    if traitCollection.userInterfaceStyle == .light {
        return UIColor.hexColor(0xFFFFFF)
    } else {
        return UIColor.hexColor(0x333333)
    }
}

let TEXT_BLACK_COLOR: UIColor = UIColor.init{ traitCollection in
    if traitCollection.userInterfaceStyle == .light {
        return UIColor.hexColor(0x333333)
    } else {
        return UIColor.hexColor(0x888888)
    }
}

let TEXT_GREY_COLOR: UIColor = UIColor{ traitCollection in
    if traitCollection.userInterfaceStyle == .light {
        return UIColor.hexColor(0x666666)
    } else {
        return UIColor.hexColor(0x777777)
    }
}

let TEXT_LIGHTGREY_COLOR: UIColor = UIColor{ traitCollection in
    if traitCollection.userInterfaceStyle == .light {
        return UIColor.hexColor(0x999999)
    } else {
        return UIColor.hexColor(0x888888)
    }
}

let NOTE_RED_COLOR: UIColor = UIColor{ traitCollection in
    if traitCollection.userInterfaceStyle == .light {
        return UIColor.hexColor(0xE75E58)
    } else {
        return UIColor.hexColor(0xC86458)
    }
}

