//
//  ChatViewController.swift
//  parseChat
//
//  Created by Gerard Recinto on 12/2/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import UIKit
import Parse
class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var sendButton: UIButton!
  @IBOutlet weak var messageTextField: UITextField!
  var refreshControl: UIRefreshControl!
  var msgs: [PFObject] = []

  func onRefresh() {
   self.tableView.reloadData()
   
  }
  // Implement the delay method
  func run(after wait: TimeInterval, closure: @escaping () -> Void) {
    let queue = DispatchQueue.main
    queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
  }
  
  @objc func onTimer() {
    getMessages()
  }

  override func viewDidLoad() {
        super.viewDidLoad()
    self.tableView.reloadData()
    self.tableView.dataSource = self
    self.tableView.delegate = self
    
    refreshControl = UIRefreshControl()
    
    refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: "onRefresh", for: UIControlEvents.valueChanged)
    tableView.insertSubview(refreshControl, at: 0)
    getMessages()
    Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)

    // The getObjectInBackgroundWithId methods are asynchronous, so any code after this will run
    // immediately.  Any code that depends on the query result should be moved
    // inside the completion block above.
        // Do any additional setup after loading the view.
    }
  func getMessages() {
    let query = PFQuery(className: "jkjklj")
    query.addDescendingOrder("createdAt")
    query.includeKey("user")
    query.findObjectsInBackground { (msgs: [PFObject]?, error: Error?) in
      if let error = error {
        print("Error fetching: \(error.localizedDescription) ")
      } else if let msgs = msgs {
        self.msgs = msgs
        self.tableView.reloadData()
      }
    }
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  @IBAction func onSendButton(_ sender: Any) {
  let chatMessage = PFObject(className: "jkjklj")
    chatMessage["text"] = messageTextField.text ?? ""
    chatMessage.saveInBackground { (success, error) in
      if success {
        print("The message was saved!")
      } else if let error = error {
        print("Problem saving message: \(error.localizedDescription)")
      }
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell")
    return cell!
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 1
    
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
