//
//  TimelineViewController.swift
//  ainsta!
//
//  Created by Nuraini Aguse on 3/6/16.
//  Copyright © 2016 Nuraini Aguse. All rights reserved.
//

import UIKit
import Parse

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var timelineTableView: UITableView!
    
    var posts: [PFObject]!


    @IBAction func logoutButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {() -> Void in
        })
        PFUser.logOut()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
        
        self.getPosts()
        timelineTableView.reloadData()


        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        print("view did appear")
        super.viewDidAppear(true)
        self.getPosts()
        timelineTableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        print("the tweet count is")
       
        //return posts.count
        if let posts = posts { //if movies is not nil, assign it to movies
        print("the tweet count is")
        //print(tweets.count)
        return posts.count
        
        }
        else {
        print("count is 0")
        return 0
        }
        
    }

    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = timelineTableView.dequeueReusableCellWithIdentifier("timelinecell", forIndexPath: indexPath) as! TimelineTableViewCell
        if posts != nil{
            let post = posts[indexPath.row]
        
            print("printing out the cells")
            
            cell.post = post
        
        }
        return cell
        
    }
    
    func getPosts(){
        
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                self.posts = posts
            } else {
                print(error)
                // handle error
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
