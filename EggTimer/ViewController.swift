import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var eggTimes:[String:Int]=["Soft":5,"Medium":7,"Hard":12]
    var totalTime=0
    var secondsPassed=0
    var timer=Timer()
    var player: AVAudioPlayer?
//    var player: AVAudioPlayer?
         @IBAction func hardnessSelected(_ sender: UIButton) {
         timer.invalidate()
        let hardness=sender.currentTitle!
//        print(eggTimes[hardness]!)
        totalTime=eggTimes[hardness]!
             progressBar.progress=0.0
             secondsPassed=0
             label.text=hardness
             let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
             player = try! AVAudioPlayer(contentsOf: url!)
        timer=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed <= self.totalTime {
                let progressPercentage=Float(self.secondsPassed) / Float(self.totalTime)
                self.progressBar.progress=progressPercentage
                self.secondsPassed += 1
            }
            else{
                Timer.invalidate()
                self.label.text="Done"
                self.player!.play()
            }
            
            
        }
        
    }
    
}


