//
//  ViewController.swift
//  Calculator
//
//  Created by  on 17/09/19.
//  Copyright © 2019 Michael Manning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // the new number displayed
    var numberOnScreen: Double = 0;

    // current number displayed on screen
    var previousNumber: Double = 0;

    // a toggle so that the code can decide to ignore math opperations or not
    var performingMath = false;

    // 0 is the default value - used to determine what opperator should be used
    var operation = 0;

    // bad name for function - this handles the user entering numbers and button presses for numbers
    @IBAction func zero(_ sender: UIButton) {
        if performingMath == true{

            output.text = String(sender.tag-1)
            // convert the output to a double but allow for a nil value
            numberOnScreen = Double(output.text!)!
            performingMath = false;
        }
        else {
            // show the numbers being entered
            output.text = output.text! + String(sender.tag-1)
            numberOnScreen = Double(output.text!)!
        }
    }

    @IBAction func buttons(_ sender: UIButton) {

        // if label is not empty and the user is not clearing the screen
        // or pressing =, run the following

        // this stops math from running if no numbers have been entered

        if (output.text != "" && sender.tag != 11 && sender.tag != 16){

            // show the user the previous number on screen
            previousNumber = Double(output.text!)!

            // clear label each time a math function is selected
            // divide
            if sender.tag == 12{
                output.text = "/";
            }

            // multiply
            if sender.tag == 13{
                output.text = "x";
            }

            // subtract
            if sender.tag == 14{
                output.text = "-";
            }

            // add
            if sender.tag == 15{
                output.text = "+";
            }

            // get the symbol and parse it to the math functions
            operation = sender.tag

            // do math
            performingMath = true;

        }

        // if user presses =
        else if sender.tag == 16{
            //divide math
            if operation == 12{

                // NOTE: divide by zero is handled automatically and just states "INF" on screen, this does not crash the application
                output.text = String(previousNumber / numberOnScreen)
            }
            //multiply math
            if operation == 13{
                output.text = String(previousNumber * numberOnScreen)
            }
            //subtract math
            if operation == 14{
                output.text = String(previousNumber - numberOnScreen)
            }
            //add math
            if operation == 15{
                output.text = String(previousNumber + numberOnScreen)
            }

        }

        // reset logic:
        // if cuser presses clear (AC)
        else if sender.tag == 11{
            output.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    @IBOutlet weak var output: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
