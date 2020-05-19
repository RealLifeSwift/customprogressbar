//Created by Real Life Swift on 16/02/2019

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var progressBar1: ProgressBar!
  @IBOutlet weak var progressBar2: ProgressBar!
  @IBOutlet weak var progressBar3: ProgressBar!
  
  var countFired: CGFloat = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  private func showCase() {
    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
      self.countFired += 1
      
      DispatchQueue.main.async {
        self.progressBar1.progress = min(CGFloat(0.04 * self.countFired), 1)
        self.progressBar2.progress = min(CGFloat(0.03 * self.countFired), 1)
        self.progressBar3.progress = min(CGFloat(0.02 * self.countFired), 1)
        
        if self.progressBar3.progress == 1 {
          timer.invalidate()
        }
      }
    }
  }
  
  @IBAction func didZeroButtonClicked(_ sender: Any) {
    self.progressBar1.progress = 0
    self.progressBar2.progress = 0
    self.progressBar3.progress = 0
  }
  
  @IBAction func did25ButtonClicked(_ sender: Any) {
    self.progressBar1.progress = 0.25
    self.progressBar2.progress = 0.25
    self.progressBar3.progress = 0.25
  }
  
  @IBAction func did50ButtonClicked(_ sender: Any) {
    self.progressBar1.progress = 0.5
    self.progressBar2.progress = 0.5
    self.progressBar3.progress = 0.5
  }
  
  @IBAction func did100ButtonClicked(_ sender: Any) {
    self.progressBar1.progress = 1
    self.progressBar2.progress = 1
    self.progressBar3.progress = 1
  }
}

