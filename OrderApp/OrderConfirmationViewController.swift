//
//  OrderConfirmationViewController.swift
//  OrderApp
//
//  Created by Lyubomir Lazarov on 9/22/21.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    let minutesToPrepate: Int
    
    init?(coder: NSCoder, minutesToPrepate: Int) {
        self.minutesToPrepate = minutesToPrepate
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBOutlet var confirmationLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmationLabel.text = "Thank you for your order! Your food will be ready in \(minutesToPrepate) minutes"
        // Do any additional setup after loading the view.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
