//
//  VideoDetailViewController.m
//  AltConf
//
//  Created by Aaron Stephenson on 8/12/2015.
//  Copyright © 2015 Bronron Apps. All rights reserved.
//  Twitter: @iOSAaron
//  Website: http://aaronstephenson.me
//
#import "VideoDetailViewController.h"
#import "Header.h"

@import AVKit;

@interface VideoDetailViewController ()
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *speakerLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UIButton *playButton;
@property (nonatomic, strong) NSDictionary *videoDictionary;
@end

@implementation VideoDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // When setupVideoDictionary is called from the TableView Controller, this VC has not yet loaded from NIB.
    // This causes a bug where the labels show their default NIB contents.
    // Calling this method in viewDidLoad should cause the Labels to populate after loading from NIB.
    [self setupVideoDictionaryObject:self.videoDictionary];
}

//Setup detail labels
- (void)setupVideoDictionaryObject:(NSDictionary *)videoDictionary
{
    [UIView animateWithDuration:0.3 animations: ^{
        self.videoDictionary = videoDictionary;
        self.titleLabel.text = [self.videoDictionary objectForKey:kTitleKey];
        self.speakerLabel.text = [self.videoDictionary objectForKey:kSpeakerKey];
        self.descriptionLabel.text = [self.videoDictionary objectForKey:kDescriptionKey];
        [self.view layoutIfNeeded];
    }];
}

//Plays the video on selecting the Play Video button
- (IBAction)playVideo:(id)sender
{
    AVPlayerViewController *vc = [AVPlayerViewController new];
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:self.videoDictionary[kVideoURLKey]]];
    vc.player = player;
    [self presentViewController:vc animated:true completion:^{
        [player play];
    }];
}

@end
