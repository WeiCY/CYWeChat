//
//  MineSubViews.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/23.
//

import Foundation
import UIKit

// MARK: 通用cell
class MineHomeListCell: UITableViewCell {
    
    // life cycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        setupSubview()
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
    func setupSubview() {
        backgroundColor = CELL_BACK_COLOR
        
        contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(18)
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
        };
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(16)
            make.centerY.equalToSuperview()
        };
        
        contentView.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(contentView).offset(-18)
            make.width.equalTo(8)
        };
        
        contentView.addSubview(noteView)
        noteView.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.left.equalTo(titleLabel.snp.right).offset(8)
            make.width.height.equalTo(8)
        }
        
        contentView.addSubview(rightIconImageView)
        rightIconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.right.equalTo(arrowImageView.snp.left).offset(-8)
            make.width.height.equalTo(32)
        }
    }
    
    
    // lazy
    lazy var iconImageView :UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    lazy var titleLabel :UILabel = {
        let label = UILabel()
        label.font = CELL_TITLE_FONT
        label.textColor = TEXT_BLACK_COLOR
        return label
    }()
    lazy var arrowImageView :UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "icon_arrow_right")
        return imageView
    }()
    lazy var noteView: UIView = {
        let view = UIView()
        view.backgroundColor = NOTE_RED_COLOR
        view.cy_cornerRadius = 4
        return view
    }()
    lazy var rightIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "headImage")
        imageView.cy_cornerRadius = 4
        return imageView
    }()
}

// MARK: 个人中心头视图
class MineHeadView: UIView {
    
    // life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // subview
    func setupSubview() {
        backgroundColor = VIEW_BACK_COLOR
        
        self.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.width.height.equalTo(60)
            make.top.equalToSuperview().offset(SAFE_AREA_TOP_HEIGHT+23)
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView).offset(5)
            make.height.equalTo(25)
            make.left.equalTo(iconImageView.snp.right).offset(20)
        }
        
        addSubview(wechatNumLabel)
        wechatNumLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
        }
        
        addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(wechatNumLabel)
            make.right.equalToSuperview().offset(-18)
            make.width.equalTo(8)
        };
        
        addSubview(codeImageView)
        codeImageView.snp.makeConstraints { make in
            make.centerY.equalTo(wechatNumLabel)
            make.right.equalTo(arrowImageView.snp.left).offset(-20)
        }
        
        addSubview(statusButton)
        statusButton.snp.makeConstraints { make in
            make.left.equalTo(wechatNumLabel)
            make.width.equalTo(62)
            make.height.equalTo(18)
            make.top.equalTo(wechatNumLabel.snp.bottom).offset(10)
        }
       
    }
    
    
    // lazy
    lazy var iconImageView :UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "headImage")
        imageView.cy_cornerRadius = 30
        return imageView
    }()
    lazy var nameLabel :UILabel = {
        let label = UILabel()
        label.font = BIG_TITLE_FONT
        label.textColor = TEXT_BLACK_COLOR
        label.text = "一只快乐的猪"
        return label
    }()
    lazy var wechatNumLabel :UILabel = {
        let label = UILabel()
        label.font = CELL_TITLE_FONT
        label.textColor = TEXT_GREY_COLOR
        label.text = "微信号：happy"
        return label
    }()
    lazy var codeImageView :UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "mine_code")
        return imageView
    }()
    lazy var arrowImageView :UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "icon_arrow_right")
        return imageView
    }()
    lazy var statusButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitle("+ 状态", for: .normal)
        button.setTitleColor(TEXT_GREY_COLOR, for: .normal)
        button.titleLabel?.font = CELL_SUBTITLE_FONT
        button.cy_cornerRadius = 10
        button.cy_borderWidth = 0.5
        button.cy_borderColor = TEXT_GREY_COLOR.cgColor
        return button
    }()
}
