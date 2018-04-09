//
//  InfoViewController.swift
//  ProyectoFinal
//
//  Created by Mauricio Garza on 3/13/18.
//  Copyright © 2018 Mauricio Garza. All rights reserved.
//

import UIKit
import MessageUI

class InfoViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var btRegresar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btRegresar.layer.cornerRadius=8
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

     @IBAction func butonRegroso(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
     }
    
    @IBAction func makeCall(_ sender: Any) {
        print("se armo")
        let url: NSURL = URL(string: "TEL://9211400080")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    @IBAction func sendEmail(_ sender: Any) {
        let mailCompose=MFMailComposeViewController()
        mailCompose.mailComposeDelegate=self
        mailCompose.setToRecipients(["reyesmun@hotmail.com"])
        mailCompose.setSubject("Ayuda")
        
        if MFMailComposeViewController.canSendMail(){
            self.present(mailCompose, animated: true, completion: nil)
        } else {
            print("Error")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
