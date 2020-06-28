//
//  UTM.swift
//  UTMConversion-v2
//
//  Created by Sam Dravizki on 28/06/20.
//  Copyright © 2020 Sam Dravizki. All rights reserved.
//

import Foundation

func UTMZoneFromWGS48(longitude: Double, latitude: Double) -> String {
    var zoneNumber = floor((longitude + 180) / 6) + 1
    
    // Special Zones for norway
    if (latitude >= 56.0 && latitude < 64.0 && longitude >= 3.0 && longitude < 12.0) {
        zoneNumber = 32
    }
    
    // Special Zones for svalbard
    if (latitude >= 72.0 && latitude < 84.0 ) {
        if( longitude >= 0.0  && longitude <  9.0 ) {
           zoneNumber = 31;
        }
        else if( longitude >= 9.0  && longitude < 21.0 ) {
           zoneNumber = 33;
        }
        else if(longitude >= 21.0 && longitude < 33.0 ) {
           zoneNumber = 35;
        }
        else if(longitude >= 33.0 && longitude < 42.0 ) {
           zoneNumber = 37;
        }
    }
    
    var letterDesignator = ""
    
    if((84 >= latitude) && (latitude >= 72)) {
        letterDesignator = "X";
    }
    else if((72 > latitude) && (latitude >= 64)) {
    letterDesignator = "W"
    }
    else if((64 > latitude) && (latitude >= 56)) {
    letterDesignator = "V"
    }
    else if((56 > latitude) && (latitude >= 48)) {
    letterDesignator = "U"
    }
    else if((48 > latitude) && (latitude >= 40)) {
    letterDesignator = "T"
    }
    else if((40 > latitude) && (latitude >= 32)) {
    letterDesignator = "S"
    }
    else if((32 > latitude) && (latitude >= 24)) {
    letterDesignator = "R"
    }
    else if((24 > latitude) && (latitude >= 16)) {
    letterDesignator = "Q"
    }
    else if((16 > latitude) && (latitude >= 8)) {
    letterDesignator = "P"
    }
    else if(( 8 > latitude) && (latitude >= 0)) {
    letterDesignator = "N"
    }
    else if(( 0 > latitude) && (latitude >= -8)) {
    letterDesignator = "M"
    }
    else if((-8 > latitude) && (latitude >= -16)) {
    letterDesignator = "L"
    }
    else if((-16 > latitude) && (latitude >= -24)) {
    letterDesignator = "K"
    }
    else if((-24 > latitude) && (latitude >= -32)) {
    letterDesignator = "J"
    }
    else if((-32 > latitude) && (latitude >= -40)) {
    letterDesignator = "H"
    }
    else if((-40 > latitude) && (latitude >= -48)) {
    letterDesignator = "G"
    }
    else if((-48 > latitude) && (latitude >= -56)) {
    letterDesignator = "F"
    }
    else if((-56 > latitude) && (latitude >= -64)) {
    letterDesignator = "E"
    }
    else if((-64 > latitude) && (latitude >= -72)) {
    letterDesignator = "D"
    }
    else if((-72 > latitude) && (latitude >= -80)) {
    letterDesignator = "C"
    }
    else {
    letterDesignator = "Z"; //This is here as an error flag to show that the Latitude is outside the UTM limits
    }
    
    return "\(Int(zoneNumber))\(letterDesignator)"
}
