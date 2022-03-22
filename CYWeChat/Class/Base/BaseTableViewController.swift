//
//  BaseTableViewController.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/22.
//

import UIKit

class BaseTableViewController: BaseViewController {

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

    lazy var plainTableView: UITableView = {
        let table = UITableView.init(frame: CGRect.zero, style: UITableView.Style.plain)
        table.backgroundColor = VIEW_BACK_COLOR
        // 加上 as? 可选 不加的话 必须添加代理
        table.delegate = self as? UITableViewDelegate
        table.dataSource = self as? UITableViewDataSource
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        table.contentInsetAdjustmentBehavior = .never
        return table
    }()

    lazy var groupTableView: UITableView = {
        let table = UITableView.init(frame: CGRect.zero, style: UITableView.Style.grouped)
        table.backgroundColor = VIEW_BACK_COLOR
        // 加上 as? 可选 不加的话 必须添加代理
        table.delegate = self as? UITableViewDelegate
        table.dataSource = self as? UITableViewDataSource
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        table.contentInsetAdjustmentBehavior = .never
        return table
    }()
    
}
