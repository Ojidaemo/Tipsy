//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Vitali Martsinovich on 2023-01-31.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    lazy var tipsButtons = [zeroTipButton, tenTipButton, twentyTipButton]
    
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
    
    private let middleStackView: UIStackView = {
        let middleStack = UIStackView()
        middleStack.axis = .vertical
        middleStack.distribution = .fill
        middleStack.alignment = .center
        middleStack.spacing = 26
        middleStack.translatesAutoresizingMaskIntoConstraints = false
        
        return middleStack
        
    }()
    
    private lazy var firstStackInsideMiddle: UIStackView = {
        let firstStack = UIStackView(arrangedSubviews: tipsButtons)
        firstStack.axis = .horizontal
        firstStack.distribution = .fillEqually
        firstStack.alignment = .fill
        firstStack.contentMode = .scaleToFill
        firstStack.spacing = 0
        firstStack.translatesAutoresizingMaskIntoConstraints = false
        
        return firstStack
        
    }()
    
    private var zeroTipButton: UIButton = {
       let button = UIButton()
        button.setTitle("0%", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        button.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return button
    }()
    
    private var tenTipButton: UIButton = {
       let button = UIButton()
        button.setTitle("10%", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.isSelected = true
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        return button
    }()
    
    private var twentyTipButton: UIButton = {
       let button = UIButton()
        button.setTitle("20%", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        return button
    }()
    
    private var calculateButton: UIButton = {
       let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    private var selectTip: UILabel = {
        let label = UILabel()
        label.text = "Select tip"
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
        
        addToStack()
        view.addSubview(topStackView)
        view.addSubview(secondView)
        secondView.addSubview(middleStackView)
        secondView.addSubview(calculateButton)
        setConstraints()
        
    }
    
    func addToStack() {
        topStackView.addArrangedSubview(enterBill)
        topStackView.addArrangedSubview(billTextField)
        middleStackView.addArrangedSubview(selectTip)
        middleStackView.addArrangedSubview(firstStackInsideMiddle)

    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate ([
            
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            middleStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor,constant: 20),
            middleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            middleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            selectTip.heightAnchor.constraint(equalToConstant: 30),
            selectTip.leadingAnchor.constraint(equalTo: middleStackView.leadingAnchor,constant: 30),
            selectTip.trailingAnchor.constraint(equalTo: middleStackView.trailingAnchor,constant: -30),
            
            firstStackInsideMiddle.leadingAnchor.constraint(equalTo: middleStackView.leadingAnchor),
            firstStackInsideMiddle.trailingAnchor.constraint(equalTo: middleStackView.trailingAnchor),
            firstStackInsideMiddle.heightAnchor.constraint(equalToConstant: 54),
            
            secondView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 20),
            secondView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            secondView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            enterBill.heightAnchor.constraint(equalToConstant: 30),
            enterBill.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            enterBill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            billTextField.heightAnchor.constraint(equalToConstant: 48),
            billTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            billTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            calculateButton.widthAnchor.constraint(equalToConstant: 200),
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
        
        
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
