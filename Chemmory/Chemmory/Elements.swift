//
//  Elements.swift
//  Chemmory
//
//  Created by Grzesiek Kulesza on 25/03/2019.
//  Copyright © 2019 Grzesiek Kulesza. All rights reserved.
//

import Foundation
import RealmSwift


class Element: Object {
    
    @objc dynamic var key: String = NSUUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var symbol: String = ""
    @objc dynamic var atomicNumber: Int = 0
    @objc dynamic var valence: String = ""
    @objc dynamic var valenceCommon: String = ""
    @objc dynamic var valenceRare: String = ""
    @objc dynamic var atomicMass: Float = 0.0
    @objc dynamic var group: Int = 0
    
    
    convenience init(name: String, symbol: String, atomicNumber: Int, valence: String, valenceCommon: String, valenceRare: String, atomicMass: Float, group: Int) {
        self.init()
        self.name = name
        self.symbol = symbol
        self.atomicNumber = atomicNumber
        self.valence = valence
        self.valenceCommon = valenceCommon
        self.valenceRare = valenceRare
        self.atomicMass = atomicMass
        self.group = group
    }
    
    override static func primaryKey() -> String? {
        return "key"
    }
}


var e00 = Element(name: "Noname",       symbol: "Nn", atomicNumber: 0, valence: "", valenceCommon: "", valenceRare: "", atomicMass: 0, group: 0)
var eH0 = Element(name: "Hydrogen",     symbol: "H",  atomicNumber: 1, valence: "1", valenceCommon: "", valenceRare: "", atomicMass: 1.00794, group: 0 )
var eHe = Element(name: "Helium",       symbol: "He", atomicNumber: 2, valence: "0", valenceCommon: "", valenceRare: "", atomicMass: 4.002602, group: 0 )
var eLi = Element(name: "Lithium",      symbol: "Li", atomicNumber: 3, valence: "1", valenceCommon: "", valenceRare: "", atomicMass: 6.941, group: 0 )
var eBe = Element(name: "Beryllium",    symbol: "Be", atomicNumber: 4, valence: "2", valenceCommon: "", valenceRare: "", atomicMass: 9.012182, group: 0 )
var eB0 = Element(name: "Boron",        symbol: "B",  atomicNumber: 5, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 10.811, group: 0 )
var eC0 = Element(name: "Carbon",       symbol: "C",  atomicNumber: 6, valence: "2,4", valenceCommon: "4", valenceRare: "2", atomicMass: 12.011, group: 0 )
var eN0 = Element(name: "Nitrogen",     symbol: "N",  atomicNumber: 7, valence: "1,2,3,4,5", valenceCommon: "5", valenceRare: "", atomicMass: 14.00674, group: 0 )
var eO0 = Element(name: "Oxygen",       symbol: "O",  atomicNumber: 8, valence: "2", valenceCommon: "2", valenceRare: "", atomicMass: 15.9994, group: 0 )
var eF0 = Element(name: "Fluorine",     symbol: "F",  atomicNumber: 9, valence: "1", valenceCommon: "1", valenceRare: "", atomicMass: 18.9984032, group: 0 )
var eNe = Element(name: "Neon",         symbol: "Ne", atomicNumber: 10, valence: "0", valenceCommon: "", valenceRare: "", atomicMass: 20.1797, group: 0 )
var eNa = Element(name: "Sodium",       symbol: "Na", atomicNumber: 11, valence: "1", valenceCommon: "", valenceRare: "", atomicMass: 22.989768, group: 0 )
var eMg = Element(name: "Magnesium",    symbol: "Mg", atomicNumber: 12, valence: "2", valenceCommon: "", valenceRare: "", atomicMass: 24.305, group: 0 )
var eAl = Element(name: "Aluminum",     symbol: "Al", atomicNumber: 13, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 26.982, group: 0 )
var eSi = Element(name: "Silicon",      symbol: "Si", atomicNumber: 14, valence: "4", valenceCommon: "4", valenceRare: "", atomicMass: 28.0855, group: 0 )
var eP0 = Element(name: "Phosphorus",   symbol: "P",  atomicNumber: 15, valence: "3,5", valenceCommon: "5", valenceRare: "", atomicMass: 30.973762, group: 0 )
var eS0 = Element(name: "Sulfur",       symbol: "S",  atomicNumber: 16, valence: "2,4,6", valenceCommon: "6", valenceRare: "", atomicMass: 32.066, group: 0 )
var eCl = Element(name: "Chlorine",     symbol: "Cl", atomicNumber: 17, valence: "1,3,5,7", valenceCommon: "1", valenceRare: "", atomicMass: 35.4527, group: 0 )
var eAr = Element(name: "Argon",        symbol: "Ar", atomicNumber: 18, valence: "0", valenceCommon: "", valenceRare: "", atomicMass: 39.948, group: 0 )
var eK0 = Element(name: "Potassium",    symbol: "K",  atomicNumber: 19, valence: "1", valenceCommon: "", valenceRare: "", atomicMass: 39.0983, group: 0 )
var eCa = Element(name: "Calcium",      symbol: "Ca", atomicNumber: 20, valence: "2", valenceCommon: "", valenceRare: "", atomicMass: 40.078, group: 0 )
var eSc = Element(name: "Scandium",     symbol: "Sc", atomicNumber: 21, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 44.95591, group: 0 )
var eTi = Element(name: "Titanium",     symbol: "Ti", atomicNumber: 22, valence: "3,4", valenceCommon: "4", valenceRare: "", atomicMass: 47.88, group: 0 )
var eV0 = Element(name: "Vanadium",     symbol: "V",  atomicNumber: 23, valence: "2,3,4,5", valenceCommon: "5", valenceRare: "", atomicMass: 50.9415, group: 0 )
var eCr = Element(name: "Chromium",     symbol: "Cr", atomicNumber: 24, valence: "2,3,6", valenceCommon: "3", valenceRare: "", atomicMass: 51.9961, group: 0 )
var eMn = Element(name: "Manganese",    symbol: "Mn", atomicNumber: 25, valence: "2,3,4,6,7", valenceCommon: "2", valenceRare: "", atomicMass: 54.93805 , group: 0 )
var eFe = Element(name: "Iron",         symbol: "Fe", atomicNumber: 26, valence: "2,3,6", valenceCommon: "3", valenceRare: "6", atomicMass: 55.847, group: 0 )
var eCo = Element(name: "Cobalt",       symbol: "Co", atomicNumber: 27, valence: "2,3", valenceCommon: "2", valenceRare: "", atomicMass: 58.9332, group: 0 )
var eNi = Element(name: "Nickel",       symbol: "Ni", atomicNumber: 28, valence: "2,3", valenceCommon: "2", valenceRare: "", atomicMass: 58.69, group: 0 )
var eCu = Element(name: "Copper",       symbol: "Cu", atomicNumber: 29, valence: "1,2,3", valenceCommon: "2", valenceRare: "3", atomicMass: 63.546, group: 0 )
var eZn = Element(name: "Zinc",         symbol: "Zn", atomicNumber: 30, valence: "2", valenceCommon: "2", valenceRare: "", atomicMass: 65.39, group: 0 )
var eGa = Element(name: "Gallium",      symbol: "Ga", atomicNumber: 31, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 69.723, group: 0 )
var eGe = Element(name: "Germanium",    symbol: "Ge", atomicNumber: 32, valence: "2,4", valenceCommon: "4", valenceRare: "2", atomicMass: 72.61, group: 0 )
var eAs = Element(name: "Arsenic",      symbol: "As", atomicNumber: 33, valence: "3,5", valenceCommon: "3", valenceRare: "", atomicMass: 74.92159, group: 0 )
var eSe = Element(name: "Selenium",     symbol: "Se", atomicNumber: 34, valence: "2,4,6", valenceCommon: "4", valenceRare: "", atomicMass: 78.96, group: 0 )
var eBr = Element(name: "Bromine",      symbol: "Br", atomicNumber: 35, valence: "1,3,5,7", valenceCommon: "1", valenceRare: "", atomicMass: 79.904, group: 0 )
var eKr = Element(name: "Krypton",      symbol: "Kr", atomicNumber: 36, valence: "2", valenceCommon: "2", valenceRare: "", atomicMass: 83.8, group: 0 )
var eRb = Element(name: "Rubidium",     symbol: "Rb", atomicNumber: 37, valence: "1", valenceCommon: "", valenceRare: "", atomicMass: 85.4678, group: 0 )
var eSr = Element(name: "Strontium",    symbol: "Sr", atomicNumber: 38, valence: "2", valenceCommon: "", valenceRare: "", atomicMass: 87.62, group: 0 )
var eY0 = Element(name: "Yttrium",      symbol: "Y",  atomicNumber: 39, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 88.90585, group: 0 )
var eZr = Element(name: "Zirconium",    symbol: "Zr", atomicNumber: 40, valence: "4", valenceCommon: "4", valenceRare: "", atomicMass: 91.224, group: 0 )
var eNb = Element(name: "Niobium",      symbol: "Nb", atomicNumber: 41, valence: "3,4,5", valenceCommon: "5", valenceRare: "", atomicMass: 92.90638, group: 0 )
var eMo = Element(name: "Molybdenum",   symbol: "Mo", atomicNumber: 42, valence: "2,3,4,5,6", valenceCommon: "6", valenceRare: "2", atomicMass: 95.94, group: 0 )
var eTc = Element(name: "Technetium",   symbol: "Tc", atomicNumber: 43, valence: "2,4,7", valenceCommon: "7", valenceRare: "2", atomicMass: 98.9063, group: 0 )
var eRu = Element(name: "Ruthenium",    symbol: "Ru", atomicNumber: 44, valence: "2,3,4,6,8", valenceCommon: "4", valenceRare: "8", atomicMass: 101.07, group: 0 )
var eRh = Element(name: "Rhodium",      symbol: "Rh", atomicNumber: 45, valence: "2,3,4,5,6", valenceCommon: "3", valenceRare: "2,5,6", atomicMass: 102.9055, group: 0 )
var ePd = Element(name: "Palladium",    symbol: "Pd", atomicNumber: 46, valence: "2,4", valenceCommon: "2", valenceRare: "", atomicMass: 106.42, group: 0 )
var eAg = Element(name: "Silver",       symbol: "Ag", atomicNumber: 47, valence: "1,2,3", valenceCommon: "1", valenceRare: "2,3", atomicMass: 107.8682, group: 0 )
var eCd = Element(name: "Cadmium",      symbol: "Cd", atomicNumber: 48, valence: "2", valenceCommon: "2", valenceRare: "", atomicMass:112.411, group: 0 )
var eIn = Element(name: "Indium",       symbol: "In", atomicNumber: 49, valence: "1,3", valenceCommon: "3", valenceRare: "", atomicMass: 114.82, group: 0 )
var eSn = Element(name: "Tin",          symbol: "Sn", atomicNumber: 50, valence: "2,4", valenceCommon: "4", valenceRare: "", atomicMass:118.71, group: 0 )
var eSb = Element(name: "Antimony",     symbol: "Sb", atomicNumber: 51, valence: "3,5", valenceCommon: "3", valenceRare: "", atomicMass: 121.75, group: 0 )
var eTe = Element(name: "Tellurium",    symbol: "Te", atomicNumber: 52, valence: "2,4,6", valenceCommon: "4", valenceRare: "", atomicMass: 127.6, group: 0 )
var eI0 = Element(name: "Iodine",       symbol: "I",  atomicNumber: 53, valence: "1,3,5,7", valenceCommon: "1", valenceRare: "", atomicMass: 126.90447, group: 0 )
var eXe = Element(name: "Xenon",        symbol: "Xe", atomicNumber: 54, valence: "2,4,6,8", valenceCommon: "", valenceRare: "", atomicMass: 131.29, group: 0 )
var eCs = Element(name: "Cesium",       symbol: "Cs", atomicNumber: 55, valence: "1", valenceCommon: "", valenceRare: "", atomicMass: 132.90543, group: 0 )
var eBa = Element(name: "Barium",       symbol: "Ba", atomicNumber: 56, valence: "2", valenceCommon: "", valenceRare: "", atomicMass: 137.327, group: 0 )
var eLa = Element(name: "Lanthanum",    symbol: "La", atomicNumber: 57, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 138.9055, group: 0 )
var eCe = Element(name: "Cerium",       symbol: "Ce", atomicNumber: 58, valence: "3,4", valenceCommon: "3", valenceRare: "", atomicMass: 140.115, group: 0 )
var ePr = Element(name: "Praseodymium", symbol: "Pr", atomicNumber: 59, valence: "3,4", valenceCommon: "3", valenceRare: "", atomicMass: 140.90765 , group: 0 )
var eNd = Element(name: "Neodymium",    symbol: "Nd", atomicNumber: 60, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 144.24, group: 0 )
var ePm = Element(name: "Promethium",   symbol: "Pm", atomicNumber: 61, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 146.9151, group: 0 )
var eSm = Element(name: "Samarium",     symbol: "Sm", atomicNumber: 62, valence: "2,3", valenceCommon: "3", valenceRare: "", atomicMass: 150.36, group: 0 )
var eEu = Element(name: "Europium",     symbol: "Eu", atomicNumber: 63, valence: "2,3", valenceCommon: "", valenceRare: "", atomicMass: 151.965, group: 0 )
var eGd = Element(name: "Gadolinium",   symbol: "Gd", atomicNumber: 64, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 157.25, group: 0 )
var eTb = Element(name: "Terbium",      symbol: "Tb", atomicNumber: 65, valence: "3,4", valenceCommon: "3", valenceRare: "4", atomicMass: 158.92534, group: 0 )
var eDy = Element(name: "Dysprosium",   symbol: "Dy", atomicNumber: 66, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 162.5, group: 0 )
var eHo = Element(name: "Holmium",      symbol: "Ho", atomicNumber: 67, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 164.93032, group: 0 )
var eEr = Element(name: "Erbium",       symbol: "Er", atomicNumber: 68, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 167.26, group: 0 )
var eTm = Element(name: "Thulium",      symbol: "Tm", atomicNumber: 69, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 168.93421, group: 0 )
var eYb = Element(name: "Ytterbium",    symbol: "Yb", atomicNumber: 70, valence: "2,3", valenceCommon: "3", valenceRare: "", atomicMass: 173.04, group: 0 )
var eLu = Element(name: "Lutecium",     symbol: "Lu", atomicNumber: 71, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 174.967, group: 0 )
var eHf = Element(name: "Hafnium",      symbol: "Hf", atomicNumber: 72, valence: "4", valenceCommon: "4", valenceRare: "", atomicMass: 178.49, group: 0 )
var eTa = Element(name: "Tantalum",     symbol: "Ta", atomicNumber: 73, valence: "3,4,5", valenceCommon: "5", valenceRare: "", atomicMass: 180.9479, group: 0 )
var eW0 = Element(name: "Tungsten",     symbol: "W",  atomicNumber: 74, valence: "2,3,4,5,6", valenceCommon: "6", valenceRare: "2,3", atomicMass: 183.85, group: 0 )
var eRe = Element(name: "Rhenium",      symbol: "Re", atomicNumber: 75, valence: "2,3,4,6,7", valenceCommon: "4,7", valenceRare: "2", atomicMass: 186.207, group: 0 )
var eOs = Element(name: "Osmium",       symbol: "Os", atomicNumber: 76, valence: "3,4,6,8", valenceCommon: "4", valenceRare: "", atomicMass: 190.2, group: 0 )
var eIr = Element(name: "Iridium",      symbol: "Ir", atomicNumber: 77, valence: "2,3,4,5,6", valenceCommon: "3", valenceRare: "2,5,6", atomicMass: 192.22, group: 0 )
var ePt = Element(name: "Platinum",     symbol: "Pt", atomicNumber: 78, valence: "2,4,6", valenceCommon: "4", valenceRare: "6", atomicMass: 195.08, group: 0 )
var eAu = Element(name: "Gold",         symbol: "Au", atomicNumber: 79, valence: "1,3", valenceCommon: "3", valenceRare: "", atomicMass: 196.96654, group: 0 )
var eHg = Element(name: "Mercury",      symbol: "Hg", atomicNumber: 80, valence: "1,2", valenceCommon: "2", valenceRare: "", atomicMass: 200.59, group: 0 )
var eTl = Element(name: "Thallium",     symbol: "Tl", atomicNumber: 81, valence: "1,3", valenceCommon: "1", valenceRare: "", atomicMass: 204.3833, group: 0 )
var ePb = Element(name: "Lead",         symbol: "Pb", atomicNumber: 82, valence: "2,4", valenceCommon: "2", valenceRare: "", atomicMass: 207.2, group: 0 )
var eBi = Element(name: "Bismuth",      symbol: "Bi", atomicNumber: 83, valence: "3,5", valenceCommon: "3", valenceRare: "", atomicMass: 208.98037, group: 0 )
var ePo = Element(name: "Polonium",     symbol: "Po", atomicNumber: 84, valence: "2,4,6", valenceCommon: "4", valenceRare: "", atomicMass: 208.9824, group: 0 )
var eAt = Element(name: "Astatine",     symbol: "At", atomicNumber: 85, valence: "1,3,5,7", valenceCommon: "1", valenceRare: "", atomicMass: 209.9871, group: 0 )
var eRn = Element(name: "Radon",        symbol: "Rn", atomicNumber: 86, valence: "2", valenceCommon: "2", valenceRare: "", atomicMass: 222.0176, group: 0 )
var eFr = Element(name: "Francium",     symbol: "Fr", atomicNumber: 87, valence: "1", valenceCommon: "", valenceRare: "", atomicMass: 223.0197, group: 0 )
var eRa = Element(name: "Radium",       symbol: "Ra", atomicNumber: 88, valence: "2", valenceCommon: "", valenceRare: "", atomicMass: 226.0254, group: 0 )
var eAc = Element(name: "Actinium",     symbol: "Ac", atomicNumber: 89, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 227.0278, group: 0 )
var eTh = Element(name: "Thorium",      symbol: "Th", atomicNumber: 90, valence: "4", valenceCommon: "4", valenceRare: "", atomicMass: 232.0381, group: 0 )
var ePa = Element(name: "Protactinium", symbol: "Pa", atomicNumber: 91, valence: "4,5", valenceCommon: "5", valenceRare: "", atomicMass: 231.0359, group: 0 )
var eU0 = Element(name: "Uranium",      symbol: "U",  atomicNumber: 92, valence: "3,4,5,6", valenceCommon: "6", valenceRare: "", atomicMass: 238.0289, group: 0 )
var eNp = Element(name: "Neptunium",    symbol: "Np", atomicNumber: 93, valence: "3,4,5,6,7", valenceCommon: "5", valenceRare: "", atomicMass: 237, group: 0 )
var ePu = Element(name: "Plutonium",    symbol: "Pu", atomicNumber: 94, valence: "3,4,5,6", valenceCommon: "4", valenceRare: "", atomicMass: 244, group: 0 )
var eAm = Element(name: "Americium",    symbol: "Am", atomicNumber: 95, valence: "3,4,5,6", valenceCommon: "3", valenceRare: "", atomicMass: 243, group: 0 )
var eCm = Element(name: "Curium",       symbol: "Cm", atomicNumber: 96, valence: "3,4", valenceCommon: "3", valenceRare: "", atomicMass: 247, group: 0 )
var eBk = Element(name: "Berkelium",    symbol: "Bk", atomicNumber: 97, valence: "3,4", valenceCommon: "3", valenceRare: "", atomicMass: 247, group: 0 )
var eCf = Element(name: "Californium",  symbol: "Cf", atomicNumber: 98, valence: "2,3,4", valenceCommon: "3", valenceRare: "2", atomicMass: 251, group: 0 )
var eEs = Element(name: "Einsteinium",  symbol: "Es", atomicNumber: 99, valence: "2,3", valenceCommon: "3", valenceRare: "2", atomicMass: 252, group: 0 )
var eFm = Element(name: "Fermium",      symbol: "Fm", atomicNumber: 100, valence: "2,3", valenceCommon: "3", valenceRare: "2", atomicMass: 257, group: 0 )
var eMd = Element(name: "Mendelevium",  symbol: "Md", atomicNumber: 101, valence: "2,3", valenceCommon: "3", valenceRare: "", atomicMass: 258, group: 0 )
var eNo = Element(name: "Nobelium",     symbol: "No", atomicNumber: 102, valence: "2,3", valenceCommon: "2", valenceRare: "", atomicMass: 259, group: 0 )
var eLr = Element(name: "Lawrencium",   symbol: "Lr", atomicNumber: 103, valence: "3", valenceCommon: "3", valenceRare: "", atomicMass: 263, group: 0 )
var eRf = Element(name: "Rutherfordium",symbol: "Rf", atomicNumber: 104, valence: "4", valenceCommon: "4", valenceRare: "", atomicMass: 0, group: 0 )
var eDb = Element(name: "Dubnium",      symbol: "Db", atomicNumber: 105, valence: "5", valenceCommon: "5", valenceRare: "", atomicMass: 0, group: 0 )
var eSg = Element(name: "Seaborgium",   symbol: "Sg", atomicNumber: 106, valence: "6", valenceCommon: "6", valenceRare: "", atomicMass: 0, group: 0 )
var eBh = Element(name: "Bohrium",      symbol: "Bh", atomicNumber: 107, valence: "7", valenceCommon: "7", valenceRare: "", atomicMass: 0, group: 0 )
var eHs = Element(name: "Hassium",      symbol: "Hs", atomicNumber: 108, valence: "8", valenceCommon: "8", valenceRare: "", atomicMass: 0, group: 0 )



