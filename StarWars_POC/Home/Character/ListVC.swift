//
//  CharacterList.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    
    var body: CharBody?
    var result: [ResultsCharStruct]?
    var url: String?
    var filmBody: FilmBody?
    var filmResult: [FilmResutlStruct]?
    var isFilm: Bool = false
    var nextUrl: String = ""
    var prevUrl: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        generateStars()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("isfilm: ", isFilm)
        if isFilm {
            getFilms()
        } else {
            getList()
        }
        
        configView()
        tableConfig()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        table.reloadData()
    }
    
    func configView() {
        title = "Personajes"
        rightBtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        leftBtn.addTarget(self, action: #selector(prevPage), for: .touchUpInside)
    }
    
    func tableConfig() {
        table.dataSource = self
        table.separatorColor = .none
        table.register(UINib(nibName: "ContentListCell", bundle: nil), forCellReuseIdentifier: "contentListCell")
    }

    func getList() {
        
        API.shared.getCharacters(url: url!) {
            res in
            
            self.body = res
            self.result = self.body!.results
            self.nextUrl = res.next!
            self.prevUrl = res.previous ?? ""
            if self.prevUrl == "" {
                self.leftBtn.isEnabled = false
            } else {
                self.leftBtn.isEnabled = true
            }
            self.table.reloadData()
        } failure: { error in
            self.simpleErrorAlert(msg:"Se ha perdido la conexión con el servidor, inténtelo más tarde.")
        }
    }
    
    func getFilms() {
        
        API.shared.getFilms(url: url!) {
            res in
            
            self.filmBody = res
            self.filmResult = self.filmBody!.results
            self.nextUrl = res.next ?? ""
            self.prevUrl = res.previous ?? ""
           if self.prevUrl == "" {
                self.leftBtn.isEnabled = false
            } else {
                self.leftBtn.isEnabled = true
            }
            if self.nextUrl == "" {
                self.rightBtn.isEnabled = false
            } else {
                self.rightBtn.isEnabled = true
            }
            self.table.reloadData()
        } failure: { error in
            self.simpleErrorAlert(msg:"Se ha perdido la conexión con el servidor, inténtelo más tarde.")
        }
    }
    
    @objc func nextPage() {
        API.shared.changePage(url: nextUrl) { res in
            self.body = res
            self.result = self.body!.results
            self.nextUrl = res.next ?? ""
            self.prevUrl = res.previous!
            if self.nextUrl == "" {
                self.rightBtn.isEnabled = false
            } else {
                self.rightBtn.isEnabled = true
                self.leftBtn.isEnabled = true
            }
            self.table.reloadData()
        } failure: { error in
            self.simpleErrorAlert(msg:"Se ha perdido la conexión con el servidor, inténtelo más tarde.")
        }
    }
    
    @objc func prevPage() {
        API.shared.changePage(url: prevUrl) { res in
            self.body = res
            self.result = self.body!.results
            self.nextUrl = res.next ?? ""
            self.prevUrl = res.previous ?? ""
            if self.prevUrl ==  "" {
                self.leftBtn.isEnabled = false
            } else {
                self.leftBtn.isEnabled = true
                self.rightBtn.isEnabled = true
            }
            self.table.reloadData()
        } failure: { error in
            self.simpleErrorAlert(msg:"Se ha perdido la conexión con el servidor, inténtelo más tarde.")
        }
    }
}

extension ListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFilm ? filmBody?.results?.count ?? 0 : body?.results!.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentListCell") as! ContentListCell
        
        cell.nameLbl.text = isFilm ? filmResult![indexPath.row].title : result![indexPath.row].name
        
        return cell
    }
    
    
}
