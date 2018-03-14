//
//  SocketModel.swift
//  socketIOT
//
//  Created by Laibit on 2018/3/14.
//  Copyright © 2018年 Laibit. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class SocketModel: NSObject {
    static var sharedInstance = SocketModel()
    
    var socket: GCDAsyncSocket!
    
    func initSocket(){
        socket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
        socket?.delegate = self
    }
    
    func tcpConnect(ip:String, port:UInt16){
        do{
            try socket.connect(toHost: ip, onPort: 8808, withTimeout: -1)
            print("連線成功 \(ip)")
        }catch _ {
            print("連線失敗")
        }
    }
    
    func sayHell(saySomething:String){
        socket?.write(saySomething.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withTimeout: -1, tag: 0)
    }
}

extension SocketModel: GCDAsyncSocketDelegate {
    
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        print("連接到Server" + host)
        self.socket?.readData(withTimeout: -1, tag: 0)
    }

    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        let msg = String(data: data as Data, encoding: String.Encoding.utf8)
        print("收到 \(msg!)")
        socket?.readData(withTimeout: -1, tag: 0)
    }
    
}
