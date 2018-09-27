//
//  SettingsPage.swift
//  Le Petit Aventurier
//
//  Created by Regilyn Feliciano on 2016-03-11.
//  Copyright © 2016 Regilyn Feliciano. All rights reserved.
//

import UIKit

class SettingsPage : UIViewController {
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
        let titleBubble = UILabel(frame: CGRect(x: 350, y: 50, width: 700, height: 200))
        titleBubble.center = CGPointMake(self.view.center.x, titleBubble.center.y)
        titleBubble.text = "Settings"
        // Enum type, two variations:
        titleBubble.textAlignment = NSTextAlignment.Center
        titleBubble.textAlignment = .Center
        
        //shape and border
        titleBubble.layer.cornerRadius = 100   //for oval, radius is 1/2(height)
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
           MUSIC PANEL
         */
        //panel colors:
        let panelBackground = UIColor(red: 252/250, green: 255/255, blue: 235/255, alpha: 1)
//        let panelBorder = UIColor(red: 155/250, green: 155/255, blue: 105/255, alpha: 1).CGColor
        let panelFont = UIFont(name: "HelveticaNeue", size: CGFloat(40))
        
        //create and place music panel
        let musicPanel = UILabel(frame: CGRect(x: 0, y: 325, width: 900, height: 100))
        musicPanel.center = CGPointMake(self.view.center.x, musicPanel.center.y)
        musicPanel.backgroundColor = panelBackground
        //shape and border
        musicPanel.layer.cornerRadius = 25
        musicPanel.layer.masksToBounds = true
        musicPanel.layer.borderColor = UIColor.orangeColor().CGColor
        musicPanel.layer.borderWidth = 2
        view.addSubview(musicPanel)
        
        //main music panel label
        let musicLabel = UILabel(frame: CGRect(x: 125, y: 325, width: 200, height: 100))
        musicLabel.text = "Music"
        musicLabel.font = panelFont
        view.addSubview(musicLabel)
        
        
        //add the slider
        let musicSlider = UISlider(frame:CGRectMake(375, musicPanel.center.y-15, 300, 40))
        musicSlider.minimumValue = 0
        musicSlider.maximumValue = 100
        musicSlider.continuous = true
        musicSlider.tintColor = UIColor.blueColor()
        musicSlider.value = 100
//        musicSlider.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
        self.view.addSubview(musicSlider)
        
        //add the "checkbox" (switch)
        let musicSwitch = UISwitch(frame:CGRectMake(800, musicPanel.center.y-10 , 50, 30))
        musicSwitch.setOn(false, animated: false)
        //musicSwitch.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        self.view.addSubview(musicSwitch)
        
        //music mute label
        let muteMusicLabel = UILabel(frame: CGRect(x: 750, y: 300, width: 100, height: 100))
        muteMusicLabel.center = CGPointMake(musicSwitch.center.x, muteMusicLabel.center.y)
        muteMusicLabel.text = "Mute Music:"
        muteMusicLabel.font = UIFont(name: "HevelticaNeue", size: CGFloat(40))
        view.addSubview(muteMusicLabel)
        
        /********************
            VOICEOVER PANEL
         */
        
        //create and place voiceover panel
        let voicePanel = UILabel(frame: CGRect(x: 0, y: 435, width: 900, height: 100))
        voicePanel.center = CGPointMake(self.view.center.x, voicePanel.center.y)
        voicePanel.backgroundColor = panelBackground
        //shape and border
        voicePanel.layer.cornerRadius = 25
        voicePanel.layer.masksToBounds = true
        voicePanel.layer.borderColor = UIColor.orangeColor().CGColor
        voicePanel.layer.borderWidth = 2
        view.addSubview(voicePanel)
        
        //main music panel label
        let voiceLabel = UILabel(frame: CGRect(x: 125, y: 435, width: 200, height: 100))
        voiceLabel.text = "Voice Over"
        voiceLabel.font = panelFont
        view.addSubview(voiceLabel)
        
        //add the slider
        let voiceSlider = UISlider(frame:CGRectMake(375, voicePanel.center.y-15, 300, 40))
        voiceSlider.minimumValue = 0
        voiceSlider.maximumValue = 100
        voiceSlider.continuous = true
        voiceSlider.tintColor = UIColor.blueColor()
        voiceSlider.value = 100
//        voiceSlider.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
        self.view.addSubview(voiceSlider)
        
        //add the "checkbox" (switch)
        let voiceSwitch = UISwitch(frame:CGRectMake(800, voicePanel.center.y-10 , 50, 30))
        voiceSwitch.setOn(false, animated: false)
        //musicSwitch.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged)
        self.view.addSubview(voiceSwitch)
        
        //music mute label
        let muteVoiceLabel = UILabel(frame: CGRect(x: 750, y: 410, width: 100, height: 100))
        muteVoiceLabel.center = CGPointMake(voiceSwitch.center.x, muteVoiceLabel.center.y)
        muteVoiceLabel.text = "Mute Voices:"
        muteVoiceLabel.font = UIFont(name: "HevelticaNeue", size: CGFloat(40))
        view.addSubview(muteVoiceLabel)
         
        /********************
            MENU STUFF
         */
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
        
        //add nav buttons to view and functions
        view.addSubview(menuButton)
        menuButton.addTarget(self, action: "backToMenu:", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        //hide the status bar
        return true
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
    
    /********************
        SLIDER FUNCTIONS
    */
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