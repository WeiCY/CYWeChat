//
//  MineViewController.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/22.
//

import UIKit

/// 个人中心页面
class MineViewController: BaseTableViewController {

    lazy var mineHeadView: MineHeadView = {
        let view = MineHeadView()
        view.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SAFE_AREA_TOP_HEIGHT+147)
        return view
    }()
    
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
        
        plainTableView.rowHeight = 56
        plainTableView.sectionHeaderHeight = 10
        plainTableView.sectionFooterHeight = 0.01
        plainTableView.tableHeaderView = mineHeadView
        plainTableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        plainTableView.separatorInset = UIEdgeInsets.init(top: 55, left: 55, bottom: 0, right: 0)
        plainTableView.register(MineHomeListCell.self, forCellReuseIdentifier: GET_CLASS_NAME(MineHomeListCell.self))
        
        view.addSubview(plainTableView)
        plainTableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        };
    }
    
    override func initData() {
        let mineData = [
            [
                [
                    "title": "服务",
                    "image": "mine_service"
                ]
            ],
            [
                [
                    "title": "收藏",
                    "image": "mine_collect"
                ],
                [
                    "title": "朋友圈",
                    "image": "mine_circlefriend"
                ],
                [
                    "title": "卡包",
                    "image": "mine_cardpackage"
                ],
                [
                    "title": "表情",
                    "image": "mine_expression"
                ]
            ],
            [
                [
                    "title": "设置",
                    "image": "mine_setting"
                ]
            ]
        ]
        dataArray = mineData
        plainTableView.reloadData()
    }
    
}

extension MineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: GET_CLASS_NAME(MineHomeListCell.self), for: indexPath) as! MineHomeListCell
        let sectionData = dataArray[indexPath.section] as! Array<Any>
        cell.model = sectionData[indexPath.row] as? Dictionary
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 10))
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionData = dataArray[section] as! Array<Any>
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
    }
}
