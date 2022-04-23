//
//  ViewController.swift
//  ElementQuiz
//
//  Created by 이성민 on 2022/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    let animalList = ["cat", "dog", "frog", "panda"]
    
    var currentAnimalIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateAnimal()
    }

    func updateAnimal(){
        answerLabel.text = "?"
        let animalName = animalList[currentAnimalIndex]
        let image = UIImage(named: animalName)
        imageView.image = image
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        answerLabel.text = animalList[currentAnimalIndex]
    }
    
    @IBAction func gotoNextElement(_ sender: Any) {
        currentAnimalIndex += 1
        currentAnimalIndex %= animalList.count
        updateAnimal()
    }
}

