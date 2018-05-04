//
//  ViewController.swift
//  tictactoe
//
//  Created by Senthil D on 1/5/18.
//  Copyright © 2018 Senthil D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct Players
    {
    var id: String
    var turn: Bool
    var points: Int
    var playertext: String
        var playerPoistions: [Int] = []
        init(id: String, turn: Bool, points: Int, playertext: String) {
         self.id = id
         self.turn = turn
         self.points = points
         self.playertext = playertext
        }
        
        mutating func switchTurn(){
           
            if turn == true{
                turn = false
            }
            else if turn == false{
                turn = true
            }
            
        }
        mutating func setplayerPosition(p: Int){
            playerPoistions.append(p)
        }
        mutating func getplayerPositions() -> [Int]{
            playerPoistions.sort()
            return playerPoistions
        }
        func displayscore(positions: [Int]) -> Int{
            let rules: [[Int]] = [[1,2,3],[1,5,9],[1,4,7],[2,5,8],[3,6,9],[3,5,7],[4,5,6],[7,8,9]]
            var scores: Int = 0
            let temparray = positions
           for i in 0...7{
                
            if (temparray.contains(rules[i][0]) && temparray.contains(rules[i][1]) && temparray.contains(rules[i][2]) && temparray.count >= 3)
            {
                    scores = scores + 1
                    }
            }
               return scores
            
            }
        
        }
    

    var player1 = Players(id: "Player-1", turn: true, points: 0,playertext: "X")
    var player2 = Players(id: "Player-2", turn: false, points: 0, playertext: "O")
    
    @IBOutlet weak var start: UIButton!
    @IBAction func start(_ sender: UIButton) {
        scoreLabel.text = "Scores:"
        player2Label.text = " "
        player1Label.text = " "
        player1.playerPoistions.removeAll()
        player2.playerPoistions.removeAll()
        var num = 0
        let s:String = "_"
        for button in buttonCollection as! [UIButton] {
            
            button.setTitle(s, for: .normal)
            num = num + 1
            button.tag = num
            button.isEnabled = true
            button.backgroundColor = UIColor(named: "White")
            player1.switchTurn()
            player2.switchTurn()
            
            
        }
        start.isEnabled = false
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet var buttons: [UIButton]!

    @IBAction func butttontap(_ sender: UIButton) {
        start.isEnabled = true
        player2Label.backgroundColor = UIColor(red: 200.0/255.0, green: 16.0/255.0, blue: 46.0/255.0, alpha: 1.0);
        player1Label.backgroundColor = UIColor(red: 50.0/255.0, green: 16.0/255.0, blue: 46.0/255.0, alpha: 1.0);
        if player1.turn == true{
            player1.switchTurn()
            player2.switchTurn()
             player1.setplayerPosition(p:sender.tag)
            sender.setTitle(player1.playertext, for: .normal)
            sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
           
            sender.setTitleColor(UIColor.red, for: .normal)
            sender.backgroundColor = UIColor(red: 50.0/255.0, green: 16.0/255.0, blue: 46.0/255.0, alpha: 1.0);
            let ps = player1.getplayerPositions()
            player1Label.text = "Player1"
            for s in ps  {
                player1Label.text = player1Label.text! + String(s)
            }
            sender.isEnabled = false
        }
        else if player2.turn == true{
            
            player2.switchTurn()
            player1.switchTurn()
            sender.backgroundColor = UIColor(red: 200.0/255.0, green: 16.0/255.0, blue: 46.0/255.0, alpha: 1.0);
            player2.setplayerPosition(p:sender.tag)
            sender.setTitle(player2.playertext, for: .normal)
           player2Label.text = "Player2"
            let ps2 = player2.getplayerPositions()
            for s in ps2  {
                player2Label.text = player2Label.text! + String(s)
            }
            sender.isEnabled = false
            sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.isEnabled = false
        }
        
        scoreLabel.text = String("Player1 score : \(player1.displayscore(positions: player1.getplayerPositions()))")
        scoreLabel.text = scoreLabel.text! + String("   Player2 score : \(player2.displayscore(positions: player2.getplayerPositions()))")
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

