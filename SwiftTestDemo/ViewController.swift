//
//  ViewController.swift
//  SwiftTestDemo
//
//  Created by 杜浩然 on 2020/12/4.
//

import UIKit
import Kingfisher 



class ViewController: UIViewController {
    var age : String? //定义可为空的字符串
    var name:String?
    var pic :UIImageView! //定义不能为空的图片
    var netPic :UIImageView!
    
    var paramater: [String] = ["dhr","29","zy","28","2","2"]//定义为字符串类型的数组
    var faltPar : [Any] = ["dhr","29","zy","28","2","2",["last"]]
    var dic:[String: String] = ["key":"value","key2":"value2","key3":"value3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red;
        self.name = "hello world"
        //swift中
        self.helloDemo()
        self.imgDemo()//图片
        self.imgNetDemo()//网络图片
        self.switchDemo()//选择器
        self.arrayDemo()//数组
        self.dicDemo()//字典
        let vc = TableViewListController()
        vc.requestData();//这就是不加权限的结果，默认是全工程可访问的
        // Do any additional setup after loading the view.
        self.flatMapDemo()//flatMap和Map的差别
        let ocTool = OCTool()
        ocTool.showMeLog() // swift中调用OC
        OCTool.showMeAnotherLog()
        
        self.dispatchQueueDemo()//多线程demo
        
        print("hello")
//        let queue  =  DispatchQueue(label: "test")
//        for  i in 0...10000{
//            queue.async {
//                print("\(i)  thread: \(Thread.current)")
//            }
//        }
//
//        let barrierQueue = DispatchWorkItem(qos: .userInteractive, flags: .barrier) {
//            print("上面执行完才执行")
//        }
        
//        for i in 0...9 {
//            print("\(i)")
//        }
    }
    

    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        presentSecondView()

    }
    
    func getInfo(by name:String)->[String]  {
        if name == "胡歌" {
            return ["Male","35","Actor"]
        }else if name == "刘亦菲" {
            return ["female","36","Actor"]
        }else {
            return ["unkown","unkown","unkown"]
        }
        
        
    }
    
    func flatMapDemo() {
        let names = ["胡歌","刘亦菲","Nothing"]
        let info1 = names.map { getInfo(by: $0)}
        print("获取到的新数组是 \(info1)")
        
        let info2 = names.flatMap { getInfo(by: $0)}
        print("第二次的flatmap的结果是：\(info2)")
    }
    
    func helloDemo() {
        print("\(self.age ?? "haha")")
    }
    
    func imgDemo() {
        self.pic = UIImageView.init(image: UIImage(named: "nihaojiushiguang06.jpg"))
        self.pic.frame = CGRect(x: 20, y: 100, width: 440, height: 280)
        self.view.addSubview(self.pic)

    }
    func imgNetDemo() {
        self.netPic = UIImageView.init()
        let imgUrl  =  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1608554219222&di=26f1f021111bc5b8e5b641e9858a43f2&imgtype=0&src=http%3A%2F%2Fwx3.sinaimg.cn%2Flarge%2F007RqnZAly4glgtup3mysj30u00wawg5.jpg"
        self.netPic.frame = CGRect(x: 0, y: 450, width: 440, height: 280)
        self.netPic.kf.setImage(with: URL(string: imgUrl), placeholder: UIImage(named: "nihaojiushiguang06.jpg"))
        self.view.addSubview(self.netPic ?? UIImageView(image: UIImage(named: "nihaojiushiguang06.jpg")))

    }
    func switchDemo() {
        switch name {
        case "hello world":
            print("hello world")
        default:
            print("I say hello world")
        }
    }
    
    private func arrayDemo() {
        
        self.paramater.insert("san", at: 3)
        print("\(String(describing: self.paramater))")
        self.paramater.append("在添加一个")
        print("\(String(describing: self.paramater))")
        self.paramater.remove(at: 0);
        print("\(String(describing: self.paramater))")
    }
    
    private func dicDemo() {
        
        print("dic = \(self.dic)")
        print("keys = \(self.dic.keys)")
        print("values = \(self.dic.values)")
        let map = self.paramater.map{$0 + "dhr"}
        print("map = \(map)")
    }
    func presentSecondView()  {
        let secondVC = SecondViewController()
        secondVC.sayHello(name: "Open")
        secondVC.sayHello1(name: "public")
        secondVC.sayHello4(name: "Internal")
        secondVC.delegate = self
        secondVC.enumType = MyEnum.MyEnumDefaylt("传给第二个页面的参数")
        self.navigationController!.pushViewController(secondVC, animated: true)
    }
    
    func dispatchQueueDemo()  {
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "com.apple.request", attributes: .concurrent)

        //异步执行
        queue.async(group: group) {
            
            print("开始请求数据 \(Date())  thread: \(Thread.current)")
            sleep(10)//模拟网络请求
            print("数据请求完成 \(Date())  thread: \(Thread.current)")
            
            //异步执行
            queue.async(group: group) {
                print("开始处理数据 \(Date())  thread: \(Thread.current)")
                sleep(5)//模拟数据处理
                print("数据处理完成 \(Date())  thread: \(Thread.current)")
            }
        }

        print("开始监听ing")

        //在当前队列监听
        group.notify(queue: queue) {
            //切换到主队列，刷新UI
            print("监听到数据请求完成后切换主线程刷新UI")
            DispatchQueue.main.async {
                print("UI刷新成功  \(Date())  thread: \(Thread.current)")
            }
        }

        print("监听完毕")
    }
}

extension ViewController: BtnProtocolDelegate{
    func hrbtnPush(name: String) {
        
        print("已经push到listview了，push的代号是\(name)")
    }
}
