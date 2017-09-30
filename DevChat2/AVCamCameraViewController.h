/*
	Copyright (C) 2016 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	View controller for camera interface.
*/

@import UIKit;
@class AVCamPreviewView;
@protocol AVCameraVCDelegate;

@interface AVCamCameraViewController : UIViewController
@property (nonatomic, weak) AVCamPreviewView *_previewView;
@property (retain) id <AVCameraVCDelegate> delegate;
- (void)changeCamera;
- (void)toggleMovieRecording;
@end
