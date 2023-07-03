//
//  NavigationVc.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import UIKit

extension UIViewController {

    func characterView() {
        let sb = UIStoryboard(name: "CharacterListSB", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "characterList") as! CharacterList
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
