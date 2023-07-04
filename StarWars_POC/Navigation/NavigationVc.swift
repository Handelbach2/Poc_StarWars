//
//  NavigationVc.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import UIKit

extension UIViewController {

    func ListView(url: String, _ isFilm: Bool) {
        let sb = UIStoryboard(name: "ListSB", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "listVC") as! ListVC
        vc.url = url
        vc.isFilm = isFilm
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
