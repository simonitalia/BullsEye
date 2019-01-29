//
//  ViewController.swift
//  BullsEye
//
//  Created by Simon Italia on 4/19/18.
//  Copyright © 2018 SDI Group Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue = 0
    @IBOutlet weak var targetLabel: UILabel!
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    var round = 0
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()  // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value) // This converts slider.value to the nearest rounded number/integer as the default slider values have many decimal values
        startOver()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") // Instead of referening the image from the Assets catalogue UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight") //Left this code here so you can see diff between image literal above and when writing the asset reference out. Also why the below has a questionmark as swift in this case isn't sure if there will be an image with the string name you are passing
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    //Organize Lables
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound() {
        round += 1 //Track rounds. Same as round = round + 1
        targetValue = 1 + Int(arc4random_uniform(100)) //Set randomized Target Value
        currentValue = 50 // Set Default currentValue to 50 when App launhces
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Display slider value in the Alert in UI
    @IBAction func sliderMoved (_ slider: UISlider){
        currentValue = lroundf(slider.value)
        print("The value of slider is now: \(slider.value)")
    }
   
    //Declare Alert after Hit Me / action button is tapped
    @IBAction func showAlert() {
        //Calcualte the difference between slider value and target value
        let difference = abs(targetValue - currentValue) //abs = short for absolute and is a built in function to convert negatives to postive values
        var points = 100 - difference
        //Set the showAlert Title value, depending on user's score
        let title: String //String type must be set here as compiler doesn't have enough information to determine type at this point / time. It's not set until later, below in the if/else statetments
        var alertAction = "Try Again"
        if difference == 0 {
            title = "Bull's Eye!"
            points += 100
            alertAction = "Play again"
        }   else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        }   else if difference < 10 {
            title = "Pretty good!"
        }   else {
            title = "Phst! Not even close..."
        }
        
        score += points //This is shorthand for score = score + points
        
        let message = "You scored \(points) points \n(Slider value is \(currentValue))"
        //Alert contents
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //Dismiss Alert
        let action = UIAlertAction(title: alertAction, style: .default, handler: {
                action in
            self.startNewRound()
            })
        
        alert.addAction(action)
        
        present (alert, animated: true, completion: nil)
    }
    //Reset Games when start Over Button is tapped
    @IBAction func startOver() {
    score = 0
    round = 0
    startNewRound()
    }
    
}

