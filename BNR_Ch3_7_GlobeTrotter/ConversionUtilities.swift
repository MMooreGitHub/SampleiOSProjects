//
//  ConversionUtilities.swift
//  BNR_Ch3_7_GlobeTrotter
//
//  Created by Magela Moore on 5/10/17.
//  Copyright © 2017 Rainbow Interactive. All rights reserved.
//

import Foundation

class ConversionUtilities{

//MARK: - Number Formmater Utility

/* 
   Utility Method: Number Formatter
   Use a "closure" to instantiate the number formatter
   And set the range of fraction digits to:  0 <= range <= 3
 */
    let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 2
    return nf
    } ()

}
