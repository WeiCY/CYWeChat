//
//  BaseViewController.swift
//  MySwiftGithubDemo
//
//  Created by CityDoWCY on 2022/2/23.
//

import UIKit
import SnapKit

/// 基类父控制器
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = VIEW_BACK_COLOR
        self.modalPresentationStyle = .fullScreen
        UIScrollView.appearance().contentInsetAdjustmentBehavior = .never

        self.initUI()
        self.initData()
        // Do any additional setup after loading the view.
    }
    
//    // 解决push时界面卡住问题
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        if self.navigationController?.viewControllers.first == self {
//            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//        } else {
//            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
//        }
//    }
//    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: 基础代码 可被子类重写
    func initUI() {
        
    }
    
    func initData() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //类销毁时 通知此方法
    deinit {
        print("\(type(of: self)) ---> 销毁")
    }

}

// MARK: - 导航栏方法
extension BaseViewController {
    
    func popLastVC() {
        if ((self.navigationController?.viewControllers) != nil) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func popToRootVC() {
        if ((self.navigationController?.viewControllers) != nil) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
