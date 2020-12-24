//
//  TableViewListController.swift
//  SwiftTestDemo
//
//  Created by 杜浩然 on 2020/12/7.
// 该类是一个swift写的taleview

import UIKit
import SwiftyJSON

class TableViewListController: UIViewController{

    var sourceDataArrat:[ListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "List Demo"
        
        self.view.addSubview(self.homeTableview);
        requestData()//获取数据源
        // Do any additional setup after loading the view.
    }
    

    fileprivate lazy var homeTableview: UITableView = {
        let homeTableview = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        homeTableview.frame = CGRect(x: 0, y: 84, width: self.view.bounds.size.width, height: self.view.bounds.height-84)
        homeTableview.delegate = self
        homeTableview.dataSource = self
        homeTableview.estimatedRowHeight = 100;
        homeTableview.rowHeight = UITableView.automaticDimension
        homeTableview.separatorStyle = .none
        if #available(iOS 11, *){
            homeTableview.contentInsetAdjustmentBehavior = .never
        }
        
        return homeTableview
    } ()
    
    func requestData() {
        
        let sources : [Any]  = [
            
            ["sign":"王","name":"王二麻子","age":"男  7岁6个月","content":"初步诊断：想你想你下\n申请医生：魏明月 肾脏科互联网门诊 上海市儿童医院","state":"取消","creatTime":"2020-11-18 09:38 点名会诊"],
            ["sign":"纳","name":"纳里儿童","age":"女  10岁1个月","content":"初步诊断：感冒了\n申请医生：高明武 肾脏科互联网门诊 上海市儿童医院","state":"拒绝","creatTime":"2020-11-18 09:38 点名会诊"],
            ["sign":"小","name":"小明","age":"男  17岁6个月","content":"初步诊断：相思病\n申请医生：张晓 肾脏科互联网门诊 上海市儿童医院","state":"完成","creatTime":"2020-11-18 09:38 点名会诊"],
            ["sign":"王","name":"王二麻子","age":"男  7岁6个月","content":"初步诊断：想你想你下\n申请医生：魏明月 肾脏科互联网门诊 上海市儿童医院","state":"取消","creatTime":"2020-11-18 09:38 点名会诊"],
            ["sign":"纳","name":"纳里儿童","age":"女  10岁1个月","content":"初步诊断：感冒了\n申请医生：高明武 肾脏科互联网门诊 上海市儿童医院","state":"拒绝","creatTime":"2020-11-18 09:38 点名会诊"],
            ["sign":"小","name":"小明","age":"男  17岁6个月","content":"初步诊断：相思病\n申请医生：张晓 肾脏科互联网门诊 上海市儿童医院","state":"完成","creatTime":"2020-11-18 09:38 点名会诊"],
            ["sign":"王","name":"王二麻子","age":"男  7岁6个月","content":"初步诊断：想你想你下\n申请医生：魏明月 肾脏科互联网门诊 上海市儿童医院","state":"取消","creatTime":"2020-11-18 09:38 点名会诊"],
            ["sign":"纳","name":"纳里儿童","age":"女  10岁1个月","content":"初步诊断：感冒了\n申请医生：高明武 肾脏科互联网门诊 上海市儿童医院","state":"拒绝","creatTime":"2020-11-18 09:38 点名会诊"],
            ["sign":"小","name":"小明","age":"男  17岁6个月","content":"初步诊断：相思病\n申请医生：张晓 肾脏科互联网门诊 上海市儿童医院","state":"完成","creatTime":"2020-11-18 09:38 点名会诊"],
        ]
        
        for dic  in sources {
            self.sourceDataArrat.append(ListModel(data: dic as! Dictionary))
        }
        print("33333= \(self.sourceDataArrat)")
        self.homeTableview.reloadData()
    }
    
    deinit {
        print("已经释放")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableViewListController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceDataArrat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! ListCell?
        if (cell == nil) {
            cell = ListCell(style: .default, reuseIdentifier: "listCell")
            cell?.listModel = self.sourceDataArrat[indexPath.row];
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.sourceDataArrat[indexPath.row] as ListModel
        print("当前点击的第\(indexPath.row)行，点击的用户名称 = \(String(describing: model.name))")
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerV  = UIView();
//        headerV.backgroundColor = .gray;
//        return headerV;
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20;
//    }

}
