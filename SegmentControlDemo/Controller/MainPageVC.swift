//
//  MainPageVC.swift
//  SegmentControlDemo
//
//  Created by nabinrai on 9/12/17.
//  Copyright © 2017 nabin. All rights reserved.
//

import UIKit

class MainPageVC: UIPageViewController {
    
    
    var currentIndex = 0
    
    private(set) lazy var ViewControllers: [UIViewController] = {
        
        return [self.newViewController(nameOfVC: "YellowVC",VCID:"YellowVCID"),
                self.newViewController(nameOfVC: "GreenVC",VCID:"GreenVCID"),self.newViewController(nameOfVC: "BrownVC",VCID:"BrownVCID")]
    }()
    
    private func newViewController(nameOfVC: String, VCID: String) -> UIViewController {
        let vc =  UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: VCID)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        moveToSelectedIndex(index: currentIndex, direction:.forward)
    }
    
    
    //MARK: Paging setUp
    
    
    
    
    func moveToSelectedIndex(index: Int, direction:UIPageViewControllerNavigationDirection){
        print(index)
        self.setViewControllers([ViewControllers[index]], direction: direction, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
}

extension MainPageVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let Index = ViewControllers.index(of: viewController) else {return nil}
        let previousIndex = Index - 1
        guard previousIndex >= 0 else {return nil}
        guard ViewControllers.count > previousIndex else {return nil}
        return ViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let Index = ViewControllers.index(of: viewController) else {return nil}
        let nextIndex = Index + 1
        let viewControllersCount = ViewControllers.count
        guard viewControllersCount != nextIndex else {return nil}
        guard viewControllersCount > nextIndex else {return nil}
        return ViewControllers[nextIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
        if (!completed){ return}
        guard let currentVC = pageViewController.viewControllers!.first else{ return }
        guard let Index = ViewControllers.index(of: currentVC) else { return }
        print(Index)
        self.currentIndex = Index
        if let parent = self.parent as? FirstVC{
            parent.selectBetterSegmentedControlAt(current_PageIndex: Index)
            
        }
        
    }
    
    
    
    
    
}

