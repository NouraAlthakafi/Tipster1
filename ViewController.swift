//
//  ViewController.swift
//  Tipster
//
//  Created by admin on 10/12/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbBill: UILabel!
    
    @IBOutlet weak var lbTipEssentialPercent: UILabel!
    @IBOutlet weak var lbTipEssential: UILabel!
    @IBOutlet weak var lbTipEssentialTotal: UILabel!
    
    @IBOutlet weak var lbTip5percent: UILabel!
    @IBOutlet weak var lbTip5: UILabel!
    @IBOutlet weak var lbTip5total: UILabel!

    @IBOutlet weak var lbTip10percent: UILabel!
    @IBOutlet weak var lbTip10: UILabel!
    @IBOutlet weak var lbTip10total: UILabel!
    
    @IBOutlet weak var sliderTip: UISlider!
    
    @IBOutlet weak var lbGroupSize: UILabel!
    @IBOutlet weak var sliderGroupSize: UISlider!
    
    let btnNumbers = [UIButton]()
    
    @IBAction func btnNumbers(_ sender: UIButton) {
        if sender.titleLabel?.text == "0" {
            lbBill.text! += "0"
                }
        else if sender.titleLabel?.text == "1" {
                    lbBill.text! += "1"
                }
        else if sender.titleLabel?.text == "2" {
                    lbBill.text! += "2"
                }
        else if sender.titleLabel?.text == "3" {
                    lbBill.text! += "3"
                }
        else if sender.titleLabel?.text == "4" {
                    lbBill.text! += "4"
                }
        else if sender.titleLabel?.text == "5" {
                    lbBill.text! += "5"
                }
        else if sender.titleLabel?.text == "6" {
                    lbBill.text! += "6"
                }
        else if sender.titleLabel?.text == "7" {
                    lbBill.text! += "7"
                }
        else if sender.titleLabel?.text == "8" {
                    lbBill.text! += "8"
                }
        else if sender.titleLabel?.text == "9" {
                    lbBill.text! += "9"
                }
        else {
            if lbBill.text!.contains(".") {
                        return
                    }
                    lbBill.text! += "."
        }
        calculate()
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        lbBill.text = ""
    }
        
    @IBAction func sliderTipAction(_ sender: UISlider) {
        lbTipEssentialPercent.text = "\(Int(sender.value))%"
        lbTip5percent.text = "\(Int(sender.value) + 5)%"
        lbTip10percent.text = "\(Int(sender.value) + 10)%"
        
        calculate()
    }
    
    @IBAction func sliderGroupSizeAction(_ sender: UISlider) {
        lbGroupSize.text = "Group Size: \(Int(sender.value))"
        
        calculate()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbBill.text = ""
    }
    
    func calculate() {
        let essentialTip = (lbTipEssentialPercent.text! as NSString).doubleValue
        let tip5 = (lbTip5percent.text! as NSString).doubleValue
        let tip10 = (lbTip10percent.text! as NSString).doubleValue
        let bill = (lbBill.text! as NSString).doubleValue
        let groupNumber = Double (Int(sliderGroupSize.value))
                        
        // The Tip
        lbTipEssential.text = String(format: "%.2f%", (bill * essentialTip / 100) / groupNumber)
        lbTip5.text = String(format: "%.2f%", (bill * tip5 / 100) / groupNumber)
        lbTip10.text = String(format: "%.2f%", (bill * tip10 / 100) / groupNumber)
        
        // The Total Bill + The Tip
        lbTipEssentialTotal.text = String(format: "%.2f%" , (bill * essentialTip / 100 + bill)/groupNumber)
        lbTip5total.text = String(format: "%.2f%" , (bill * tip5 / 100 + bill )/groupNumber)
        lbTip10total.text = String(format: "%.2f%" , (bill * tip10 / 100 + bill )/groupNumber)
    }
}
