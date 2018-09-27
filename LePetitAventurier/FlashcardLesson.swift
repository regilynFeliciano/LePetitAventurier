//
//  FlashcardLesson.swift
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

class FlashcardLesson: UIViewController {
    //make speechBubble and dialogue as class vars
    let speechBubble = UILabel(frame: CGRect(x: 25, y: 500, width: 700, height: 250))
    let dialogue = ["Let's learn about animals!","Here are a dog, a cat, a bird, and a snake.", "Tap the buttons to hear them in French!", "Time for a game! Click on the picture that matches\n the word!"]
    //index of dialogue init at 0
    var index = 0
    
    
    let 你好 = "你好世界"
//    //french names of flashcards
//    let frenchEquiv = ["chien", "chat", "oiseau", "serpent"]
//    let pictures = ["dog.jpeg", "cat.png", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        speechBubble.numberOfLines = 2
        /********************
            GRAPHICS
        */
        //set background colour
        let mainScreenSize : CGSize = UIScreen.mainScreen().bounds.size // Getting main screen size of iPhone
        let imageObbj:UIImage! =   self.imageResize(UIImage(named: "orange-polkadot-background.jpg")!, sizeChange: CGSizeMake(mainScreenSize.width, mainScreenSize.height))
        self.view.backgroundColor = UIColor(patternImage:imageObbj)
        
        
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
        
        
        
        
        /********************
            SPEECH BUBBLE
        */
        speechBubble.text = dialogue[0] //start at the beginning
        // Enum type, two variations:
        speechBubble.textAlignment = NSTextAlignment.Center
        speechBubble.textAlignment = .Center
        
        //shape and border
        speechBubble.layer.cornerRadius = 125   //for oval, radius is 1/2(height)
        speechBubble.layer.masksToBounds = true //need otherwise the corners will remain
        speechBubble.layer.borderWidth = 5
        speechBubble.layer.borderColor = UIColor.blueColor().CGColor
        view.addSubview(speechBubble)
        
        //colours
        speechBubble.backgroundColor = UIColor(red:0, green: 0, blue:0, alpha:0.8)
        speechBubble.textColor = UIColor.whiteColor()
        speechBubble.shadowColor = UIColor.blackColor()
        speechBubble.font = UIFont(name: "HelveticaNeue", size: CGFloat(25))
        
        //text navigational buttons
        //want them to be yellow... green border?
        let nextText = UIButton(frame: CGRectMake(550, 675, 150, 75))
        //titleButton.center = view.center
        nextText.setTitle("Next", forState: .Normal)
        nextText.setTitleColor(UIColor.blackColor(), forState: .Normal)
        nextText.backgroundColor = UIColor.yellowColor()
        nextText.layer.cornerRadius = 50                 //radius bigger than half height results in pointed sides
        nextText.layer.borderWidth = 5
        nextText.layer.borderColor = menuColor.CGColor
        
        let prevText = UIButton(frame: CGRectMake(50, 675, 150, 75))
        //titleButton.center = view.center
        prevText.setTitle("Back", forState: .Normal)
        prevText.setTitleColor(UIColor.blackColor(), forState: .Normal)
        prevText.backgroundColor = UIColor.yellowColor()
        prevText.layer.cornerRadius = 50
        prevText.layer.borderWidth = 5
        prevText.layer.borderColor = menuColor.CGColor
        
        //add to view plus functions
        view.addSubview(nextText)
        view.addSubview(prevText)
        nextText.addTarget(self, action: "toNext:", forControlEvents: .TouchUpInside)
        prevText.addTarget(self, action: "toBack:", forControlEvents: .TouchUpInside)
        

        /********************
            MASCOT GOES HERE otherwise speech bubble will overlap
         */

        
        //mascot
        let mascotName = "Aventurier-1.png"
        let image = UIImage(named: mascotName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 650, y:425, width: 350, height: 350)
        view.addSubview(imageView)
        
        /********************
            ADD FLASHCARDS
        */
        
        let flashcardColor = UIColor(red: 214/255, green: 245/255, blue: 245/255, alpha: 1)
        let flashcardBorder = UIColor(red: 0/255, green: 45/255, blue: 179/255, alpha: 1)
        
        //create flashcards
        
        let flash1 = UIImage(named: "dog.jpeg")
        let flashcard1 = UIButton(frame: CGRectMake(75, 50, 350, 200))
        flashcard1.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        flashcard1.setImage(flash1, forState: UIControlState.Normal)
        flashcard1.backgroundColor = flashcardColor
        flashcard1.layer.cornerRadius = 20
        flashcard1.layer.borderWidth = 5
        flashcard1.layer.borderColor = flashcardBorder.CGColor
        
        let flash2 = UIImage(named: "cat.png")
        let flashcard2 = UIButton(frame: CGRectMake(450, 50, 350, 200))
        flashcard2.imageView?.contentMode = UIViewContentMode.ScaleAspectFit    //make it fit in button
        flashcard2.setImage(flash2, forState: UIControlState.Normal)
        flashcard2.backgroundColor = flashcardColor
        flashcard2.layer.cornerRadius = 20
        flashcard2.layer.borderWidth = 5
        flashcard2.layer.borderColor = flashcardBorder.CGColor
        
        let flash3 = UIImage(named: "bird.jpg")
        let flashcard3 = UIButton(frame: CGRectMake(75, 275, 350, 200))
        flashcard3.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        flashcard3.setImage(flash3, forState: UIControlState.Normal)
        flashcard3.backgroundColor = flashcardColor
        flashcard3.layer.cornerRadius = 20
        flashcard3.layer.borderWidth = 5
        flashcard3.layer.borderColor = flashcardBorder.CGColor
        
        let flash4 = UIImage(named: "snake.jpg")
        let flashcard4 = UIButton(frame: CGRectMake(450, 275, 350, 200))
        flashcard4.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        flashcard4.setImage(flash4, forState: UIControlState.Normal)
        flashcard4.backgroundColor = flashcardColor
        flashcard4.layer.cornerRadius = 20
        flashcard4.layer.borderWidth = 5
        flashcard4.layer.borderColor = flashcardBorder.CGColor
        
        //add flashcards to subview
        view.addSubview(flashcard1)
        view.addSubview(flashcard2)
        view.addSubview(flashcard3)
        view.addSubview(flashcard4)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
        //hide the status bar
    }
    
    /******************************
        NAV BUTTON FUNCTIONS
    */
    //button functions
    func backToMenu(sender: UIButton)
    {
        let titleScreen:TitleScreen = TitleScreen()
        
        self.presentViewController(titleScreen, animated: true, completion: nil)
        
    }
    
    //goes forward, or towards game when "next" is tapped
    func toNext(sender:UIButton)
    {
        let gameScreen:FlashcardGame = FlashcardGame()
        
        //check if at end
        if (index == dialogue.count-1){
            self.presentViewController(gameScreen, animated: true, completion: nil)
        }
        else{
            index++;
            speechBubble.text = dialogue[index]
        }
    }
    
    //goes backwards, or towards lesson select when "back" is tapped
    func toBack(sender:UIButton)
    {
        let lessonSelect:LessonPage = LessonPage()
        
        //check if at end
        if (index == 0){
            self.presentViewController(lessonSelect, animated: true, completion: nil)
        }
        else{
            index--;
            speechBubble.text = dialogue[index]
        }
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
