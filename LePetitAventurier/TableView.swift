////
////  TableView.swift
////  LePetitAventurier
////
////  Created by Regilyn Feliciano on 2016-03-15.
////  Copyright © 2016 Regilyn Feliciano. All rights reserved.
////
//
//import UIKit
//
//class TwoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //configure flowLayout
//        
//        //create a flowlayout and add it to collectionview
//        let flowLayout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
//        
//        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.backgroundColor = UIColor.cyanColor()
//        
//        self.view.addSubview(collectionView)
//    }
//    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
//    {
//        return 20
//    }
//    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
//    {
//        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath)
//        
//        cell.backgroundColor = UIColor.greenColor()
//        return cell
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
//    {
//        return CGSizeMake(50, 50)
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
//    {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
//    
//}