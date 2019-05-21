//
//  ReachabilityManager.swift
//
//
//  Created by Jalal Najafi.
//  Copyright © 2018  . All rights reserved.
//


import Foundation
import Reachability
class ReachabilityManager: NSObject {
    static  let shared = ReachabilityManager()
    
    // Boolean network tracking
    var isNetworkAvailable : Bool {
        return networkStatus != .none
    }
    
    // Network tracking (none, wiFi, cellular)
    var networkStatus: Reachability.Connection = .none
    
    let reachability = Reachability()
    func startMonitoringNetwork() {
        print("Network monitoring started")
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: Notification.Name.reachabilityChanged,
                                               object: reachability)
        do{
            try reachability?.startNotifier()
        }catch{
            print("Unable to start notifier")
        }
    }
    
    // Stops monitoring network status
    func stopMonitoringNetwork(){
        print("Network monitoring stopped")
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: Notification.Name.reachabilityChanged,
                                                  object: reachability)
    }
    // Fired when network status changed
    @objc func reachabilityChanged(notification: Notification) {
        let reachability = notification.object as! Reachability
        switch reachability.connection {
        case .none:
            print("Network became unreachable")
            DispatchQueue.main.async {
                self.networkStatus = .none
            }
        case .wifi:
            print("Network reachable through WiFi")
            DispatchQueue.main.async {
                self.networkStatus = .wifi
            }
            
        case .cellular:
            print("Network reachable through Cellular Data")
            DispatchQueue.main.async {
                self.networkStatus = .cellular
            }
        }
    }
}
