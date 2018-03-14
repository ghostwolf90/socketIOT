//
//  SettingViewController.swift
//  socketIOT
//
//  Created by Laibit on 2018/3/12.
//  Copyright © 2018年 Laibit. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var ipLabel: UITextField!
    @IBOutlet weak var portLabel: UITextField!
    @IBOutlet weak var connectBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SocketModel.sharedInstance.initSocket()
        ipLabel.text = "10.0.1.176"
        portLabel.text = "8808"
    }
    
    @IBAction func connectPress(_ sender: UIButton) {
        guard let ipString = ipLabel.text else {
            return
        }
        
        guard let portString = portLabel.text else {
            return
        }
        
        SocketModel.sharedInstance.tcpConnect(ip: ipString, port: UInt16(portString)!)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
