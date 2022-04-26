//
//  ViewController.swift
//  SolarSystemArKit
//
//  Created by Burak YAZICI on 17/03/2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
    
        let earth = createSphere(radius: 0.2, content: "earth.jpeg", vector: SCNVector3(0, 0.2, -1))
        
        let mars = createSphere(radius: 0.15, content: "mars.jpeg", vector: SCNVector3(0.5, 0.2, -1))
        
        let saturn = createSphere(radius: 0.3, content: "saturn.jpeg", vector: SCNVector3(1.2, 0.2, -1))
        
        let venus = createSphere(radius: 0.4, content: "venus.jpeg", vector: SCNVector3(2.6, 0.2, -1))
        
        sceneView.scene.rootNode.addChildNode(earth)
        sceneView.scene.rootNode.addChildNode(mars)
        sceneView.scene.rootNode.addChildNode(saturn)
        sceneView.scene.rootNode.addChildNode(venus)
        
        sceneView.automaticallyUpdatesLighting = true
    }
    
    func createSphere(radius: CGFloat, content:String, vector: SCNVector3) -> SCNNode {
        let mySphere = SCNSphere(radius: radius)
        
        let boxMaterial = SCNMaterial()
        
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        mySphere.materials = [boxMaterial]
        
        let node = SCNNode()
        node.position = vector
        node.geometry = mySphere
                                 
       return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

 
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
