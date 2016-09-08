//
//  ViewController.swift
//  tipster
//
//  Created by Amy Giver on 5/5/16.
//  Copyright © 2016 Amy Giver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var input: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var inputInt = String(0)
    var groupSize=Int(1)
    var minTipValue=Float(0)
    var minTipToAdd=Float(0)
    var medTipToAdd=Float(0)
    var largeTipToAdd=Float(0)
    var minPaymentPerPerson=Float(0)
    var medPaymentPerPerson=Float(0)
    var largePaymentPerPerson=Float(0)
    var minTipToDisplay=Float(0)
    var medTipToDisplay=Float(0)
    var largeTipToDisplay=Float(0)
    
    
    
    @IBOutlet weak var minTipCalculated: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipSliderLabel: UILabel!
    @IBOutlet weak var medTipSliderLabel: UILabel!
    @IBOutlet weak var largeTipSliderLabel: UILabel!
    @IBOutlet weak var groupSlider: UISlider!
    @IBOutlet weak var groupSizeLabel: UILabel!
    @IBOutlet weak var medTipCalculated: UILabel!
    @IBOutlet weak var largeTipCalculated: UILabel!
    @IBOutlet weak var minPerPerson: UILabel!
    @IBOutlet weak var medPerPerson: UILabel!
    @IBOutlet weak var largePerPerson: UILabel!
    @IBOutlet weak var decimalPointKey: UIButton!
    
    @IBAction func groupSliderSlid(sender: UISlider) {
        groupSize = Int(sender.value)
        groupSizeLabel.text="\(groupSize)"
        crunchTheNumbers()
    }
    
    func crunchTheNumbers(){
        minTipToAdd=round(Float(inputInt)!*Float(round(tipSlider.value)))/100
        medTipToAdd=round(Float(inputInt)!*Float(round(tipSlider.value+5)))/100
        largeTipToAdd=round(Float(inputInt)!*Float(round(tipSlider.value+10)))/100
        minTipToDisplay=round((minTipToAdd/Float(groupSize))*100)/100
        medTipToDisplay=round((medTipToAdd/Float(groupSize))*100)/100
        largeTipToDisplay=round((largeTipToAdd/Float(groupSize))*100)/100
        minTipCalculated.text=String(minTipToDisplay)
        medTipCalculated.text=String(medTipToDisplay)
        largeTipCalculated.text=String(largeTipToDisplay)
        minPaymentPerPerson=round(((Float(inputInt)!+Float(minTipToAdd))/Float(groupSize))*100)/100
        medPaymentPerPerson=round(((Float(inputInt)!+Float(medTipToAdd))/Float(groupSize))*100)/100
        largePaymentPerPerson=round(((Float(inputInt)!+Float(largeTipToAdd))/Float(groupSize))*100)/100
        minPerPerson.text=String(minPaymentPerPerson)
        medPerPerson.text=String(medPaymentPerPerson)
        largePerPerson.text=String(largePaymentPerPerson)
    }
    
    @IBAction func tipSliderSlid(sender: UISlider) {
        minTipValue=Float(round(sender.value))
        tipSliderLabel.text="\(minTipValue)%"
        medTipSliderLabel.text="\(minTipValue+5)%"
        largeTipSliderLabel.text="\(minTipValue+10)%"
//        minTipToAdd=round(Float(inputInt)!*Float(round(tipSlider.value)))/100
//        medTipToAdd=round(Float(inputInt)!*Float(round(tipSlider.value+5)))/100
//        largeTipToAdd=round(Float(inputInt)!*Float(round(tipSlider.value+10)))/100
        crunchTheNumbers()
    }

    @IBAction func keyPadPressed(sender: UIButton) {
        if(inputInt==String(0)){
            inputInt=String("")
        }
        if(sender.tag==0){
            inputInt+=String(0)
        }
        if(sender.tag==1){
            inputInt+=String(1)
        }
        if(sender.tag==2){
            inputInt+=String(2)
        }
        if(sender.tag==3){
            inputInt+=String(3)
        }
        if(sender.tag==4){
            inputInt+=String(4)
        }
        if(sender.tag==5){
            inputInt+=String(5)
        }
        if(sender.tag==6){
            inputInt+=String(6)
        }
        if(sender.tag==7){
            inputInt+=String(7)
        }
        if(sender.tag==8){
            inputInt+=String(8)
        }
        if(sender.tag==9){
            inputInt+=String(9)
        }
        if(sender.tag==11){
            inputInt+=String(".")
            sender.enabled=false
        }
        if(sender.tag==12){
            inputInt=String(0)
            minTipToAdd=Float(0)
            medTipToAdd=Float(0)
            largeTipToAdd=Float(0)
            decimalPointKey.enabled=true
        }
        input.hidden=false
        input.text=String(inputInt)
        crunchTheNumbers()
    }
}