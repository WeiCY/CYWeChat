//
//  WeChatSearchViewController.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/5/27.
//

import UIKit

@objc protocol WeChatSearchViewControllerDelegate {
    func willPresentSearchController(_ searchController: WeChatSearchViewControllerDelegate)
    func willDismissSearchController(_ searchController: WeChatSearchViewControllerDelegate)
    func updateSearchResults(for searchController: WeChatSearchViewControllerDelegate)
}

typealias cancelHandler = () -> ()

class WeChatSearchViewController: BaseViewController {

    weak var searchVCDelegate :WeChatSearchViewControllerDelegate?
    
    var cancelBlock: cancelHandler?

    
//    lazy var customNaviBar: CustomNavigationView = {
//        let naviBar = CustomNavigationView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SAFE_AREA_TOP_HEIGHT))
//        naviBar.naviTitle = "微信"
//        return naviBar
//    }()
    
    lazy var wechatSearchBar: WechatSearchBar = {
        let searchBar = WechatSearchBar.init(frame: CGRect.init(x: 0, y: NAVI_STATUSBAR_HEIGHT, width: SCREEN_WIDTH, height: 54))
        searchBar.searchIconOffset = false
        searchBar.delegate = self
        
        return searchBar
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
        self.view.addSubview(wechatSearchBar)
        wechatSearchBar.becomeFirstResponder()
    }
}

extension WeChatSearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if (cancelBlock != nil) {
            cancelBlock!()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

//        guard let content =  self.searchBar.text, !content.isEmpty else {
//            self.searchControllerDelegate?.willDismissSearchController(self)
//            return
//        }
//
//        if content.count == 1 {
//            self.searchControllerDelegate?.willPresentSearchController(self)
//        }
//
//        self.searchControllerDelegate?.updateSearchResults(for: self)
    }
}
