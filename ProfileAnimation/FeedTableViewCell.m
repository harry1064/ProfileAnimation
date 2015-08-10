//
//  FeedTableViewCell.m
//  Buckett
//
//  Created by Anmol Rajdev on 08/06/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "FeedTableViewCell.h"

@implementation FeedTableViewCell{
    
}

- (void)awakeFromNib {
    // Initialization code
    _user_profile_img.layer.cornerRadius = _user_profile_img.frame.size.width/2;
    _user_profile_img.clipsToBounds = YES;
    
    
    /*************add gesture on ImageView***********/
    
    // adding singletap on imageView
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    singleTapGestureRecognizer.numberOfTapsRequired = 1;
    singleTapGestureRecognizer.enabled = YES;
    singleTapGestureRecognizer.cancelsTouchesInView = NO;
    [self.feed_img addGestureRecognizer:singleTapGestureRecognizer];
    //adding doubletap on imageview
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTapGestureRecognizer.numberOfTapsRequired = 2;
    doubleTapGestureRecognizer.enabled = YES;
    doubleTapGestureRecognizer .cancelsTouchesInView = NO;
    [self.feed_img addGestureRecognizer:doubleTapGestureRecognizer];
    [singleTapGestureRecognizer requireGestureRecognizerToFail:doubleTapGestureRecognizer];
    
       
    [_feed_img setUserInteractionEnabled:YES];
   
    
  
}


- (void)singleTap:(UITapGestureRecognizer *)gesture {
    UIImageView* view = (UIImageView *)gesture.view;
    NSLog(@"view tag  %ld",(long)view.tag );
    
    [self.delegate singleTappedImage:view.tag];
}

- (void)doubleTap:(UITapGestureRecognizer *)gesture
{
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//---------------Saturaday  work ------------------------------------------------------
- (IBAction)likeLabelbuttonClicked:(id)sender {
    
    NSLog(@"likeLabelbuttonClicked");
    UIButton * button = (UIButton *)sender;
    NSLog(@"sender%ld",(long)button.tag);
    [self.delegate pushLikeViewController:button.tag];
    
}

- (IBAction)commentLabelButtonClicked:(id)sender {
     NSLog(@"commentLabelButtonClicked");
    
     UIButton * button = (UIButton *)sender;
    
    [self.delegate pushCommentViewController:button.tag];
    
}

- (IBAction)bucketlistButtonClicked:(id)sender {
    NSLog(@"bucketlistButtonClicked");
    
    UIButton * button = (UIButton *)sender;

    [self.delegate pushBucketListViewController:button.tag];
}
//---------------Saturaday  work ------------------------------------------------------

- (IBAction)usernameClicked:(id)sender {
    NSLog(@"HI user");
}


@end
