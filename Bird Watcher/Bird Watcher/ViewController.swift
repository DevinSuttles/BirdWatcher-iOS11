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
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    var recgonize = " "
    
    
    func captureOutput(_ output: AVCaptureOutput, didOutput: CMSampleBuffer, from: AVCaptureConnection)
        {
            
            guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(didOutput) else
            {return}
            
            guard let model = try? VNCoreMLModel(for: Bird().model)else{return}
            
            let request = VNCoreMLRequest(model: model)
                { (fin, err) in
                    //print(finish.results)
                    
                    guard let results = fin.results as?[VNClassificationObservation] else{return}
                    guard let firstObservation = results.first else{return}
                    
                    self.recgonize = firstObservation.identifier
                    
                    print(firstObservation.identifier)
                    
                }
            try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let secondView = segue.destination as! SecondViewController
        secondView.classify = recgonize
    }
    


}
