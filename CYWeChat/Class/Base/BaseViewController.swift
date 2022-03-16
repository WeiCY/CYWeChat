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
    
    deinit {
        print("控制器被释放了")
    }

}
