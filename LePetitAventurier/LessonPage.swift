//
//  ViewController.swift
//  Le petit Aventurier
//
//  Created by Archana Gumber on 2016-03-13.
//  Copyright © 2016 Archana Gumber. All rights reserved.
//

import UIKit

class LessonPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mainScreenSize : CGSize = UIScreen.mainScreen().bounds.size // Getting main screen size of iPhone
        let imageObbj:UIImage! =   self.imageResize(UIImage(named: "orange-polkadot-background.jpg")!, sizeChange: CGSizeMake(mainScreenSize.width, mainScreenSize.height))
        
        self.view.backgroundColor = UIColor(patternImage:imageObbj)
        
        /********************
         SPEECH BUBBLE
         */
        let speechBubble = UILabel(frame: CGRect(x: 350, y: 50, width: 700, height: 150))
        speechBubble.center = CGPointMake(self.view.center.x, speechBubble.center.y)
        speechBubble.text = "Choose a Lesson!"
        // Enum type, two variations:
        speechBubble.textAlignment = NSTextAlignment.Center
        speechBubble.textAlignment = .Center
        //speechBubble.center = view.center
        
        //shape and border
        speechBubble.layer.cornerRadius = 75   //for oval, radius is 1/2(height)
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
         LESSONS
        */
        
         
        let flashcardBorder = UIColor(red: 0/255, green: 45/255, blue: 179/255, alpha: 1).CGColor
        
        let lesson1 = UIButton(frame: CGRect(x: 400, y: 250, width: 300, height: 125))
        lesson1.center = CGPointMake(self.view.center.x, lesson1.center.y)
        lesson1.setTitle("Shapes and Colors", forState: .Normal)
        
        //shape and border
        lesson1.layer.cornerRadius = 62   //for oval, radius is 1/2(height)
        lesson1.layer.masksToBounds = true //need otherwise the corners will remain
        lesson1.layer.borderWidth = 5
        lesson1.layer.borderColor = flashcardBorder
        view.addSubview(lesson1)
        
        //colours
        lesson1.backgroundColor = UIColor(red: 0, green: 115/255, blue: 230/255, alpha: 0.8)
        lesson1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        lesson1.setTitleShadowColor(UIColor.whiteColor(), forState: .Normal)
        lesson1.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(30))
        
        let lesson2 = UIButton(frame: CGRect(x: 575, y: 415, width: 300, height: 125))
        lesson2.center = CGPointMake(lesson1.center.x+225, lesson2.center.y)
        lesson2.setTitle("People", forState: .Normal)
        
        //shape and border
        lesson2.layer.cornerRadius = 62   //for oval, radius is 1/2(height)
        lesson2.layer.masksToBounds = true //need otherwise the corners will remain
        lesson2.layer.borderWidth = 5
        lesson2.layer.borderColor = flashcardBorder
        view.addSubview(lesson2)
        
        let lesson3 = UIButton(frame: CGRect(x: 100, y: 415, width: 300, height: 125))
        lesson3.center = CGPointMake(lesson1.center.x-225, lesson3.center.y)
        lesson3.setTitle("Places", forState: .Normal)
        
        //shape and border
        lesson3.layer.cornerRadius = 62   //for oval, radius is 1/2(height)
        lesson3.layer.masksToBounds = true //need otherwise the corners will remain
        lesson3.layer.borderWidth = 5
        lesson3.layer.borderColor = flashcardBorder
        view.addSubview(lesson3)
        
        let lesson4 = UIButton(frame: CGRect(x: 150, y: 580, width: 300, height: 125))
        lesson4.center = CGPointMake(lesson1.center.x+175, lesson4.center.y)
        lesson4.setTitle("Grammar", forState: .Normal)
        
        //shape and border
        lesson4.layer.cornerRadius = 62   //for oval, radius is 1/2(height)
        lesson4.layer.masksToBounds = true //need otherwise the corners will remain
        lesson4.layer.borderWidth = 5
        lesson4.layer.borderColor = flashcardBorder
        view.addSubview(lesson4)
        
        let lesson5 = UIButton(frame: CGRect(x: 525, y: 580, width: 300, height: 125))
        lesson5.center = CGPointMake(lesson1.center.x-175, lesson5.center.y)
        lesson5.setTitle("Animals", forState: .Normal)
        
        //shape and border
        lesson5.layer.cornerRadius = 62   //for oval, radius is 1/2(height)
        lesson5.layer.masksToBounds = true //need otherwise the corners will remain
        lesson5.layer.borderWidth = 5
        lesson5.layer.borderColor = flashcardBorder
        view.addSubview(lesson5)
        
        lesson2.backgroundColor = UIColor(red: 172/255, green: 0/255, blue: 230/255, alpha: 0.8)
        lesson2.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        lesson2.setTitleShadowColor(UIColor.whiteColor(), forState: .Normal)
        lesson2.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(30))
        
        lesson3.backgroundColor = UIColor(red: 230, green: 172/255, blue: 0, alpha: 0.8)
        lesson3.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        lesson3.setTitleShadowColor(UIColor.whiteColor(), forState: .Normal)
        lesson3.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(30))

        lesson4.backgroundColor = UIColor(red: 230, green: 0, blue: 0, alpha: 0.8)
        lesson4.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        lesson4.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        lesson4.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(30))
        
        lesson5.backgroundColor = UIColor(red: 0, green: 230/255, blue: 57/255, alpha: 0.8)
        lesson5.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        lesson5.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        lesson5.titleLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(30))

        /********************
         MENU STUFF
         */
        let menuColor = UIColor(red: 0, green: 230/255, blue: 77/255, alpha: 1)
        let menuBorderColor = UIColor(red: 0, green: 153/255, blue: 51/255, alpha: 1)
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
        lesson5.addTarget(self, action: "toLessons:", forControlEvents: .TouchUpInside)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
        //hide the status bar
    }
    
    /************
        MENU NAV
     */
    func backToMenu(sender: UIButton)
    {
        let titleScreen:TitleScreen = TitleScreen()
        
        self.presentViewController(titleScreen, animated: true, completion: nil)
        
    }
    
    func toLessons(sender: UIButton)
    {
        let flashcardLesson:FlashcardLesson = FlashcardLesson()
        
        self.presentViewController(flashcardLesson, animated: true, completion: nil)
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

