//
//  ThirdViewController.swift
//  tapApplication
//
//  Created by Student 06 on 20/11/18.
//  Copyright © 2018 Student 06. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var operationQueue: OperationQueue = OperationQueue()
    @IBOutlet weak var imageview1: UIImageView!
    
    
    @IBOutlet weak var activity_1: UIActivityIndicatorView!
    
    @IBOutlet weak var imageview2: UIImageView!
    
    @IBOutlet weak var activity2: UIActivityIndicatorView!
    
    
    @IBAction func button_Action(_ sender: UIButton) {
        let  blockOperation1 = BlockOperation
        {
            self.downloadFromWeb1()
        }
        let  blockOperation2 = BlockOperation
        {
            self.downloadFromWeb2()
        }
        operationQueue.addOperation(blockOperation1)
        operationQueue.addOperation(blockOperation2)
        //blockOperation2.addDependancy(blockOperation1)
        blockOperation1.queuePriority = .low
        blockOperation2.queuePriority = .high
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func downloadFromWeb1()
    {
        let str = "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=beautiful-beauty-blue-414612.jpg&fm=jpg"
        let url = URL(string:str)!
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) {
            (data,response , error) in
            if (data != nil)
            {
                self.activity_1.startAnimating()
                //print("Operation1 working")
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageview1.image = image
                    self.activity_1.stopAnimating()
                    //print("Operation1 Finished")
                }
                
            }
        }
    }
    func downloadFromWeb2()
    {
        let str = "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=beautiful-beauty-blue-414612.jpg&fm=jpg"
        let url = URL(string:str)!
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) {
            (data,response , error) in
            if (data != nil)
            {
                self.activity2.startAnimating()
                //print("Operation2 working")
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageview2.image = image
                    self.activity2.stopAnimating()
                    //print("Operation2 Finished")
                }
                
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
