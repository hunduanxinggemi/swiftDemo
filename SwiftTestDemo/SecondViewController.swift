//
//  SecondViewController.swift
//  SwiftTestDemo
//
//  Created by 杜浩然 on 2020/12/4.
//

import UIKit

protocol BtnProtocolDelegate : class{
    func hrbtnPush(name:String)
}

enum MyEnum {
    case MyEnumDefaylt(String)
    case MyEnumInt(Int)
    case MyEnumModel(ListModel)
}

class SecondViewController: UIViewController {
    
    weak var delegate: BtnProtocolDelegate?
    var enumType:MyEnum?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.pushBtn)
        self.view.backgroundColor = .systemGreen
        
        let name : String = "你好"
        let nameString : NSString = "旧时光"
        
        //从前页面传过来的参数
        self.switchDemo()
        
        self.enumType = .MyEnumDefaylt(name)
        self.switchDemo()

        self.enumType = .MyEnumInt(20)
        self.switchDemo()
        
        self.enumType = .MyEnumModel(ListModel(data: Dictionary()))
        self.switchDemo()
        print("第一个name是 \(name) 第二个名字的是\(nameString)")
        
        
        
        // Do any additional setup after loading the view.
    }
    
    fileprivate lazy var pushBtn: UIButton = {
        
        let pushBtn = UIButton(type: .custom)
        pushBtn.frame = CGRect(x: 100, y: 100, width: 100, height: 45)
        pushBtn.setTitle("Net Page", for: .normal)
        pushBtn.setTitleColor(.white, for: .normal)
        pushBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        pushBtn.layer.cornerRadius = 10
        pushBtn.clipsToBounds = true
        pushBtn.backgroundColor = .cyan
        pushBtn.addTarget(self, action: #selector(pushBtnClick), for: .touchUpInside)
        
        return pushBtn
    } ()
 
    func switchDemo() {
        
        switch self.enumType {
        case let .MyEnumDefaylt(str):
            print("我是枚举默认类型字符串,传入的参数\(str)")
        case let .MyEnumInt(value):
            print("我是枚举Int类型,传入的参数\(value)")
        case let .MyEnumModel(model):
            print("我是枚举模型类型,传入的参数\(String(describing: model.name))")

        default:
           print("我是枚举默认类型")
        }
    }
    
    @objc func pushBtnClick(btn:UIButton) {
        let listVC = TableViewListController()
        self.navigationController?.pushViewController(listVC, animated: true)
        self.delegate?.hrbtnPush(name: btn.titleLabel?.text ?? "穿的参数是")
    }
    
    open func sayHello(name:String) {
        print("我的名字是\(name)")
    }
    
    public func sayHello1(name:String) {
       print("我的名字是\(name)")
   }
    private func sayHello2(name:String) {
           print("我的名字是\(name)")
       }
    fileprivate func sayHello3(name:String) {
           print("我的名字是\(name)")
       }
    internal func sayHello4(name:String) {
           print("我的名字是\(name)")
       }
}
