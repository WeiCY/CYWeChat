//
//  LeadingViewController.swift
//  MySwiftGithubDemo
//
//  Created by CityDoWCY on 2022/3/3.
//

import UIKit

class LeadingViewController: BaseViewController {

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
        self.navigationItem.title = "引导页，自定义即可"
    }
}
