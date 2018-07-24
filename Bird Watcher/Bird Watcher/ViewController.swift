//
//  ViewController.swift
//  Bird Watcher
//
//  Created by Devin Suttles on 6/17/18.
//  Copyright © 2018 Devin Suttles. All rights reserved.
//

import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate
{
    
    @IBOutlet weak var bottomView: UIView!
  
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let captureSession = AVCaptureSession()
        guard let captureDevice = AVCaptureDevice.default(for: .video)else{return}
        guard let input = try? AVCaptureDeviceInput(device: captureDevice)else{return}
        
        captureSession.addInput(input)
        
        captureSession.startRunning()
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self,queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
    
        //bring camera button to subview
        view.bringSubview(toFront: bottomView)
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    var recgonize = String()
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection)
    {
        guard let model = try? VNCoreMLModel(for: Resnet50().model) else {return}
            
        let request = VNCoreMLRequest(model: model)
        { (finishedRequest, error) in
                
                guard let results = finishedRequest.results as? [VNClassificationObservation] else {return}
                guard let Observation = results.first else {return}
                
                DispatchQueue.main.async(execute: {
                    self.recgonize = Observation.identifier
                })
                
        }
            
            
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return}
            
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
            
    }
 

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let secondView = segue.destination as! SecondViewController
        secondView.classify = recgonize
    }
}
