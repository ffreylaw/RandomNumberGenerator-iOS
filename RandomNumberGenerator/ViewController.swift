//
//  ViewController.swift
//  RandomNumberGenerator
//
//  Created by Jeffrey Jiahai Luo on 12/12/2016.
//  Copyright © 2016 El Root. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        setupNavigation()
        setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "RandomNumberGenerator"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    func setupView() {
        view.addSubview(resultTextLabel)
        view.addSubview(minInputContainerView)
        view.addSubview(maxInputContainerView)
        view.addSubview(generateButton)
        view.addSubview(resetButton)
        
        resultTextLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8).isActive = true
        resultTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultTextLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        resultTextLabel.heightAnchor.constraint(equalToConstant: 128).isActive = true
        
        minInputContainerView.topAnchor.constraint(equalTo: resultTextLabel.bottomAnchor, constant: 8).isActive = true
        minInputContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        minInputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2, constant: -12).isActive = true
        minInputContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        maxInputContainerView.topAnchor.constraint(equalTo: resultTextLabel.bottomAnchor, constant: 8).isActive = true
        maxInputContainerView.leftAnchor.constraint(equalTo: minInputContainerView.rightAnchor, constant: 8).isActive = true
        maxInputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2, constant: -12).isActive = true
        maxInputContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        minInputContainerView.addSubview(minInputTextField)
        minInputTextField.leftAnchor.constraint(equalTo: minInputContainerView.leftAnchor, constant: 12).isActive = true
        minInputTextField.topAnchor.constraint(equalTo: minInputContainerView.topAnchor).isActive = true
        minInputTextField.widthAnchor.constraint(equalTo: minInputContainerView.widthAnchor).isActive = true
        minInputTextField.heightAnchor.constraint(equalTo: minInputContainerView.heightAnchor).isActive = true
        
        maxInputContainerView.addSubview(maxInputTextField)
        maxInputTextField.leftAnchor.constraint(equalTo: maxInputContainerView.leftAnchor, constant: 12).isActive = true
        maxInputTextField.topAnchor.constraint(equalTo: maxInputContainerView.topAnchor).isActive = true
        maxInputTextField.widthAnchor.constraint(equalTo: maxInputContainerView.widthAnchor).isActive = true
        maxInputTextField.heightAnchor.constraint(equalTo: maxInputContainerView.heightAnchor).isActive = true
        
        generateButton.topAnchor.constraint(equalTo: minInputContainerView.bottomAnchor, constant: 8).isActive = true
        generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        generateButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        generateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        resetButton.topAnchor.constraint(equalTo: generateButton.bottomAnchor, constant: 8).isActive = true
        resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resetButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func handleGenerate() {
        if let minInput = minInputTextField.text, let maxInput = maxInputTextField.text, let min = UInt32(minInput), let max = UInt32(maxInput) {
            if min >= max {
                let alert = UIAlertController(title: "Error", message: "Invalid input\n(Min should be less than Max)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)
            } else {
                let random = arc4random_uniform(max - min + 1) + min
                resultTextLabel.text = String(random)
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Invalid input\n(overflow or non-integer input)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func handleReset() {
        resultTextLabel.text = "Rand Num Gen"
        minInputTextField.text = ""
        maxInputTextField.text = ""
    }
    
    let resultTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.black
        label.text = "Rand Num Gen"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = NSTextAlignment.center
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    let minInputContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let maxInputContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let minInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Min"
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        return textField
    }()
    
    let maxInputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Max"
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        return textField
    }()
    
    lazy var generateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle("Generate", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleGenerate), for: .touchUpInside)
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
        return button
    }()
    
}
