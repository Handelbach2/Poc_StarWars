//
//  CharacterList.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import UIKit

class CharacterList: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    
    var body: CharBody?
    var result: ResultsCharStruct?
    
    override func viewWillAppear(_ animated: Bool) {
        generateStars()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacters()
        configView()
    }
    
    func configView() {
        title = "Personajes"
    }
    
    func tableConfig() {
        
    }

    func getCharacters() {
        API.shared.getCharacters {
            res in
            if res.previous == nil {
                self.leftBtn.isEnabled = false
            }
        } failure: { error in
            self.simpleErrorAlert(msg:"Se ha perdido la conexión con el servidor, inténtelo más tarde.")
        }
    }
    

}
