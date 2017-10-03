//
//  AVCameraVCDelegate.h
//  DevChat2
//
//  Created by Hongbo Niu on 2017-09-29.
//  Copyright © 2017 Udemy. All rights reserved.
//

#ifndef AVCameraVCDelegate_h
#define AVCameraVCDelegate_h
@protocol AVCameraVCDelegate <NSObject>
-(void)shouldEnableCameraUI:(BOOL)enable;
-(void)shouldEnableRecordUI:(BOOL)enable;
-(void)recordingHasStarted;
-(void)canStartRecording;

-(void)videoRecordingCompleted:(NSURL*)videoURL;
-(void)videoRecordingFailed;

-(void)snapshotTaken:(NSData*)snapshotData;
-(void)snapshotFailed;
@end
#endif /* AVCameraVCDelegate_h */
