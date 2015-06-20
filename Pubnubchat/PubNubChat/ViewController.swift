//
//  ViewController.swift
//  PubnubChat
//
//  Created by Panacloud on 20/06/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var testView: UITextView!
    var pubnub:PubNub!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate=self
        var configuration:PNConfiguration = PNConfiguration(forOrigin: "pubsub.pubnub.com", publishKey: "demo", subscribeKey: "demo", secretKey: nil)
        
      self.pubnub = PubNub.clientWithConfiguration(configuration)
        
        
       pubnub.connectWithSuccessBlock({ (origin) -> Void in
        
        if (origin != nil) {
           
            self.pubnub.subscribeOn([PNChannel.channelWithName("my_channel")], withCompletionHandlingBlock: { (state, channel, error) -> Void in
                
                switch state{
                
                case PNSubscriptionProcessState.NotSubscribedState:
                    break;
                    
                case PNSubscriptionProcessState.SubscribedState:
                    self.pubnub.sendMessage("Hello from the PubNub Objective-C SDK", toChannel: PNChannel.channelWithName("my_channel") as PNChannel)
                    break;
                
                default:
                    break;
                }
            })
        }
        
       }, errorBlock: { (error) -> Void in
        println(error)
        
       })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Click(sender: AnyObject) {
        
        self.pubnub.requestServerTimeToken()
        self.pubnub.subscribeOn([PNChannel.channelWithName("my_channel1"),PNChannel.channelWithName("my_channel2")])
        self.pubnub.sendMessage("\(textField.text)", toChannel: PNChannel.channelWithName("my_channel2") as PNChannel, storeInHistory: true)
    }
    
    @IBAction func Click1(sender: AnyObject) {
     
        self.pubnub.requestHistoryForChannel(PNChannel.channelWithName("my_channel2") as PNChannel, from: nil, limit: 100) { (messages, channel, startDate, endDate, error) -> Void in
        
            if error == nil {
                for m in messages {
                    println(m.message!!)
                    self.testView.text=m.message!!

                }
            }else{
                println(error)
            }
        }
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.textField.resignFirstResponder()
    }

}

