//
//  WeChatViewController.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/16.
//

import UIKit

/// 首页
class WeChatViewController: BaseTableViewController {
    
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
        initWeChatNavi()
        
        plainTableView.rowHeight = 70
        plainTableView.sectionHeaderHeight = 0
        plainTableView.sectionFooterHeight = 0
        plainTableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        plainTableView.separatorInset = UIEdgeInsets.init(top: 69, left: 70, bottom: 0, right: 0)
        plainTableView.register(WeChatListCell.self, forCellReuseIdentifier: GET_CLASS_NAME(WeChatListCell.self))
        
        view.addSubview(plainTableView)
        plainTableView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    func initWeChatNavi() {
        navigationItem.title = "微信"
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBarMoreButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBarAddButton)
    }
    
    lazy var rightBarAddButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "wechat_navi_add"), for: .normal)
        button.frame = CGRect.init(x: 0, y: 0, width: 35, height: 35)
        button.setTitleColor(TEXT_BLACK_COLOR, for: .normal)
        return button
    }()
    
    lazy var leftBarMoreButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "wechat_navi_more"), for: .normal)
        button.frame = CGRect.init(x: 0, y: 0, width: 35, height: 35)
        button.setTitleColor(TEXT_BLACK_COLOR, for: .normal)
        return button
    }()
}

extension WeChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: GET_CLASS_NAME(WeChatListCell.self), for: indexPath) as! WeChatListCell
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}
