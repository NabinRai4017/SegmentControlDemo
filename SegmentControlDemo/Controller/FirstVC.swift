//
//  FirstVC.swift
//  SegmentControlDemo
//
//  Created by nabinrai on 9/12/17.
//  Copyright © 2017 nabin. All rights reserved.
//

import UIKit
import BetterSegmentedControl



class FirstVC: UIViewController {

    @IBOutlet weak var betterSegmentController: BetterSegmentedControl!
    
    var mainPageVC: MainPageVC!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingForSegmentController()
        setDefaultPageInSegmentPagecontroller()
        

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MainPageVC,
            segue.identifier == "toMainPageController" {
            self.mainPageVC = vc
        }
    }
    
   

    private func setDefaultPageInSegmentPagecontroller(){
        let current_Index = UserDefaultsHandler().getUDValue(key:"key") as? Int ?? 0
        selectBetterSegmentedControlAt(current_PageIndex: current_Index)
        mainPageVC.moveToSelectedIndex(index: current_Index,direction: .forward)
        
    }
    
    func settingForSegmentController(){
        
        betterSegmentController.titles = ["Yellow","Green","Brown"]
        betterSegmentController.indicatorViewBackgroundColor = .purple
        betterSegmentController.customViewWidth = self.view.frame.width-40
        betterSegmentController.backgroundColor = .black
        betterSegmentController.titleFont = UIFont(name: "HelveticaNeue", size: 14.0)!
        betterSegmentController.selectedTitleFont = UIFont(name: "HelveticaNeue-Medium", size: 14.0)!
        betterSegmentController.titleColor = .white
        betterSegmentController.addTarget(self, action: #selector(self.betterSegmentControlValueChanged(_:)), for: .valueChanged)
    }
    
    
    @objc func betterSegmentControlValueChanged(_ sender: BetterSegmentedControl) {
        
        UserDefaultsHandler().setToUD(key: "key", value: sender.index as AnyObject)
        switch sender.index {
        case 0:
            mainPageVC.moveToSelectedIndex(index: 0,direction: .reverse)
            print("0")
            break
        case 1:
            if sender.oldIndex < 1{
                mainPageVC.moveToSelectedIndex(index: 1,direction: .forward)
            } else if sender.oldIndex > 1{
                mainPageVC.moveToSelectedIndex(index: 1,direction: .reverse)
            }
            print("1")
            break
        case 2:
            mainPageVC.moveToSelectedIndex(index: 2,direction: .forward)
            print("2")
            break
        default:break
        }
    }
    
    
    
    func selectBetterSegmentedControlAt(current_PageIndex: Int){
        do {
            try betterSegmentController.setIndex(UInt(current_PageIndex), animated: false)
        }
        catch BetterSegmentedControl.IndexError.indexBeyondBounds(let invalidIndex) {
            print("Tried setting invalid index \(invalidIndex) to demonstrate error handling.")
        }
        catch {
            print("An error occured")
        }
    }
}
