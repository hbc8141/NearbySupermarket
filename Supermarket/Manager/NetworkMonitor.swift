//
//  Reachability.swift
//  Supermarket
//
//  Created by User on 2021/07/05.
//

import Foundation
import SystemConfiguration
import Network
import RxSwift

class NetworkMonitor {

    // MARK: - Properties
    static let shared:NetworkMonitor = NetworkMonitor()
    
    private let queue:DispatchQueue = DispatchQueue.global()
    private let monitor:NWPathMonitor!

    public private(set) var connectionType: ConnectionType = .unknown
    
    public lazy var connectionTypeOb:Observable<Bool> = Observable<Bool>.create { (observe:AnyObserver<Bool>) -> Disposable in
        let isConnected = self.connectionType != .unknown ? true : false
        observe.onNext(isConnected)
        observe.onCompleted()
        
        return Disposables.create {}
    }

    enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
    }

    public private (set) var isConnected: Bool = false

    // MARK: - Life Cycle
    private init() {
        self.monitor = NWPathMonitor()
    }
    
    public func startMonitoring() -> Void {
        self.monitor.start(queue: self.queue)
        self.monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status != .unsatisfied
            
            self?.getConnectionType(path)
        }
    }
    
    func stopMonitoring() -> Void {
        self.monitor.cancel()
    }
    
    func getConnectionType(_ path: NWPath) -> Void {
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
        } else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
        } else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .ethernet
        } else {
            connectionType = .unknown
        }
    }
}
