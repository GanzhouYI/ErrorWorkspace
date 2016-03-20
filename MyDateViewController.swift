//
//  MyDateViewController.swift
//  MYFrame
//
//  Created by __________V|R__________ on 16/3/20.
//  Copyright © 2016年 __________V|R__________. All rights reserved.
//

import UIKit

public protocol MyDatePickerViewControllerDelegate{
    func myPickDateViewControllerDidFinish(controller:MyDateViewController,andSelectedDate selected:NSDate)
}

public class MyDateViewController: UIViewController {

    public var delegate:MyDatePickerViewControllerDelegate?
    @IBAction func done(sender: UIButton) {
        self.hideInView()
        self.delegate?.myPickDateViewControllerDidFinish(self, andSelectedDate: self.datePickerView.date)
    }
    @IBAction func cancel(sender: UIButton) {
        self.hideInView()
    }
    
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    public init()
    {
        let resourcesBundle = NSBundle(forClass: MyDateViewController.self)
        super.init(nibName:"MyDateViewController",bundle:resourcesBundle)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func showInView(superview:UIView){
        if self.view.superview == nil
        {
            superview.addSubview(self.view)
        }
    
            self.view.center=CGPointMake(self.view.center.x, 900)
            self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, superview.frame.width, self.view.frame.height)
        
            UIView.animateWithDuration(0.5, delay: 0.2, options: .CurveEaseInOut, animations: { () -> Void in
        
            self.view.center = CGPointMake(superview.center.x, superview.frame.height - self.view.frame.height / 2)
        
            }, completion: nil)
    }
    
    public func hideInView() {
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.view.center = CGPointMake(self.view.center.x, 900)
            }, completion: nil)
    }

    
    
//    self.view.center=CGPointMake(self.view.center.x, 900)
//    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, superview.frame.width, self.view.frame.height)
//    
//    UIView.animateWithDuration(0.5, delay: 0.2, options: .CurveEaseInOut, animations: { () -> Void in
//    
//    self.view.center = CGPointMake(superview.center.x, superview.frame.height - self.view.frame.height / 2)
//
//    }, completion: nil)
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
