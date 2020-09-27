//
//  ViewController.swift
//  Examples
//
//  Created by Merrick Sapsford on 27/09/2020.
//

import UIKit
import Tabman
import Pageboy

class ViewController: TabmanViewController {
    
    private lazy var viewControllers = [
        ChildViewController(index: 1),
        ChildViewController(index: 2),
        ChildViewController(index: 3)
    ]
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataSource = self
        
        let bar = TMBarView.ButtonBar()
        addBar(bar.systemBar(), dataSource: self, at: .top)
    }
}

extension ViewController: PageboyViewControllerDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}

extension ViewController: TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        return TMBarItem(title: "Page \(index)")
    }
}
