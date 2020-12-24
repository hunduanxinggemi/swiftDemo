//
//  ListModel.swift
//  SwiftTestDemo
//
//  Created by 杜浩然 on 2020/12/7.
//

import UIKit

@objcMembers class ListModel: NSObject {

    var name:String?
    var sign: String?
    var age:String?
    var stateString:String?
    var content:String?
    var creatTime:String?
   init(data:Dictionary<String, String>){
        name = data["name"] ?? "你好"
        sign = data["sign"]
        age = data["age"]
        stateString = data["state"]
        content = data["content"]
        creatTime = data["creatTime"]
    }
    func test() {//在OC代码里调用swift方法
        print("hello swift OC中调用siwft方法也成功了！")
    }
}
