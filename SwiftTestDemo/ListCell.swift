//
//  ListCell.swift
//  SwiftTestDemo
//
//  Created by 杜浩然 on 2020/12/7.
//

import UIKit
import SnapKit

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

class ListCell: UITableViewCell {

    var listModel:ListModel?{
        didSet {
            self.signLabel.text = listModel?.sign ?? "王"
            self.nameLabel.text = listModel?.name ?? "王二小"
            self.ageLabel.text = listModel?.age ?? "男   9岁"
            self.contentLabel.text = listModel?.content ?? "转诊说明： 1\n申请医生：张栋 （测试）内分泌科互联网门诊部"
            self.stateLabel.text = listModel?.stateString ?? "取消"
            self.creatTimeLabel.text = listModel?.creatTime ?? "2020-10-26 14：21 住院转诊"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       creatUI()
        self.backgroundColor = .white
    }
    
    func creatUI(){
        
        self.contentView.addSubview(self.topview)
        self.topview.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView)
            make.left.equalTo(self.contentView)
            make.width.equalTo(self.contentView)

        }
        
        self.contentView.addSubview(self.signLabel)
        self.signLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.topview).offset(20)
            make.left.equalTo(10)
            make.size.equalTo(CGSize(width: 30, height: 30))

        }

        
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.signLabel.snp.right).offset(10)
            make.centerY.equalTo(self.signLabel)
            make.height.equalTo(20)
    
        }
        
        self.contentView.addSubview(self.ageLabel)
        self.ageLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.nameLabel.snp.right).offset(20)
            make.centerY.equalTo(self.nameLabel)
            make.height.equalTo(20)
            
        }
        
        self.contentView.addSubview(self.stateLabel)
        self.stateLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalTo(self.ageLabel)
            make.size.equalTo(CGSize(width: 60, height: 30))

        }
        
        self.contentView.addSubview(self.contentLabel)
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.signLabel.snp.bottom).offset(20)
            make.leading.equalTo(self.signLabel)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(80)
        }
        
        self.contentView.addSubview(self.creatTimeLabel)
        self.creatTimeLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.signLabel)
            make.top.equalTo(self.contentLabel.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(20)
        }
        
        self.contentView.addSubview(self.bottomView)
        self.bottomView.snp.makeConstraints { (make) in
            make.left.equalTo(self.signLabel)
            make.top.equalTo(self.creatTimeLabel.snp.bottom)
            make.height.equalTo(10)
            make.bottom.equalTo(self.contentView)
        }
        
        self.contentView.addSubview(self.bottomLine)
        self.bottomLine.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self)
            make.height.equalTo(1)
            make.bottom.equalTo(self.contentView).offset(-1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        // Configure the view for the selected state
    }
    
    fileprivate lazy var signLabel: UILabel = {
        let signLabel = UILabel()
        signLabel.font = UIFont.systemFont(ofSize: 18)
        signLabel.textColor = UIColor.systemBlue
        signLabel.textAlignment = .center
        signLabel.backgroundColor = .cyan
        signLabel.layer.cornerRadius = 3
        signLabel.clipsToBounds = true
//        signLabel.backgroundColor = .red
        return signLabel
    } ()
    
    fileprivate lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .left
        nameLabel.preferredMaxLayoutWidth = 200
        nameLabel.setContentHuggingPriority(.required, for: .horizontal)
        return nameLabel
    } ()
    
    fileprivate lazy var ageLabel: UILabel = {
        let ageLabel = UILabel()
        ageLabel.font = UIFont.systemFont(ofSize: 14)
        ageLabel.textColor = .lightGray
        ageLabel.preferredMaxLayoutWidth = 200
        ageLabel.setContentHuggingPriority(.required, for: .horizontal)
        ageLabel.textAlignment = .left
        return ageLabel
    } ()
    
    fileprivate lazy var stateLabel: UILabel = {
        let stateLabel = UILabel()
        stateLabel.font = UIFont.systemFont(ofSize: 14)
        stateLabel.textColor = .systemOrange
        stateLabel.textAlignment = .right
//        stateLabel.backgroundColor = .yellow
        return stateLabel
    } ()
    
    fileprivate lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.textColor = .systemOrange
        contentLabel.textAlignment = .left
        contentLabel.backgroundColor = .systemGray4
        contentLabel.layer.cornerRadius = 10
        contentLabel.clipsToBounds = true
        contentLabel.numberOfLines = 0
        contentLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return contentLabel
    } ()
    
    fileprivate lazy var creatTimeLabel: UILabel = {
        let creatTimeLabel = UILabel()
        creatTimeLabel.font = UIFont.systemFont(ofSize: 12)
        creatTimeLabel.textColor = .systemGray4
        creatTimeLabel.textAlignment = .left
//        creatTimeLabel.backgroundColor = .gray
        return creatTimeLabel
    } ()
    
    fileprivate lazy var topview: UIView = {
        let topview = UIView()
        topview.backgroundColor = .lightGray
        return topview
    } ()
    fileprivate lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = .lightGray
        return bottomView
    } ()
    
    fileprivate lazy var bottomLine: UILabel = {
        let bottomLine = UILabel()
        bottomLine.backgroundColor = .systemGroupedBackground
        return bottomLine
    } ()
}

