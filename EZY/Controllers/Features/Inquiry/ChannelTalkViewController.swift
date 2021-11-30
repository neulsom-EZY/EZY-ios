//
//  ChannelTalkViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/11/10.
//

import UIKit
import ChannelIOFront

class ChannelTalkViewController: UIViewController, ChannelPluginDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
                        
        ChannelIO.delegate = self
        
        let bootConfig = BootConfig(pluginKey: "756d13d4-e4f8-4709-a527-a733454a1b74")
        
        ChannelIO.showChannelButton()
        
        ChannelIO.boot(with: bootConfig) { (completion, user) in
            if completion == .success, let user = user {
                print("success")
            } else {
                print("failed")
            }
        }
    }
}
