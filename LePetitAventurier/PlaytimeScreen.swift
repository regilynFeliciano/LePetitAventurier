//
//  PlaytimeScreen.swift
//  Le Petit Aventurier
//
//  Created by Regilyn Feliciano on 2016-03-14.
//  Copyright © 2016 Regilyn Feliciano. All rights reserved.
//

import UIKit

class PlaytimeScreen : UIViewController {
   var logView : CollectionViewController?
    var containerView : UIView?
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        /********************
        GRAPHICS
        */
        //set background colour
        let mainScreenSize : CGSize = UIScreen.mainScreen().bounds.size // Getting main screen size of iPhone
        let imageObbj:UIImage! =   self.imageResize(UIImage(named: "blue-polkadot-background.jpg")!, sizeChange: CGSizeMake(mainScreenSize.width, mainScreenSize.height))
        self.view.backgroundColor = UIColor(patternImage:imageObbj)
        
        /********************
         TITLE BUBBLE
         */
        let titleBubble = UILabel(frame: CGRect(x: 425, y: 50, width: 400, height: 100))
        //titleBubble.center = CGPointMake(self.view.center.x, titleBubble.center.y)
        titleBubble.text = "Playtime Stats"
        // Enum type, two variations:
        titleBubble.textAlignment = NSTextAlignment.Center
        titleBubble.textAlignment = .Center
        
        //shape and border
        titleBubble.layer.cornerRadius = 50   //for oval, radius is 1/2(height)
        titleBubble.layer.masksToBounds = true //need otherwise the corners will remain
        titleBubble.layer.borderWidth = 5
        titleBubble.layer.borderColor = UIColor.blueColor().CGColor
        view.addSubview(titleBubble)
        
        //colours
        titleBubble.backgroundColor = UIColor(red:0, green: 0, blue:0, alpha:0.8)
        titleBubble.textColor = UIColor.whiteColor()
        titleBubble.shadowColor = UIColor.blackColor()
        titleBubble.font = UIFont(name: "HelveticaNeue", size: CGFloat(50))
        
        /********************
         MENU PANEL STUFF
         */
         
         //panel colors:
        //let panelBackground = UIColor(red: 252/250, green: 255/255, blue: 235/255, alpha: 0.8)
        let panelBorder = UIColor(red: 155/250, green: 155/255, blue: 105/255, alpha: 1).CGColor
        
        let menuPanel = UILabel(frame: CGRect(x: 0, y: 0, width: 225, height: mainScreenSize.height))
        //        menuPanel.backgroundColor = UIColor(red: 242/250, green: 209/255, blue: 99/255, alpha: 1)
        menuPanel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        menuPanel.alpha = 1
        menuPanel.layer.borderColor = panelBorder
        menuPanel.layer.borderWidth = 3
        view.addSubview(menuPanel)
        
        /*back to menu button*/
        let menuColor = UIColor(red: 0, green: 230/255, blue: 77/255, alpha: 1)
        let menuBorderColor = UIColor(red: 0, green: 153/255, blue: 51/255, alpha: 1)
        let menuButton = UIButton(frame: CGRectMake(50, 650, 125, 50))
        //titleButton.center = view.center
        menuButton.setTitle("Menu", forState: .Normal)
        menuButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        menuButton.backgroundColor = menuColor
        menuButton.layer.cornerRadius = 10
        menuButton.layer.borderWidth = 3
        menuButton.layer.borderColor = menuBorderColor.CGColor
        
        /*log buttons*/
        let progressColor = UIColor(red: 102/250, green: 179/255, blue: 255/255, alpha: 1)
        let progressBorder = UIColor(red: 0/255, green: 115/255, blue: 1, alpha: 1).CGColor
        //current score progress
        let scoreButton = UIButton(frame: CGRectMake(0,100, 200, 125))
        scoreButton.setTitle("Current Score", forState: .Normal)
        scoreButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        //scoreButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        scoreButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(20))
        scoreButton.center = CGPointMake(menuButton.center.x, scoreButton.center.y)
        scoreButton.backgroundColor = progressColor
        scoreButton.layer.cornerRadius = 25
        scoreButton.layer.borderWidth = 2
        scoreButton.layer.borderColor = progressBorder
        //logtime button
        let logButton = UIButton(frame: CGRectMake(0,250, 200, 125))
        logButton.setTitle("Time Spent", forState: .Normal)
        logButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        //logButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        logButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(20))
        logButton.center = CGPointMake(menuButton.center.x, logButton.center.y)
        logButton.backgroundColor = progressColor
        logButton.layer.cornerRadius = 25
        logButton.layer.borderWidth = 2
        logButton.layer.borderColor = progressBorder
        
        
        //add nav buttons to view and functions
        view.addSubview(menuButton)
        view.addSubview(scoreButton)
        view.addSubview(logButton)
        menuButton.addTarget(self, action: "backToMenu:", forControlEvents: .TouchUpInside)
        scoreButton.addTarget(self, action: "toProgress:", forControlEvents: .TouchUpInside)
        
        
        
        //        logView?.configureCollectionView()
        
        containerView = UIView(frame: CGRect(x: 275, y: 200, width: 600, height: 550))
        containerView!.center = CGPointMake(titleBubble.center.x, containerView!.center.y)
        containerView?.layer.borderWidth = 2
        containerView?.layer.borderColor = UIColor.orangeColor().CGColor
        containerView?.layer.masksToBounds = true
        containerView?.layer.cornerRadius = 50
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        /*
        TABLE STUFF
        */
        
        logView = CollectionViewController()
        
        containerView!.addSubview(logView!.view)
        
        view.addSubview(containerView!)
        //self.presentViewController(logView!, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
        //hide the status bar
    }
    
    /*
    NAV BUTTON FUNCTIONS
    */
    //button functions
    func backToMenu(sender: UIButton)
    {
        let titleScreen:TitleScreen = TitleScreen()
        
        self.presentViewController(titleScreen, animated: true, completion: nil)
        
    }
    
    func toProgress(sender: UIButton)
    {
        let progressScreen:ProgressScreen = ProgressScreen()
        
        self.presentViewController(progressScreen, animated: false, completion: nil)
    }
    
        
    //resize image
    func imageResize (imageObj:UIImage, sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        imageObj.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
}