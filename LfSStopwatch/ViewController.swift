//
//  ViewController.swift
//  LfSStopwatch
//
//  Created by Yukiko Kida on 2018/02/10.
//  Copyright © 2018年 Yukiko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var hanteiLabel:UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func start(){
        
        if !timer.isValid{
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true
            )
            
        }
        hanteiLabel.text = ""
    }
    @IBAction func stop(){
        
        if timer.isValid{
            //タイマーが動作していたら停止する
            timer.invalidate()
            //hanteiメゾットの呼び出し、結果を表示する
            self.hantei()
        }
    }
    func hantei(){
        
        //もし経過時間が9.8秒〜10.2秒だったら
        if count > 9.80 && count < 10.20 {
            hanteiLabel.text = "PERPECT!"
        }else if  count > 9.70 && count < 10.30 {
            hanteiLabel.text = "GREAT!"
        }else if  count > 9.50 && count < 10.50 {
            hanteiLabel.text = "GOOD"
        }else {
            hanteiLabel.text = "BAD"
        }
    }
    @IBAction func reset(){
        
        if timer.isValid{
            timer.invalidate()
        }
        //カウントを0.0に初期化する
        count = 0.0
        
        //初期化したcountをlabelに表示させる
        label.text = String(format: "%.2f",count)
        //        label.textColor = UIColor.red
        //        label.backgroundColor = UIColor.blue
    }
    @objc func up(){
        //countを0.01(時間経過分)足す
        count = count + 0.01
        //ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f",count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

