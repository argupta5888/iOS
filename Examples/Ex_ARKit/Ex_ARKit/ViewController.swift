//
//  ViewController.swift
//  Ex_ARKit
//
//  Created by esoftuser2 on 27/01/20.
//  Copyright © 2020 eSoft Technologies. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    var timer: Timer?
    @IBOutlet weak var btnMove: UIButton!
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
       
    }
    
    @IBAction func btnAddTapped(_ sender: Any) {
//        let node = SCNNode()
//        node.name = "ball"
//       // node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
//        //node.geometry = SCNSphere(radius: 0.1)
//        //node.geometry = SCNCone(topRadius: 0.2, bottomRadius: 0.1, height: 0.5)
////        let path = UIBezierPath()
////        path.move(to: CGPoint(x: 0, y: 0))
////        path.addLine(to: CGPoint(x: 0, y: 0.2))
////        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
////         path.addLine(to: CGPoint(x: 0.4, y: 0.2))
////        path.addLine(to: CGPoint(x: 0.4, y: 0.0))
////        let shape = SCNShape(path: path, extrusionDepth: 0.2)
////        node.geometry = shape
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
//        node.geometry?.firstMaterial?.specular.contents = UIColor.white
//
////        let x = ramdomNumbers(firstNum: -0.3, secondNum: 0.3)
////        let y = ramdomNumbers(firstNum: -0.3, secondNum: 0.3)
////        let z = ramdomNumbers(firstNum: -0.3, secondNum: -0.5)
//
//        node.position = SCNVector3(0, 0, -0.3)
//        sceneView.scene.rootNode.addChildNode(node)
        buildHouse()
    }
    
    func buildHouse() {
        
        let baseNode = SCNNode(geometry: SCNPlane(width: 0.2, height: 0.2))
        baseNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        baseNode.position = SCNVector3(0.1, 0.1, -0.3)
        baseNode.eulerAngles = SCNVector3( Float(180.degreeToRadians), 0, 0)
        sceneView.scene.rootNode.addChildNode(baseNode)

        let wallNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        wallNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        wallNode.position = SCNVector3(0, 0, 0)
        baseNode.addChildNode(wallNode)
        
        let roofNode = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
        roofNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        roofNode.position = SCNVector3(0, 0, 0)
        wallNode.addChildNode(roofNode)
//
//        let doorNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
//        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
//        doorNode.position = SCNVector3(0, -0.02, 0.053)
//        wallNode.addChildNode(doorNode)
        
    }
    
    @IBAction func btnResetTapped(_ sender: Any) {
        restartSession()
    }
    
    func restartSession() {
        sceneView.session.pause()
        
        sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func ramdomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    @IBAction func btnMoveTapped(_ sender: Any) {
    
     //   timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(moveObjects), userInfo: nil, repeats: true)
    }
    
   @objc func moveObjects() {
    
    if sceneView.scene.rootNode.childNodes.count > 0 {
        sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            if node.position.z > 0.1 {
                node.removeFromParentNode()
            }
            else {
                node.position.z = node.position.z + 0.03
            }
        }
    }
    else  {
        timer?.invalidate()
    }

    }
}

extension Int {
    var degreeToRadians: Double { return Double(self) * .pi/100 }
}
