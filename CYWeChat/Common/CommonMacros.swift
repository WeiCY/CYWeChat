//
//  CommonMacros.swift
//  MySwiftGithubDemo
//
//  Created by CityDoWCY on 2022/3/2.
//

import Foundation
import UIKit

// MARK: - 设备信息
let SYSYEM_VERSION: String = UIDevice.current.systemVersion
let APP_VERSION: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
let DEVICE_IS_IPHONE: Bool = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? true : false)
let DEVICE_IS_IPAD: Bool = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? true : false)

let k_APPDELEGATE = UIApplication.shared.delegate

// MARK: - 尺寸信息
let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height

let NAVIBAR_HEIGH: CGFloat = 44.0
let NAVI_STATUSBAR_HEIGHT: CGFloat = (UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height)!
let SAFE_AREA_TOP_HEIGHT: CGFloat = NAVIBAR_HEIGH + NAVI_STATUSBAR_HEIGHT
let SAFE_AREA_BOTTOM_HEIGHT: CGFloat = (NAVI_STATUSBAR_HEIGHT > 20.0 ? 34.0 : 0.0)
let TABBAR_HEIGHT: CGFloat = SAFE_AREA_BOTTOM_HEIGHT + 49.0

// MARK: - 适配
let k_Screen_Ratio: CGFloat = (SCREEN_WIDTH/375.0)
func AdaptWidth(x: CGFloat) -> CGFloat {
    return x * k_Screen_Ratio
}

// MARK: - 主题
// 颜色
let THEME_COLOR: UIColor = UIColor.init(0x333333)
let TABBAR_SELECT_COLOR = THEME_COLOR
let TABBAR_NORMAL_COLOR: UIColor = UIColor.darkGray
let NAVIBAR_TITLE_COLOR: UIColor = UIColor.init(0x333333)

let VIEW_BACK_COLOR: UIColor = UIColor.white

// 字体
let TABBAR_SELECT_FONT: UIFont = UIFont.systemFont(ofSize: 14)
let TABBAR_NORMAL_FONT: UIFont = UIFont.systemFont(ofSize: 14)
let NAVIBAR_TITLE_FONT: UIFont = UIFont.boldSystemFont(ofSize: 18)


