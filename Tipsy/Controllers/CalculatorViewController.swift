//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Vitali Martsinovich on 2023-01-31.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private let secondView: UIView = {
        let secondView = UIView()
        secondView.backgroundColor = #colorLiteral(red: 0.7364435792, green: 0.8989037871, blue: 0.9391706586, alpha: 1)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        return secondView
    }()
    
    private let topStackView: UIStackView = {
        let topStack = UIStackView()
        topStack.axis = .vertical
        topStack.distribution = .fill
        topStack.spacing = 28
        topStack.translatesAutoresizingMaskIntoConstraints = false
        
        return topStack
        
    }()
    
    private var enterBill: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private var billTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "e.g. 123.56"
        textField.font = .systemFont(ofSize: 40)
        textField.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        textField.textAlignment = .center
        textField.minimumFontSize = 17
        textField.adjustsFontSizeToFitWidth = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addToTopStack()
        view.addSubview(topStackView)
        view.addSubview(secondView)
        setConstraints()
        
    }
    
    func addToTopStack() {
        topStackView.addArrangedSubview(enterBill)
        topStackView.addArrangedSubview(billTextField)

    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate ([
            
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            secondView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 20),
            secondView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            secondView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            enterBill.heightAnchor.constraint(equalToConstant: 30),
            enterBill.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            enterBill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
            
            billTextField.heightAnchor.constraint(equalToConstant: 48),
            billTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            billTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
        
        
        ])
        
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
