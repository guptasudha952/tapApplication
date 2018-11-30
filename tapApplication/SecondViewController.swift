//
//  SecondViewController.swift
//  tapApplication
//
//  Created by Student 06 on 20/11/18.
//  Copyright © 2018 Student 06. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView_1: UIImageView!
    
    
    @IBOutlet weak var imageView_2: UIImageView!
    
    @IBAction func secondViewButton(_ sender: UIButton) {
        let queue2 = DispatchQueue(label: "com.felix.queue2", qos: .userInitiated, attributes: .concurrent, autoreleaseFrequency: .inherit, target: DispatchQueue.global())
        
        let queue1 = DispatchQueue(label: "com.felix,queue1", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .inherit, target: DispatchQueue.global())
        queue1.async {
            self.downLoadFromWeb1()
            for i in 1...10
            {
                print("\(i)🦋")
            }
            self.downLoadFromWeb1()
        }
        queue2.async {
            for i in 11...20
            {
                print("\(i)🐸")
            }
            self.downLoadFromWeb2()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
func downLoadFromWeb1()
{
    let str = "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=beautiful-beauty-blue-414612.jpg&fm=jpg"
    let url = URL(string: str)!
    let session = URLSession(configuration: .default)
    let datatask = session.dataTask(with: url) { (data, response, error) in
        if(data != nil)
        {
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                self.imageView_1.image = image
            }
        }
    }
    datatask.resume()
    
    }
    
    func downLoadFromWeb2()
    {
    let str = "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=beautiful-beauty-blue-414612.jpg&fm=jpg"
    let url = URL(string: str)!
    let session = URLSession(configuration: .default)
    let datatask = session.dataTask(with: url) { (data, response, error) in
    if(data != nil)
    {
    let image = UIImage(data: data!)
    DispatchQueue.main.async {
    self.imageView_2.image = image
    }
    }
    }
    datatask.resume()
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

