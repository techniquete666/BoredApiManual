//
//  ViewController.swift
//  BoredApi
//
//  Created by Vyacheslav on 13.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var headerslabel: UILabel!
    
    private var headers: Headers!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
    
    @IBAction func buttonPressed() {
        headerslabel.text = headers.description
    }
    
    private func fetch() {
        NetworkManager.shared.fetch(from: Link.link.rawValue) { [weak self] result in
            switch result {
            case .success(let headers):
                self?.headers = headers
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

