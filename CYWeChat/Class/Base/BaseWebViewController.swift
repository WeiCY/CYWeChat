//
//  BaseWebViewController.swift
//  MySwiftGithubDemo
//
//  Created by CityDoWCY on 2022/3/7.
//

import UIKit
import WebKit

class BaseWebViewController: BaseViewController {

    var request: URLRequest!
    
    lazy var backButton: UIButton = {
        let backBtn = UIButton.init(type: .custom)
        backBtn.setImage(UIImage.init(named: "common_nav_back"), for: .normal)
        backBtn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 40)
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        return backBtn
    }()
    
    lazy var webView: WKWebView = {
        let wv = WKWebView.init()
        wv.uiDelegate = self
        wv.navigationDelegate = self
        wv.allowsBackForwardNavigationGestures = true
        wv.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        return wv
    }()
    
    lazy var progressView: UIProgressView = {
        let pv = UIProgressView()
        pv.tintColor = THEME_COLOR
        return pv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.load(request)

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
    
    convenience init(url: String?) {
        self.init()
        self.request = URLRequest.init(url: URL.init(string: url ?? "")!)
    }
    
    override func initUI() {
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(self.view)
        }
        
        view.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }
    
    @objc func backBtnClick() {
        if webView.canGoBack {
            webView.goBack()
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
}

extension BaseWebViewController: WKUIDelegate, WKNavigationDelegate {
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.isHidden = webView.estimatedProgress >= 1
            progressView.setProgress(Float.init(webView.estimatedProgress), animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
        
        navigationItem.title = webView.title
    }
}
