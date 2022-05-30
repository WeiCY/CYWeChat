//
//  WeChatSubViews.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/25.
//

import UIKit

class WeChatListCell: UITableViewCell {
    // life cycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 赋值
    var model: Dictionary<String, Any>? {
        didSet {
            guard let model = model else { return }
            iconImageView.image = UIImage.init(named: model["image"] as! String)
            titleLabel.text = model["title"] as? String
        }
    }
    
    // subview
    func setupSubviews() {
        backgroundColor = CELL_BACK_COLOR
        
        contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(16)
            make.width.height.equalTo(44)
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(12)
            make.top.equalTo(iconImageView.snp.top).offset(2)
            make.height.equalTo(20)
        }
        
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.right).offset(8)
            make.centerY.equalTo(titleLabel)
            make.right.equalTo(contentView).offset(-12)
        }
//        timeLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        contentView.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.right.equalTo(timeLabel)
            make.height.equalTo(15)
            make.bottom.equalTo(iconImageView).offset(-2)
        }
        
        showDefaultData()
    }
    
    func showDefaultData()  {
        iconImageView.image = UIImage.init(named: "headImage")
        titleLabel.text = "张无忌"
        timeLabel.text = "01月14号"
        subTitleLabel.text = "冰火岛就在俄罗斯的斯安的嫉妒诶得积极得记"
    }
    
    
    // lazy
    lazy var iconImageView :UIImageView = {
        let imageView = UIImageView()
        imageView.cy_cornerRadius = 4
        return imageView
    }()
    lazy var titleLabel :UILabel = {
        let label = UILabel()
        label.font = CELL_TITLE_FONT
        label.textColor = TEXT_BLACK_COLOR
        return label
    }()
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = CELL_INFO_FONT
        label.textColor = TEXT_LIGHTGREY_COLOR
        return label
    }()
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = CELL_SUBTITLE_FONT
        label.textColor = TEXT_GREY_COLOR
        return label
    }()
}

class WechatSearchBar: UISearchBar {
    
    var searchIconOffset: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = VIEW_BACK_COLOR
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        self.placeholder = "搜索"
        self.tintColor = THEME_COLOR
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let barBackgorundView = self.subviews.first!.subviews.first!
        barBackgorundView.alpha = 0
        
        let subView = self.subviews[0].subviews[1].subviews[0]
        subView.backgroundColor = UIColor.white
        subView.layer.cornerRadius = 8
        subView.layer.masksToBounds = true
        subView.layer.borderWidth = 0.3
        subView.layer.borderColor = UIColor.lightGray.cgColor
        
        if searchIconOffset {
           setPositionAdjustment(UIOffset.init(horizontal: self.bounds.width/2 - 48, vertical: 0), for: .search)
        }else {
            setPositionAdjustment(UIOffset.zero, for: .search)
        }

        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "取消"
    }
}
