//
//  TipViewController.swift
//  YallBeTipping
//
//  Created by Robert Papp on 2025. 02. 27..
//

import UIKit

class TipViewController: UIViewController {

    lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(didTapBarButton))
        return button
    }()
    
   
    @IBOutlet weak var largeTipButton: UIButton!
    @IBOutlet weak var mediumTipButton: UIButton!
    @IBOutlet weak var smallTipButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var skipButton: UIButton!
    
    lazy var tipSelections: [UIButton] = [
        largeTipButton,
        mediumTipButton,
        smallTipButton,
        skipButton
    ]
    
    var tipAmount: TipOptions = .small
    
    let items: [MenuItem]
    
    init(coder: NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = barButton
        skipButton.layer.cornerRadius = 15
        stackView.arrangedSubviews.forEach { button in button.layer.cornerRadius = 20 }
        smallTipButton.isSelected = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        let orientation = UIDevice.current.orientation
        if orientation.isPortrait {
            stackView.axis = .vertical
        } else if orientation.isLandscape {
            stackView.axis = .horizontal
        }
        
    }
    
    @objc func didTapBarButton() {
        let sb = UIStoryboard(
            name: "Receipt",
            bundle: nil
        )
        let vc = sb.instantiateViewController(identifier: "ReceiptViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func deselectButtons(){
        tipSelections.forEach { button in
            button.isSelected = false
        }
    }
    
    @IBAction func didTapSkip() {
        deselectButtons()
        skipButton.isSelected = true
        tipAmount = .none
    }
    
    @IBAction func didTapSmallTip() {
        deselectButtons()
        smallTipButton.isSelected = true
        tipAmount = .small
    }
    
    @IBAction func didTapMediumTip() {
        deselectButtons()
        mediumTipButton.isSelected = true
        tipAmount = .medium
    }
    @IBAction func didTapLargeTip() {
        deselectButtons()
        largeTipButton.isSelected = true
        tipAmount = .large
    }
}
