//
//  ViewController.swift
//  TestUICollectionPaged
//
//  Created by fauquette fred on 29/07/15.
//  Copyright (c) 2015 mobi.inthepocket. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func  collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func  collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! TestCollectionViewCell
        cell.numberLabel.text = "cell \(indexPath.row)"

        return cell
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth : Double = 240 + 10 // the size of the collectionView Cell + space between cell
        let page = Int(floor((Double(scrollView.contentOffset.x) - Double(20)) / pageWidth)) // the cell actually displayed
        let add = velocity.x > 0 ? 1 : 0
        let targetedPage = page + add
        var spacer :Double = 10 //the spacer between cell
        if targetedPage == 0 {
            spacer = 20 //when cell 0 then we need to kill the inset and go back to 0 :-)
        }
        let newOffSet = CGFloat(20 + Double(targetedPage) * pageWidth - spacer) // 20 for the inset
        targetContentOffset.memory.x = newOffSet
    }


}

class TestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
}

