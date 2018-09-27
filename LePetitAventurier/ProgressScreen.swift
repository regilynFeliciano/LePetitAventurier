//
//  ProgressScreen.swift
//  Le Petit Aventurier
//
//  Created by Regilyn Feliciano on 2016-03-13.
//  Copyright © 2016 Regilyn Feliciano. All rights reserved.
//


import UIKit
import Charts

class ProgressScreen : UIViewController {
    var radarChartView : RadarChartView?    //chart used
    var classes: [String]!                  //parameters of chart

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
        titleBubble.text = "Progress"
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
        let panelBackground = UIColor(red: 252/250, green: 255/255, blue: 235/255, alpha: 0.8)
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
        logButton.addTarget(self, action: "toPlaytime:", forControlEvents: .TouchUpInside)
        
        /*********************
            CHART STUFF
        */
        
        //chart panel:
        let chartBackground = UILabel(frame: CGRect(x: 275, y: 200, width: 600, height: 550))
        chartBackground.center = CGPointMake(titleBubble.center.x, chartBackground.center.y)

        chartBackground.backgroundColor = panelBackground
        chartBackground.layer.borderColor = UIColor.orangeColor().CGColor
        chartBackground.layer.borderWidth = 2
        chartBackground.layer.masksToBounds = true
        chartBackground.layer.cornerRadius = 50
        view.addSubview(chartBackground)
        
        //chart information
        classes = ["Shapes \nand Colors","People", "Places", "Grammar","Animals"]
        let grades = [80.0, 50.0, 100.0, 70.0, 60.0]
        
        radarChartView = RadarChartView(frame: CGRect(x: 275, y: 200, width: 600, height: 550))
        radarChartView!.center = CGPointMake(titleBubble.center.x, radarChartView!.center.y)
        setChart(classes, values: grades)   //pass parameters and values to setChart
        //radarChartView?.backgroundColor = panelBackground
        view.addSubview(radarChartView!)
        

    }
//    func rangeSliderValueChanged(rangeSlider: RangeSlider) {
//        print("Range slider value changed: (\(rangeSlider.lowerValue) \(rangeSlider.upperValue))")
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
        //hide the status bar
    }
    
    /***************************************************
    NAV BUTTON FUNCTIONS
    */
    //button functions
    func backToMenu(sender: UIButton)
    {
        let titleScreen:TitleScreen = TitleScreen()
        
        self.presentViewController(titleScreen, animated: true, completion: nil)
        
    }
    
    func toPlaytime(sender: UIButton)
    {
        let playtimeScreen:PlaytimeScreen = PlaytimeScreen()
        
        self.presentViewController(playtimeScreen, animated: false, completion: nil)
    }
    
    
    /****************************************************
    CHART FUNCTIONS
    */
    func setChart(dataPoints: [String], values: [Double]) {
        radarChartView!.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [ChartDataEntry] = []
        
        //won't work if we have these lower
        radarChartView?.legend.enabled = false
        radarChartView?.yAxis.customAxisMin = 0.00
        radarChartView?.yAxis.customAxisMax = 100.00
        radarChartView?.yAxis.drawZeroLineEnabled = true
        radarChartView?.yAxis.drawLabelsEnabled = true  //see axis grid
        //takes values and adds them into the data entry
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        //customizations
        let chartDataSet = RadarChartDataSet(yVals: dataEntries, label: "Classes")
        radarChartView?.descriptionFont = UIFont(name: "Helvetica Neue", size: 0)   //take out description
        radarChartView?.webLineWidth = 2
        chartDataSet.lineWidth = 5
        chartDataSet.drawFilledEnabled = true
        chartDataSet.fillColor = UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 0.8)
        chartDataSet.fillAlpha = 0.8
        let chartData = RadarChartData(xVals: classes, dataSet: chartDataSet)
        chartDataSet.colors = [UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 0.8)]
        radarChartView!.data = chartData
        chartDataSet.drawValuesEnabled = false
        
        radarChartView?.xAxis.labelFont = UIFont(name: "Helvetica Neue", size: 16)!
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