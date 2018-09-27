//
//  ViewController.swift
//  Le petit Aventurier
//
//  Created by Archana Gumber on 2016-03-13.
//  Copyright © 2016 Archana Gumber. All rights reserved.
//

import UIKit

class FlashcardGame: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mainScreenSize : CGSize = UIScreen.mainScreen().bounds.size // Getting main screen size of iPhone
        let imageObbj:UIImage! =   self.imageResize(UIImage(named: "orange-polkadot-background.jpg")!, sizeChange: CGSizeMake(mainScreenSize.width, mainScreenSize.height))
        
        self.view.backgroundColor = UIColor(patternImage:imageObbj)
        
        /********************
         SPEECH BUBBLE
         */
        let speechBubble = UILabel(frame: CGRect(x: 350, y: 50, width: 700, height: 200))
        speechBubble.center = CGPointMake(self.view.center.x, speechBubble.center.y)
        speechBubble.text = "Chat"
        // Enum type, two variations:
        speechBubble.textAlignment = NSTextAlignment.Center
        speechBubble.textAlignment = .Center
        //speechBubble.center = view.center
        
        //shape and border
        speechBubble.layer.cornerRadius = 100  //for oval, radius is 1/2(height)
        speechBubble.layer.masksToBounds = true //need otherwise the corners will remain
        speechBubble.layer.borderWidth = 5
        speechBubble.layer.borderColor = UIColor.blueColor().CGColor
        view.addSubview(speechBubble)
        
        //colours
        speechBubble.backgroundColor = UIColor(red:0, green: 0, blue:0, alpha:0.8)
        speechBubble.textColor = UIColor.whiteColor()
        speechBubble.shadowColor = UIColor.blackColor()
        speechBubble.font = UIFont(name: "HelveticaNeue", size: CGFloat(50))
        
        /********************
         MENU STUFF
         */
        let menuColor = UIColor(red: 0, green: 230/255, blue: 77/255, alpha: 1)
        let menuBorderColor = UIColor(red: 0, green: 153/255, blue: 51/255, alpha: 1)
        //let menuButton = UIButton(frame: CGRectMake(50, 650, 125, 50))
        let menuButton = UIButton(frame: CGRectMake(875, 50, 125, 50))
        //titleButton.center = view.center
        menuButton.setTitle("Menu", forState: .Normal)
        menuButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        menuButton.backgroundColor = menuColor
        menuButton.layer.cornerRadius = 10
        menuButton.layer.borderWidth = 3
        menuButton.layer.borderColor = menuBorderColor.CGColor
        
        //add nav buttons to view and functions
        view.addSubview(menuButton)
        menuButton.addTarget(self, action: "backToMenu:", forControlEvents: .TouchUpInside)
        
        /********************
         ADD FLASHCARDS
         */
        
        let flashcardColor = UIColor(red: 214/255, green: 245/255, blue: 245/255, alpha: 1)
        let flashcardBorder = UIColor(red: 0/255, green: 45/255, blue: 179/255, alpha: 1)
        
        //create flashcards
        
        let flash1 = UIImage(named: "bird.jpg")
        let flashcard1 = UIButton(frame: CGRectMake(310, 285, 350, 200))
        flashcard1.center = CGPointMake(self.view.center.x-185, flashcard1.center.y)
        flashcard1.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        flashcard1.setImage(flash1, forState: UIControlState.Normal)
        flashcard1.backgroundColor = flashcardColor
        flashcard1.layer.cornerRadius = 20
        flashcard1.layer.borderWidth = 5
        flashcard1.layer.masksToBounds = true
        flashcard1.layer.borderColor = flashcardBorder.CGColor
        
        let flash2 = UIImage(named: "snake.jpg")
        let flashcard2 = UIButton(frame: CGRectMake(710, 285, 350, 200))
        flashcard2.center = CGPointMake(self.view.center.x+185, flashcard2.center.y)
        flashcard2.imageView?.contentMode = UIViewContentMode.ScaleAspectFit    //make it fit in button
        flashcard2.setImage(flash2, forState: UIControlState.Normal)
        flashcard2.backgroundColor = flashcardColor
        flashcard2.layer.cornerRadius = 20
        flashcard2.layer.borderWidth = 5
        flashcard2.layer.masksToBounds = true
        flashcard2.layer.borderColor = flashcardBorder.CGColor
        
        let flash3 = UIImage(named: "cat.png")
        let flashcard3 = UIButton(frame: CGRectMake(310, 500, 350, 200))
        flashcard3.center = CGPointMake(self.view.center.x-185, flashcard3.center.y)
        flashcard3.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        flashcard3.setImage(flash3, forState: UIControlState.Normal)
        flashcard3.backgroundColor = flashcardColor
        flashcard3.layer.cornerRadius = 20
        flashcard3.layer.borderWidth = 5
        flashcard3.layer.masksToBounds = true
        flashcard3.layer.borderColor = flashcardBorder.CGColor
        
        let flash4 = UIImage(named: "dog.jpeg")
        let flashcard4 = UIButton(frame: CGRectMake(710, 500, 350, 200))
        flashcard4.center = CGPointMake(self.view.center.x+185, flashcard4.center.y)
        flashcard4.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        flashcard4.setImage(flash4, forState: UIControlState.Normal)
        flashcard4.backgroundColor = flashcardColor
        flashcard4.layer.cornerRadius = 20
        flashcard4.layer.borderWidth = 5
        flashcard4.layer.masksToBounds = true
        flashcard4.layer.borderColor = flashcardBorder.CGColor

        //add flashcards to subview
        view.addSubview(flashcard1)
        view.addSubview(flashcard2)
        view.addSubview(flashcard3)
        view.addSubview(flashcard4)
        
        
        /********************
         POINTS
         */
        let panelBackground = UIColor(red: 252/250, green: 255/255, blue: 235/255, alpha: 0.8)
        let panelBorder = UIColor(red: 155/250, green: 155/255, blue: 105/255, alpha: 1).CGColor
        
        let pointsPanel = UILabel(frame: CGRect(x: 1120, y: 600, width: 140, height: 50))
        pointsPanel.center = CGPointMake(menuButton.center.x+12, pointsPanel.center.y)
        pointsPanel.backgroundColor = panelBackground
        //shape and border
        pointsPanel.layer.cornerRadius = 25
        pointsPanel.layer.masksToBounds = true
        pointsPanel.layer.borderColor = panelBorder
        pointsPanel.layer.borderWidth = 2
        view.addSubview(pointsPanel)
        
        let points = UILabel(frame: CGRect(x: 1120, y: 600, width: 125, height: 50))
        points.center = CGPointMake(menuButton.center.x+10, points.center.y)
        points.text = "Points: 0"
        // Enum type, two variations:
        //points.textAlignment = NSTextAlignment.Center
        points.textAlignment = .Right
        view.addSubview(points)
        
        //colours
        points.backgroundColor = UIColor(red:0, green: 0, blue:0, alpha:0)
        points.textColor = UIColor.blackColor()
        //points.shadowColor = UIColor.blackColor()
        points.font = UIFont(name: "HelveticaNeue", size: CGFloat(20))
        
        
        /********************
         TIME LEFT
         */
        let remPanel = UILabel(frame: CGRect(x: 1120, y: 650, width: 140, height: 50))
        remPanel.center = CGPointMake(menuButton.center.x+12, remPanel.center.y)
        remPanel.backgroundColor = panelBackground
        //shape and border
        remPanel.layer.cornerRadius = 25
        remPanel.layer.masksToBounds = true
        remPanel.layer.borderColor = panelBorder
        remPanel.layer.borderWidth = 2
        view.addSubview(remPanel)
        
        let remTime = UILabel(frame: CGRect(x: 1120, y: 650, width: 125, height: 50))
        remTime.center = CGPointMake(menuButton.center.x+10, remTime.center.y)
        remTime.text = "Time Left: 0"
        // Enum type, two variations:
        //remTime.textAlignment = NSTextAlignment.Center
        remTime.textAlignment = .Right
        view.addSubview(remTime)
        
        //colours
        remTime.backgroundColor = UIColor(red:0, green: 0, blue:0, alpha:0)
        remTime.textColor = UIColor.blackColor()
        //remTime.shadowColor = UIColor.blackColor()
        remTime.font = UIFont(name: "HelveticaNeue", size: CGFloat(20))

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
        //hide the status bar
    }
    
    func backToMenu(sender: UIButton)
    {
        let titleScreen:TitleScreen = TitleScreen()
    
        self.presentViewController(titleScreen, animated: true, completion: nil)
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