var elements: [Element] = [e00,eH0,eHe,eLi,eBe,eB0,eC0,eN0,eO0,eF0,eNe,eNa,eMg,eAl,
    eSi,eP0,eS0,eCl,eAr,eK0,eCa,eSc,eTi,eV0,eCr,eMn,eFe,eCo,eNi,eCu,eZn,eGa,eGe,eAs,
    eSe,eBr,eKr,eRb,eSr,eY0,eZr,eNb,eMo,eTc,eRu,eRh,ePd,eAg,eCd,eIn,eSn,eSb,eTe,eI0,
    eXe,eCs,eBa,eLa,eCe,ePr,eNd,ePm,eSm,eEu,eGd,eTb,eDy,eHo,eEr,eTm,eYb,eLu,eHf,eTa,
    eW0,eRe,eOs,eIr,ePt,eAu,eHg,eTl,ePb,eBi,ePo,eAt,eRn,eFr,eRa,eAc,eTh,ePa,eU0,eNp,
    ePu,eAm,eCm,eBk,eCf,eEs,eFm,eMd,eNo,eLr,eRf,eDb,eSg,eBh,eHs]









/*
struct ElementStrue {
    
    let name: String!
    var value: Double!
    var visable: Bool!
    var main: Bool!
    
    init (name: String, value: Double, visable: Bool, main: Bool) {
        self.name = name
        self.value = value
        self.visable = visable
        self.main = main
    }
}

var pln = Valuta(name: "PLN", value: 1.0000, visable: true, main: true)
var thb = Valuta(name: "THB", value: 0.0001, visable: true, main: false)
var usd = Valuta(name: "USD", value: 0.0001, visable: true, main: false)
var aud = Valuta(name: "AUD", value: 0.0001, visable: true, main: false)
var hkd = Valuta(name: "HKD", value: 0.0001, visable: !false, main: false)
var cad = Valuta(name: "CAD", value: 0.0001, visable: !false, main: false)
var nzd = Valuta(name: "NZD", value: 0.0001, visable: !false, main: false)
var sgd = Valuta(name: "SGD", value: 0.0001, visable: !false, main: false)
var eur = Valuta(name: "EUR", value: 0.0001, visable: !false, main: false)
var huf = Valuta(name: "HUF", value: 0.0001, visable: !false, main: false)
var chf = Valuta(name: "CHF", value: 0.0001, visable: !false, main: false)
var gbp = Valuta(name: "GBP", value: 0.0001, visable: !false, main: false)
var uah = Valuta(name: "UAH", value: 0.0001, visable: !false, main: false)
var jpy = Valuta(name: "JPY", value: 0.0001, visable: !false, main: false)
var czk = Valuta(name: "CZK", value: 0.0001, visable: !false, main: false)
var dkk = Valuta(name: "DKK", value: 0.0001, visable: !false, main: false)
var isk = Valuta(name: "ISK", value: 0.0001, visable: !false, main: false)
var nok = Valuta(name: "NOK", value: 0.0001, visable: !false, main: false)
var sek = Valuta(name: "SEK", value: 0.0001, visable: !false, main: false)
var hrk = Valuta(name: "HRK", value: 0.0001, visable: !false, main: false)
var ron = Valuta(name: "RON", value: 0.0001, visable: !false, main: false)
var bgn = Valuta(name: "BGN", value: 0.0001, visable: !false, main: false)
var trr = Valuta(name: "TRY", value: 0.0001, visable: !false, main: false)
var ils = Valuta(name: "ILS", value: 0.0001, visable: !false, main: false)
var clp = Valuta(name: "CLP", value: 0.0001, visable: !false, main: false)
var php = Valuta(name: "PHP", value: 0.0001, visable: !false, main: false)
var mxn = Valuta(name: "MXN", value: 0.0001, visable: !false, main: false)
var zar = Valuta(name: "ZAR", value: 0.0001, visable: !false, main: false)
var brl = Valuta(name: "BRL", value: 0.0001, visable: !false, main: false)
var myr = Valuta(name: "MYR", value: 0.0001, visable: !false, main: false)
var rub = Valuta(name: "RUB", value: 0.0001, visable: !false, main: false)
var idr = Valuta(name: "IDR", value: 0.0001, visable: !false, main: false)
var inr = Valuta(name: "INR", value: 0.0001, visable: !false, main: false)
var krw = Valuta(name: "KRW", value: 0.0001, visable: !false, main: false)
var cny = Valuta(name: "CNY", value: 0.0001, visable: !false, main: false)
var xdr = Valuta(name: "XDR", value: 0.0001, visable: !false, main: false)

var valuta: [Valuta] = [pln, thb, usd, aud, hkd, cad, nzd, sgd, eur,
                        huf, chf, gbp, uah, jpy, czk, dkk, isk, nok,
                        sek, hrk, ron, bgn, trr, ils, clp, php, mxn,
                        zar, brl, myr, rub, idr, inr, krw, cny, xdr]

var valutaTempEdit: [Valuta] = [pln, jpy]
var valutaTempHome: [Valuta] = [pln, jpy]

let names = valuta.sorted(by: { $0.name > $1.name })
//
//for valuta in names {
//    print("\(valuta.name!) value = \(valuta.value!)")
//}

var plnArch = [Double](repeating: 0, count: 93)
var thbArch = [Double](repeating: 0, count: 93)
var usdArch = [Double](repeating: 0, count: 93)
var audArch = [Double](repeating: 0, count: 93)
var hkdArch = [Double](repeating: 0, count: 93)
var cadArch = [Double](repeating: 0, count: 93)
var nzdArch = [Double](repeating: 0, count: 93)
var sgdArch = [Double](repeating: 0, count: 93)
var eurArch = [Double](repeating: 0, count: 93)
var hufArch = [Double](repeating: 0, count: 93)
var chfArch = [Double](repeating: 0, count: 93)
var gbpArch = [Double](repeating: 0, count: 93)
var uahArch = [Double](repeating: 0, count: 93)
var jpyArch = [Double](repeating: 0, count: 93)
var czkArch = [Double](repeating: 0, count: 93)
var dkkArch = [Double](repeating: 0, count: 93)
var iskArch = [Double](repeating: 0, count: 93)
var nokArch = [Double](repeating: 0, count: 93)
var sekArch = [Double](repeating: 0, count: 93)
var hrkArch = [Double](repeating: 0, count: 93)
var ronArch = [Double](repeating: 0, count: 93)
var bgnArch = [Double](repeating: 0, count: 93)
var trrArch = [Double](repeating: 0, count: 93)
var ilsArch = [Double](repeating: 0, count: 93)
var clpArch = [Double](repeating: 0, count: 93)
var phpArch = [Double](repeating: 0, count: 93)
var mxnArch = [Double](repeating: 0, count: 93)
var zarArch = [Double](repeating: 0, count: 93)
var brlArch = [Double](repeating: 0, count: 93)
var myrArch = [Double](repeating: 0, count: 93)
var rubArch = [Double](repeating: 0, count: 93)
var idrArch = [Double](repeating: 0, count: 93)
var inrArch = [Double](repeating: 0, count: 93)
var krwArch = [Double](repeating: 0, count: 93)
var cnyArch = [Double](repeating: 0, count: 93)
var xdrArch = [Double](repeating: 0, count: 93)

var valutaArch  = [plnArch, thbArch, usdArch, audArch, hkdArch, cadArch, nzdArch, sgdArch, eurArch,
                   hufArch, chfArch, gbpArch, uahArch, jpyArch, czkArch, dkkArch, iskArch, nokArch,
                   sekArch, hrkArch, ronArch, bgnArch, trrArch, ilsArch, clpArch, phpArch, mxnArch,
                   zarArch, brlArch, myrArch, rubArch, idrArch, inrArch, krwArch, cnyArch, xdrArch]

var valutaArchName =   ["PLN", "THB", "USD", "AUD", "HKD", "CAD", "NZD", "SGD", "EUR",
                        "HUF", "CHF", "GBP", "UAH", "JPY", "CZK", "DKK", "ISK", "NOK",
                        "SEK", "HRK", "RON", "BGN", "TRY", "ILS", "CLP", "PHP", "MXN",
                        "ZAR", "BRL", "MYR", "RUB", "IDR", "INR", "KRW", "CNY", "XDR"]

 
 */
