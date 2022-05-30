//
//  WeChatViewController.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/16.
//

import UIKit

/// 首页
class WeChatViewController: BaseTableViewController {
    
    lazy var customNaviBar: CustomNavigationView = {
        let naviBar = CustomNavigationView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SAFE_AREA_TOP_HEIGHT))
        naviBar.naviTitle = "微信"
        return naviBar
    }()
    
    lazy var wechatSearchBar: WechatSearchBar = {
        let searchBar = WechatSearchBar.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 54))
        searchBar.searchIconOffset = true
        searchBar.delegate = self
        
        return searchBar
    }()
    
    lazy var searchVC: WeChatSearchViewController = {
        let searchVC = WeChatSearchViewController.init()
        searchVC.searchVCDelegate = self
        
        let cancelHandle: cancelHandler = {
            [weak self] in
            guard let strong = self else {
                return
            }
            strong.searchVC.view.removeFromSuperview()
            strong.searchVC.removeFromParent()
            CATransaction.begin()
            strong.wechatSearchBar.setShowsCancelButton(true, animated: false)
            CATransaction.setDisableActions(true)
            CATransaction.commit()
            CATransaction.setCompletionBlock({

                UIView.animate(withDuration: 0.4) {
                    var naviBarFrame = strong.customNaviBar.frame
                    naviBarFrame.origin.y += NAVIBAR_HEIGH
                    strong.customNaviBar.frame = naviBarFrame
                    
                    var tableViewFrame = strong.plainTableView.frame
                    tableViewFrame.origin.y += NAVIBAR_HEIGH
                    strong.plainTableView.frame = tableViewFrame
                    
                    strong.wechatSearchBar.setShowsCancelButton(false, animated: true)
                }
            })
        }
        
        searchVC.cancelBlock = cancelHandle
        
        return searchVC
        
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
        initWeChatNavi()
        
        view.addSubview(customNaviBar)
        
        plainTableView.rowHeight = 70
        plainTableView.sectionHeaderHeight = 0
        plainTableView.sectionFooterHeight = 0
        plainTableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        plainTableView.separatorInset = UIEdgeInsets.init(top: 69, left: 70, bottom: 0, right: 0)
        plainTableView.register(WeChatListCell.self, forCellReuseIdentifier: GET_CLASS_NAME(WeChatListCell.self))
        plainTableView.tableHeaderView = wechatSearchBar
        
        view.addSubview(plainTableView)
        plainTableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(customNaviBar.snp.bottom)
        }
    }
    
    func initWeChatNavi() {
        
        self.cy_prefersNavigationBarHidden = true
        
//        navigationItem.title = "微信"
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBarMoreButton)
//        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBarAddButton)
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension WeChatViewController : UISearchBarDelegate {
    
    func touchSearchBarAnimate() {
        CATransaction.begin()
        addChild(searchVC)
        view.addSubview(searchVC.view)
        searchVC.view.alpha = 0
        
        CATransaction.disableActions()
        CATransaction.commit()
        
        UIView.animate(withDuration: 0.4) {
            [weak self] in
            guard let strong = self else {
                return
            }
            
            var naviBarFrame = strong.customNaviBar.frame
            naviBarFrame.origin.y -= NAVIBAR_HEIGH
            strong.customNaviBar.frame = naviBarFrame
            
            var tableViewFrame = strong.plainTableView.frame
            tableViewFrame.origin.y -= NAVIBAR_HEIGH
            strong.plainTableView.frame = tableViewFrame
            
            strong.wechatSearchBar.setShowsCancelButton(true, animated: true)
            strong.searchVC.wechatSearchBar.setShowsCancelButton(true, animated: true)

            strong.customNaviBar.backgroundColor = VIEW_BACK_COLOR
            
        } completion: {_ in
            self.searchVC.view.alpha = 1
            self.wechatSearchBar.showsCancelButton = false
        }
    }
    
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        touchSearchBarAnimate()
        return false
    }
}

extension WeChatViewController: WeChatSearchViewControllerDelegate {
    
    func willPresentSearchController(_ searchController: WeChatSearchViewControllerDelegate) {
        
//        searchVC.addChildViewController(searchVC.searchResultViewController)
//        searchVC.view.addSubview(searchVC.searchResultViewController.view)
    }
    
    func willDismissSearchController(_ searchController: WeChatSearchViewControllerDelegate) {
//        searchVC.searchResultViewController.view.removeFromSuperview()
//        searchVC.searchResultViewController.removeFromParentViewController()
    }
    
    func updateSearchResults(for searchController: WeChatSearchViewControllerDelegate) {
//        let searchContent = self.searchVC.searchBar.text ?? ""
//        let predicate = NSPredicate.init(format: "(SELF CONTAINS %@)", searchContent)
//        let filterArray = (dataArray as NSArray).filtered(using: predicate) as! [String]
//        self.filterResult = searchContent.count > 0 ? filterArray : dataArray
//        let searchResult = self.searchVC.searchResultViewController!
//        searchResult.sourceArray = self.filterResult
    }
}
