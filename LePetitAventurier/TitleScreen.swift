//
//  ViewController.swift
//  Le Petit Aventurier
//
//  Regilyn Feliciano
//  200325943
//
//  Archana Gumber
//  200312453
//
//  Assignment 1 part 2

import UIKit

class TitleScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        // Do any additional setup after loading the view, typically from a nib.
        
        /*****************************************************
            GRAPHICS
        */
        //resize and add background image
        let mainScreenSize : CGSize = UIScreen.mainScreen().bounds.size // Getting main screen size of iPhone
        let imageObbj:UIImage! =   self.imageResize(UIImage(named: "eiffel.jpg")!, sizeChange: CGSizeMake(mainScreenSize.width, mainScreenSize.height))
        
        self.view.backgroundColor = UIColor(patternImage:imageObbj)
        
        //add graphics
        let titleName = "title.png"
        let titleImage = UIImage(named: titleName)
        let titleView = UIImageView(image: titleImage!)
        titleView.frame = CGRect(x: 50, y: 75, width: 550, height: 250)
        view.addSubview(titleView)
        
        let mascotName = "Aventurier-1.png"
        let image = UIImage(named: mascotName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 590, y:340, width: 425, height: 425)
        view.addSubview(imageView)
        
        /*****************************************************
         CREATE AND ADD BUTTON COMPONENTS
        */
        
        let optionsColor = UIColor.whiteColor()
        
        //make a button (start lessons)
        let titleButton = UIButton(frame: CGRectMake(125, 375, 300, 75))
        //titleButton.center = view.center
        titleButton.setTitle("Start Lessons", forState: .Normal)
        titleButton.setTitleColor(optionsColor, forState: .Normal)
        titleButton.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
        titleButton.layer.cornerRadius = 10
        
        //make progress button
        let progressButton = UIButton(frame: CGRectMake(125,475,300,75))
        progressButton.setTitle("Track Progress", forState: .Normal)
        progressButton.setTitleColor(optionsColor, forState: .Normal)
        progressButton.backgroundColor = UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 1)
        progressButton.layer.cornerRadius = 10
        
        //make settings button
        let settingButton = UIButton(frame: CGRectMake(125,575,300,75))
        settingButton.setTitle("Settings", forState: .Normal)
        settingButton.setTitleColor(optionsColor, forState: .Normal)
        settingButton.backgroundColor = UIColor(red: 250/255, green: 115/255, blue: 0/255, alpha: 1)
        settingButton.layer.cornerRadius = 10
        
        
        //add buttons to view
        view.addSubview(titleButton)
        view.addSubview(progressButton)
        view.addSubview(settingButton)
        
        //add functions to lessons button
        titleButton.addTarget(self, action: "buttonTitlePressed:", forControlEvents: .TouchUpInside)
        settingButton.addTarget(self, action: "buttonSettingsPressed:", forControlEvents: .TouchUpInside)
        progressButton.addTarget(self, action: "buttonProgressPressed:", forControlEvents: .TouchUpInside)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
        //hide status bar
    }
    
    /**********************************************
        BUTTON FUNCTIONS
    */
    //lessons
    func buttonTitlePressed(sender: UIButton)
    {
        let lessonPage:LessonPage = LessonPage()
        
        self.presentViewController(lessonPage, animated: true, completion: nil)

    }
    
    //progress
    func buttonProgressPressed(sender: UIButton)
    {
        let aProgressScreen:ProgressScreen = ProgressScreen()
        
        self.presentViewController(aProgressScreen, animated: true, completion: nil)
    }
    
    //settings
    func buttonSettingsPressed(sender: UIButton)
    {
        let aSettingsPage:SettingsPage = SettingsPage()
        
        self.presentViewController(aSettingsPage, animated: true, completion: nil)
        
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

