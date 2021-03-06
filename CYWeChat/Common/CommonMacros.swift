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

var k_APPDELEGATE = UIApplication.shared.delegate
var k_WINDOWSCENE = UIApplication.shared.connectedScenes.first as! UIWindowScene

/// 获取KeyWindow
/// - Returns: 返回KeyWindow
func getKeyWindow() -> UIWindow? {
    var keyWindow: UIWindow?
    if #available(iOS 13, *){
        var windowScene: UIWindowScene?
        
        for item in UIApplication.shared.connectedScenes {
            if let temp = item as? UIWindowScene{
                windowScene = temp
            }
        }
        
        guard let wScene = windowScene else { return keyWindow}
        
        for item in wScene.windows {
            if item.isKeyWindow{
                keyWindow = item
            }
        }
    }else{
        keyWindow = UIApplication.shared.keyWindow
    }
    
    return keyWindow
}


// MARK: - 尺寸信息
let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height

let NAVIBAR_HEIGH: CGFloat = 44.0

var NAVI_STATUSBAR_HEIGHT: CGFloat {
    get {
        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .map({ $0 as? UIWindowScene })
                .compactMap({ $0 })
                .first?.windows.first
            let statusBar = keyWindow?.windowScene?.statusBarManager?.statusBarFrame
            return statusBar?.size.height ?? 20.0
        } else {
            return UIApplication.shared.statusBarFrame.size.height
        }
    }
}

//let NAVI_STATUSBAR_HEIGHT: CGFloat = (UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height)!
//let StatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height

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

// MARK: - topVC
/// 获取当前屏幕最上面的VC
/// - Returns: VC
func getWindowTopVC() -> UIViewController?{
    var result: UIViewController?
    var rootVC: UIViewController?
    
    if let rVC = getKeyWindow()?.rootViewController{
        rootVC = rVC
    }
    
    while rootVC != nil {
        if let nav = rootVC as? UINavigationController{
            result = nav.visibleViewController
            rootVC = result?.presentedViewController
        }else if let tab = rootVC as? UITabBarController{
            result = tab.selectedViewController
            rootVC = result
        }else{
            result = rootVC
            rootVC = nil
        }
    }
    
    return result
}

// MARK: - 类名
func GET_CLASS_NAME(_ x: Any) -> String {
    String(describing: type(of: x))
}

// MARK: - 字体
// 字体
let TABBAR_SELECT_FONT: UIFont = UIFont.systemFont(ofSize: 12)
let TABBAR_NORMAL_FONT: UIFont = UIFont.systemFont(ofSize: 12)
let NAVIBAR_TITLE_FONT: UIFont = UIFont.boldSystemFont(ofSize: 18)


let CELL_TITLE_FONT: UIFont = UIFont.systemFont(ofSize: 16)
let CELL_SUBTITLE_FONT: UIFont = UIFont.systemFont(ofSize: 14)
let CELL_INFO_FONT: UIFont = UIFont.systemFont(ofSize: 12)
let BIG_TITLE_FONT: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)

// MARK:- 偏好设置存储
/// 应用是否首次启动
public let kAppLaunchUserDefaultsKey = "kAppLaunchUserDefaultsKey"
/// 应用当前语言设置
public let kAppLanguageUserDefaultsKey = "kAppLanguageUserDefaultsKey"
/// 用户基本信息
public let kUserInfoSaveUserDefaultsKey = "kUserInfoSaveUserDefaultsKey"
/// 用户名存储显示
public let kUserAccountSaveUserDefaultsKey = "kUserAccountSaveUserDefaultsKey"
/// 更换AppIcon
public let kChangedAppIocnUserDefaultsKey = "kChangedAppIocnUserDefaultsKey"
/// 白天夜间模式
public let kThemeSettingUserDefaultKey = "kThemeSettingUserDefaultKey"
