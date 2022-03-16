//
//  TabBarViewController.swift
//  MySwiftGithubDemo
//
//  Created by CityDoWCY on 2022/2/23.
//

import UIKit

/// TabBar控制器
class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.customTabBar()
        self.setUpAllChildVC()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func customTabBar() {
        UITabBar.appearance().isTranslucent = false
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: TABBAR_NORMAL_COLOR,
                                                          NSAttributedString.Key.font: TABBAR_NORMAL_FONT], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: TABBAR_SELECT_COLOR,
                                                          NSAttributedString.Key.font: TABBAR_SELECT_FONT], for: .selected)
    }
    
    func setUpAllChildVC() {
        self.tabBarAddChildVC(vc: WeChatViewController.init(), title: "微信", originImageName: "tabbar_wechat_normal", selectImageName: "tabbar_wechat_select")
        self.tabBarAddChildVC(vc: DiscoverViewController.init(), title: "通讯录", originImageName: "tabbar_contacts_normal", selectImageName: "tabbar_contacts_select")
        self.tabBarAddChildVC(vc: DiscoverViewController.init(), title: "发现", originImageName: "tabbar_discover_normal", selectImageName: "tabbar_discover_select")
        self.tabBarAddChildVC(vc: MineViewController.init(), title: "我的", originImageName: "tabbar_mine_normal", selectImageName: "tabbar_mine_select")
    }
    
    func tabBarAddChildVC(vc: UIViewController, title: String, originImageName: String, selectImageName: String) {
        vc.navigationItem.title = title;
        vc.tabBarItem = UITabBarItem.init(title: title, image: UIImage.init(named: originImageName)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: selectImageName)?.withRenderingMode(.alwaysOriginal))
        let naviVC = BaseNavigationViewController.init(rootViewController: vc)
        self.addChild(naviVC)
    }

}
