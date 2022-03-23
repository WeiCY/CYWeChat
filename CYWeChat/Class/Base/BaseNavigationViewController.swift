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
        backBtn.setImage(UIImage.init(named: "common_nav_back"), for: .normal)
        backBtn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 40)
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        return backBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = NAVIBAR_BACKGROUND_COLOR
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: NAVIBAR_TITLE_COLOR,
            NSAttributedString.Key.font: NAVIBAR_TITLE_FONT
        ]
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
