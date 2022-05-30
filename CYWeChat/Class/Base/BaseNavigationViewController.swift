//
//  BaseNavigationViewController.swift
//  MySwiftGithubDemo
//
//  Created by CityDoWCY on 2022/2/23.
//

import UIKit

/// 基础导航栏控制器
class BaseNavigationViewController: UINavigationController {

    lazy var backButton: UIButton = {
        let backBtn = UIButton.init(type: .custom)
        backBtn.setImage(UIImage.init(named: "commom_nav_back"), for: .normal)
        backBtn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 40)
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        return backBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        /**
         barTintColor 导航栏背景颜色
         iOS15以前设置有效果，iOS15以后无效果需要设置UINavigationBarAppearance的backgroundColor
         */
        appearance.backgroundColor = NAVIBAR_BACKGROUND_COLOR
        
        /**
         isTranslucent 半透明

         默认为YES，当设为YES，iOS15以前先取barTintColor的颜色，当barTintColor为nil默认半透明毛玻璃，iOS15先取UINavigationBarAppearance的backgroundColor颜色，当UINavigationBarAppearance的backgroundColor为nil，UINavigationBarAppearance的backgroundEffect默认半透明毛玻璃，当UINavigationBarAppearance的backgroundEffect为nil背景为透明

         当设为NO，iOS15以前先取barTintColor的颜色，当barTintColor为nil默认白色，iOS15先取UINavigationBarAppearance的backgroundColor颜色，当UINavigationBarAppearance的backgroundColor为nil，UINavigationBarAppearance的backgroundEffect默认背景为灰色，当UINavigationBarAppearance的backgroundEffect为nil背景为黑色
         */
        
        // tintColor 导航栏文字 颜色 暂不使用 使用富文本
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: NAVIBAR_TITLE_COLOR,
            NSAttributedString.Key.font: NAVIBAR_TITLE_FONT
        ]
        
        /**
         shadowImage
         iOS13以前设置有效果,不过需要同时设置backgroundImage，会影响导航栏背景，不建议
         iOS13以后无效果需要设置UINavigationBarAppearance的shadowColor和shadowImage
         */
        appearance.shadowImage = UIImage()
        appearance.shadowColor = nil
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance;
        
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
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backButton)
            viewController.hidesBottomBarWhenPushed = true

        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func backBtnClick() {
        self.popViewController(animated: true)
    }

}
