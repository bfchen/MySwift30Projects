//
//  ViewController.swift
//  Project 1 - SimpleTimer
//
//  Created by KingyoWang on 17/2/25.
//  Copyright © 2017年 hp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
     总结
     1、变量声明，以var开头，swift不会给变量默认赋值，当声明的变量没有初始值时，需要在类型后面带？代表值
        可选Optional，例如: var t : String?, 表示t可能存在一个String类型的值，也可能为nil。在使用 
        变量时要对应使用？！，当使用？时，如果没有值不会调用之后的方法，如果有值，则进行拆包unwrapped， 
        调用后面的方法。到这里我们看到了?的几种使用场景:
            1.声明Optional值变量
            2.用在对Optional值操作中，用来判断是否能响应后面的操作
            3.用于安全调用protocol的optional方法
            4.使用 as? 向下转型(Downcast)
     
     2、？！的使用
        (1)声明时使用？，调用方法时都加！
        (2)声明时使用！，调用时不在需要加！，这时要确保变量不能为nil
     
     3、状态栏设置
        重写父类属性override var
     
     4、布尔值
        使用true、false，不在使用YES, NO
     
     5、定时器
        暂停: timer.fireDate = Date.distantFuture，即定时器运行的时间在无限远
        开始: timer.fireDate = Date.distantPast, 即定时器在很久之前就运行了，那么现在也要运行
     
     6、字符串转换为float值
        var t = CGFloat((label.text! as NSString).doubleValue)
        NSString才有转换的方法，要把String当做NSString后使用
     
     7、打印格式化
        String(format: "%.1f", t)
        和OC一样的调用方法
     */
    
    var playBtn : UIButton!
    var stopBtn : UIButton!
    
    var label : UILabel!
    var timer : Timer!  // 强制拆包，这样避免声明时用？，调用时必须加！
    let w = UIScreen.main.bounds.size.width
    let h = UIScreen.main.bounds.size.height
    
    // 状态栏
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addLabel()
        self.addBtns()
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(running), userInfo: nil, repeats: true)
        timer.fireDate = Date.distantFuture
    }
    
    func addLabel() {
        label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: w, height: h/2))
        self.view.addSubview(label)
        label.font = UIFont.init(name: "Arial", size: 120)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.text = "0.0"
        self.view.addSubview(label)
    }
    
    func addBtns() {
        playBtn = UIButton.init(type: UIButtonType.system)
        playBtn.frame = CGRect.init(x: 0, y: h/2, width: w/2, height: h/2)
        playBtn.addTarget(self, action: #selector(playTimer(sender:)), for: UIControlEvents.touchUpInside)
        playBtn.backgroundColor = UIColor(red: 84/255.0, green: 93/255.0, blue: 252/255.0, alpha: 1.0)
        playBtn.setTitle("play", for: UIControlState.normal)
        playBtn.setTitleColor(UIColor.brown, for: UIControlState.normal)
        playBtn.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        self.view.addSubview(playBtn)
        
        stopBtn = UIButton.init(type: UIButtonType.system)
        stopBtn.frame = CGRect(x: w/2, y: h/2, width: w/2, height: h/2)
        stopBtn.addTarget(self, action: #selector(stopTimer(sender:)), for: UIControlEvents.touchUpInside)
        stopBtn.setTitle("pause", for: UIControlState.normal)
        stopBtn.setTitleColor(UIColor.brown, for: UIControlState.normal)
        stopBtn.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        stopBtn.backgroundColor = UIColor(red: 102/255.0, green: 190/255.0, blue: 8/255.0, alpha: 1.0)
        self.view.addSubview(stopBtn)
        
        let resetBtn = UIButton.init(type: UIButtonType.system)
        resetBtn.frame = CGRect.init(x: w-120, y: 30, width: 90, height: 30)
        resetBtn.setTitle("reset", for: UIControlState.normal)
        resetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        resetBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        resetBtn.addTarget(self, action: #selector(reset), for: UIControlEvents.touchUpInside)
        self.view.addSubview(resetBtn)
    }
    
    func reset() {
        label.text = "0.0"
        timer.fireDate = Date.distantFuture
        playBtn.isEnabled = true
        stopBtn.isEnabled = false
    }
    
    func playTimer(sender:UIButton) {
        playBtn.isEnabled = false
        stopBtn.isEnabled = true
        timer.fireDate = Date.distantPast
    }
    
    func running() {
        // 字符串转换为float
        var t = CGFloat((label.text! as NSString).doubleValue)
        t += 0.1
        label.text = String(format: "%.1f", t)
    }

    func stopTimer(sender:UIButton) {
        playBtn.isEnabled = true
        stopBtn.isEnabled = false
        timer.fireDate = Date.distantFuture
    }
    
}

