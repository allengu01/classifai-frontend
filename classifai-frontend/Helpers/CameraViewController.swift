//
//  CameraController.swift
//  classifai-frontend
//
//  Created by Allen Gu on 7/4/21.
//

import Foundation
import UIKit
import SwiftUI
import AVFoundation

// https://medium.com/@gaspard.rosay/create-a-camera-app-with-swiftui-60876fcb9118

final class CameraViewController: UIViewController {
    let cameraController = CameraController()
    var previewView: UIView!
    
    override func viewDidLoad() {
                    
        previewView = UIView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        previewView.contentMode = UIView.ContentMode.scaleAspectFit
        view.addSubview(previewView)
        
        cameraController.prepare {(error) in
            if let error = error {
                print(error)
            }
            
            try? self.cameraController.displayPreview(on: self.previewView)
        }
        
    }
    
    class CameraController: NSObject {
        var captureSession: AVCaptureSession?
        var frontCamera: AVCaptureDevice?
        var frontCameraInput: AVCaptureDeviceInput?
        var previewLayer: AVCaptureVideoPreviewLayer?
        
        func prepare(completionHandler: @escaping (Error?) -> Void){
            func createCaptureSession(){
                self.captureSession = AVCaptureSession()
            }
            
            func configureCaptureDevices() throws {
                let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .front)
                
                self.frontCamera = camera
                
                try camera?.lockForConfiguration()
                camera?.unlockForConfiguration()
                    
            }
            
            func configureDeviceInputs() throws {
                guard let captureSession = self.captureSession else { throw CameraControllerError.captureSessionIsMissing }
                   
                if let frontCamera = self.frontCamera {
                    self.frontCameraInput = try AVCaptureDeviceInput(device: frontCamera)
                       
                    if captureSession.canAddInput(self.frontCameraInput!) { captureSession.addInput(self.frontCameraInput!)}
                    else { throw CameraControllerError.inputsAreInvalid }
                       
                }
                else { throw CameraControllerError.noCamerasAvailable }
                   
                captureSession.startRunning()
                   
            }
               
            DispatchQueue(label: "prepare").async {
                do {
                    createCaptureSession()
                    try configureCaptureDevices()
                    try configureDeviceInputs()
                }
                    
                catch {
                    DispatchQueue.main.async{
                        completionHandler(error)
                    }
                    
                    return
                }
                
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
        
        func displayPreview(on view: UIView) throws {
            guard let captureSession = self.captureSession, captureSession.isRunning else { throw CameraControllerError.captureSessionIsMissing }
                
            self.previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                self.previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            self.previewLayer?.connection?.videoOrientation = .portrait
            
            view.layer.insertSublayer(self.previewLayer!, at: 0)
            self.previewLayer?.frame = view.frame
        }
        
        enum CameraControllerError: Swift.Error {
           case captureSessionAlreadyRunning
           case captureSessionIsMissing
           case inputsAreInvalid
           case invalidOperation
           case noCamerasAvailable
           case unknown
        }
    }
}

extension CameraViewController : UIViewControllerRepresentable{
    public typealias UIViewControllerType = CameraViewController
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<CameraViewController>) -> CameraViewController {
        return CameraViewController()
    }
    
    public func updateUIViewController(_ uiViewController: CameraViewController, context: UIViewControllerRepresentableContext<CameraViewController>) {
    }
}
