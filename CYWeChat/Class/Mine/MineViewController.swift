//
//  MineViewController.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/22.
//

import UIKit

/// 个人中心页面
class MineViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    override func initUI() {
        self.cy_prefersNavigationBarHidden = true
        
        view.addSubview(plainTableView)
        plainTableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        };
    }

}
