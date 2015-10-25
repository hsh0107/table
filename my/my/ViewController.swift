//
//  ViewController.swift
//  my
//
//  Created by hsh on 10/25/15.
//  Copyright (c) 2015 hsh. All rights reserved.
//


import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var imageView:UIImageView?
    var tmpView:UIView?
    var table:UITableView?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        customUI()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "coo")
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func customUI(){
        self.table = UITableView(frame: view.bounds)
        self.table?.dataSource = self
        self.table?.delegate = self
        
        self.table?.contentInset = UIEdgeInsetsMake(255, 0, 0, 0)
        self.tmpView = UIView(frame: CGRectMake(0, 0, view.frame.width, 64))
        self.tmpView?.backgroundColor = UIColor.redColor()
        self.tmpView?.alpha = 0.0
        
        self.imageView = UIImageView(frame: CGRectMake(0, 0, view.frame.width, 255))
        self.imageView?.image = UIImage(named: "rr.png")
        view.addSubview(table!)
        view.addSubview(imageView!)
        view.addSubview(tmpView!)
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        println(scrollView.contentOffset.y)
        if scrollView.contentOffset.y >= -255.0
        {
            self.imageView?.frame.origin.y = -scrollView.contentOffset.y - 255
            if scrollView.contentOffset.y < 64 - 255 && scrollView.contentOffset.y < 0 {
                
                self.tmpView?.alpha = (255 - abs(scrollView.contentOffset.y))/64
                println(self.tmpView?.alpha)
            }
        }else{
            
            self.tmpView?.alpha = 0.0
            var ro = -255 - scrollView.contentOffset.y
            var frame = self.imageView?.frame
            self.imageView!.frame = CGRectMake(-ro/2, 0,self.view.frame.width + ro , 255 + ro)
            
            
            
            //         self.imageView?.frame.width = view.frame.width  + ro
            //         self.imageView?.bounds.height += ro
            
        }
    }
}
