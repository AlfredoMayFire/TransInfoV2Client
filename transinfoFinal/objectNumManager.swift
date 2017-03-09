//
//  objectNumManager.swift
//  transinfoFinal
//
//  Created by Pedro Santiago on 3/5/17.
//  Copyright © 2017 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import Foundation

class objectNumManager : NSObject{
    
    
    var objectNum = Int()
    
    
    override init() {
        
    }

    func getNum() -> Int {
        return objectNum;
    }

    func setNum(num: Int){
        objectNum = num        
    }


}