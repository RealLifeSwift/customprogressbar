//
//  Timer.swift
//  CustomProgressBar
//
//  Created by Tuan on 2020/05/19.
//  Copyright © 2020 Real Life Swift. All rights reserved.
//

import Foundation

class AppTimer {
  
  private var timer: Timer?
  
  var timerStarted: (()->())?
  var timerStopped: (()->())?
  var timerFired: ((Int)->())?
  var timerCompleted: (()->())?
  
  var isRunning: Bool {
    if let isTimerValid = timer?.isValid {
      return isTimerValid
    }
    return false
  }
  
  var duration: Int = 3
  var tickInterval: TimeInterval = 0.1
  
  init(duration: Int, tickInterval: TimeInterval) {
    self.duration = duration
    self.tickInterval = tickInterval
  }
  
  func start() {
    DispatchQueue.main.async { [weak self] in
      guard let strongSelf = self else { return }
      
      if strongSelf.timer != nil {
        strongSelf.timer?.invalidate()
        strongSelf.timer = nil
      }
      
      strongSelf.timer = Timer.scheduledTimer(timeInterval: strongSelf.tickInterval, target: strongSelf, selector: #selector(strongSelf.handleTimerTrigger), userInfo: nil, repeats: true)
      strongSelf.timer?.fire()
      strongSelf.timerStarted?()
    }
  }
  
  func stop() {
    DispatchQueue.main.async { [weak self] in
      guard let strongSelf = self else { return }
      
      strongSelf.timer?.invalidate()
      strongSelf.timer = nil
      strongSelf.timerStopped?()
    }
  }
  
  @objc private func handleTimerTrigger() {
    if duration > 0 {
      timerFired?(duration)
      duration -= 1
      return
    }
    stop()
    timerCompleted?()
  }
  
}
