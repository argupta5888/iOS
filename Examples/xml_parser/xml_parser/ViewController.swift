//
//  ViewController.swift
//  xml_parser
//
//  Created by ashok on 22/10/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import UIKit

struct Polygon {
    var stroke: String?
    var fill: String?
    var title: String?
}

struct SVG {
    var details: [Polygon]?
}

class ViewController: UIViewController {
    
    var polyList: [Polygon] = []
    var attributes: [String:String] = [:]
    var tag: String = String()
    var _stroke: String?
    var _fill: String?
    var _title: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let path = Bundle.main.url(forResource: "svg", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                 parser.delegate = self
                parser.parse()
            }
        }
    }
}

extension ViewController : XMLParserDelegate {
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "polygon" {
            _stroke = String()
            _fill = String()
            _title = String()
        }
        self.tag = elementName
        self.attributes = attributeDict
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if (!data.isEmpty) {
            if tag == "polygon" {
                _stroke = attributes["stroke"]
                _fill = attributes["fill"]
                _title = attributes["title"]
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
           
           if elementName == "polygon" {
               let polyObj = Polygon(stroke: _stroke, fill: _fill, title: _title)
               self.polyList.append(polyObj)
           }
       }
    
    func parser(_ parser: XMLParser, foundAttributeDeclarationWithName attributeName: String, forElement elementName: String, type: String?, defaultValue: String?) {
        
    }
    
    
//    func parserDidEndDocument(_ parser: XMLParser) {
//        print(polyList)
//    }
}

