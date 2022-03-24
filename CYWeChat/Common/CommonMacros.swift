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

let DEVICE_IS_IPHONE: Bool = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? true : false)
let DEVICE_IS_IPAD: Bool = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? true : false)

let APP_VERSION: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
let APP_NAME: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String

let k_APPDELEGATE = UIApplication.shared.delegate

// MARK: - 尺寸信息
let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height

let NAVIBAR_HEIGH: CGFloat = 44.0
let NAVI_STATUSBAR_HEIGHT: CGFloat = (UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height)!
let SAFE_AREA_TOP_HEIGHT: CGFloat = NAVIBAR_HEIGH + NAVI_STATUSBAR_HEIGHT
let SAFE_AREA_BOTTOM_HEIGHT: CGFloat = (NAVI_STATUSBAR_HEIGHT > 20.0 ? 34.0 : 0.0)
let TABBAR_HEIGHT: CGFloat = SAFE_AREA_BOTTOM_HEIGHT + 49.0

// MARK:- 自定义打印日志
func printLog<T>(_ message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    //文件名、方法、行号、打印信息
    #if DEBUG
    print("方法:\(methodName)\n行号:\(lineNumber)\n打印信息:\(message)");
    #endif
}

// MARK: - 适配
let k_Screen_Ratio: CGFloat = (SCREEN_WIDTH/375.0)
func AdaptWidth(x: CGFloat) -> CGFloat {
    return x * k_Screen_Ratio
}

// MARK: - UDID
let k_UUID = { () -> String in
    if let uuid = UIDevice.current.identifierForVendor?.uuidString {
        return uuid
    }
    return ""
}

// MARK: - 类名
func GET_CLASS_NAME(_ x: Any) -> String {
    String(describing: type(of: x))
}

// MARK: - 主题
// 颜色
let THEME_COLOR: UIColor = UIColor.init(0x58BE6A)
let TABBAR_SELECT_COLOR = THEME_COLOR
let TABBAR_NORMAL_COLOR: UIColor = UIColor.hexColor(0x1B1B1B)
let TABBAR_BACKGROUND_COLOR: UIColor = UIColor.hexColor(0xF5F5F5)
let NAVIBAR_TITLE_COLOR: UIColor = UIColor.init(0x333333)
let NAVIBAR_BACKGROUND_COLOR: UIColor = UIColor.hexColor(0xEDEDED)

let VIEW_BACK_COLOR: UIColor = UIColor.init(0xEDEDED)
let TEXT_BLACK_COLOR: UIColor = UIColor.hexColor(0x333333)
let TEXT_GREY_COLOR: UIColor = UIColor.hexColor(0x666666)
let NOTE_RED_COLOR: UIColor = UIColor.hexColor(0xE75E58)

// 字体
let TABBAR_SELECT_FONT: UIFont = UIFont.systemFont(ofSize: 12)
let TABBAR_NORMAL_FONT: UIFont = UIFont.systemFont(ofSize: 12)
let NAVIBAR_TITLE_FONT: UIFont = UIFont.boldSystemFont(ofSize: 18)


let CELL_TITLE_FONT: UIFont = UIFont.systemFont(ofSize: 16)
let CELL_SUBTITLE_FONT: UIFont = UIFont.systemFont(ofSize: 14)
let BIG_TITLE_FONT: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
