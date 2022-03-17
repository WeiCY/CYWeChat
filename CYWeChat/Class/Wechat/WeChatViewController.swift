//
//  WeChatViewController.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/16.
//

import UIKit

/// 首页
class WeChatViewController: BaseViewController {

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
        let button = UIButton.init(type: .custom)
        button.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        button.backgroundColor = UIColor.red
        view.addSubview(button)
        button.cy_cornerRadius = 10
        button.cy_borderWidth = 2
    }

}
