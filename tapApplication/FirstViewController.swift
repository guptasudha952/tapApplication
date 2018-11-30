//
//  FirstViewController.swift
//  tapApplication
//
//  Created by Student 06 on 20/11/18.
//  Copyright © 2018 Student 06. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func FirstViewButton(_ sender: UIButton) {
        let thread = Thread(target: self, selector: #selector(downLoadFromWeb), object: nil)
        thread.start()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func downLoadFromWeb()
    {
        let str = "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=beautiful-beauty-blue-414612.jpg&fm=jpg"
        let url = URL(string: str)!
        let session = URLSession(configuration: .default)
        let datatask = session.dataTask(with: url) { (data, response, error) in
            if(data != nil)
            {
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageView.image = image
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

