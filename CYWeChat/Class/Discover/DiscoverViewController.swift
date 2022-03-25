//
//  DiscoverViewController.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/16.
//

import UIKit

/// 发现页面
class DiscoverViewController: BaseTableViewController {

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
        self.cy_prefersNavigationBarHidden = false
        groupTableView.rowHeight = 56
        groupTableView.sectionHeaderHeight = 10
        groupTableView.sectionFooterHeight = 0
        groupTableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        groupTableView.separatorInset = UIEdgeInsets.init(top: 55, left: 55, bottom: 0, right: 0)
        groupTableView.register(MineHomeListCell.self, forCellReuseIdentifier: GET_CLASS_NAME(MineHomeListCell.self))
        
        view.addSubview(groupTableView)
        groupTableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        };
    }
    
    override func initData() {
        let discoverData = [
            [
                [
                    "title": "朋友圈",
                    "image": "discover_cyclefriend"
                ]
            ],
            [
                [
                    "title": "视频号",
                    "image": "discover_video"
                ],
            ],
            [
                [
                    "title": "扫一扫",
                    "image": "discover_scan"
                ],
                [
                    "title": "摇一摇",
                    "image": "discover_shake"
                ]
            ],
            [
                [
                    "title": "看一看",
                    "image": "discover_look"
                ],
                [
                    "title": "搜一搜",
                    "image": "discover_search"
                ]
            ],
            [
                [
                    "title": "直播和附近",
                    "image": "discover_nearlive"
                ]
            ],
            [
                [
                    "title": "购物",
                    "image": "discover_shop"
                ],
                [
                    "title": "游戏",
                    "image": "discover_game"
                ]
            ],
            [
                [
                    "title": "小程序",
                    "image": "discover_smallprogram"
                ]
            ]
        ]
        dataArray = discoverData
        groupTableView.reloadData()
    }
}

extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource {
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
