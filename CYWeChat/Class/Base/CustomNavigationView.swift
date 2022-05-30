//
//  CustomNavigationView.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/5/27.
//

import UIKit

class CustomNavigationView: UIView {

    private lazy var contentView: UIView = {
        let contentView = UIView.init()
        contentView.backgroundColor = NAVIBAR_BACKGROUND_COLOR
        return contentView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.textColor = NAVIBAR_TITLE_COLOR
        label.font = NAVIBAR_TITLE_FONT
        label.textAlignment = .center
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "commom_nav_back"), for: .normal)
        button.setImage(UIImage.init(named: "commom_nav_back"), for: .highlighted)
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        return button
    }()
    
    var naviTitle: String = "" {
        didSet {
            self.titleLabel.text = naviTitle
            setNeedsLayout()
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        backgroundColor = NAVIBAR_BACKGROUND_COLOR
        
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(NAVIBAR_HEIGH)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalTo(contentView)
            make.width.lessThanOrEqualTo(200)
        }
        
        if getWindowTopVC()?.navigationController?.viewControllers.count ?? 1 > 1 {
            contentView.addSubview(backButton)
            backButton.snp.makeConstraints { make in
                make.width.height.equalTo(40)
                make.centerY.equalTo(contentView);
                make.left.equalTo(contentView).offset(10);
            }
        }
    }
    
    @objc func backButtonAction() {
        if let currentVC = getWindowTopVC() as? BaseViewController {
            currentVC.popLastVC()
        }
    }
}
