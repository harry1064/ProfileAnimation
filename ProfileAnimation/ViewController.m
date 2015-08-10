//
//  ViewController.m
//  ProfileAnimation
//
//  Created by Harpreet singh on 09/08/15.
//  Copyright (c) 2015 Harpreet singh. All rights reserved.
//

#import "ViewController.h"
#import "FeedTableViewCell.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraintOfBackgroudImage;
@property (weak, nonatomic) IBOutlet UIView *navigationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_tableView registerClass:[FeedTableViewCell class] forCellReuseIdentifier:@"feedCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"FeedTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"feedCell"];
    [_bgImageView layoutIfNeeded];
    _navigationView.alpha = 0;
    _navigationView.hidden= NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count=0;
    if (collectionView.tag == 0) {
        count = 10;
        NSLog(@"wishlistcount%ld",(long)count);
    }else if (collectionView.tag == 1)
    {
        count = 12;
        NSLog(@"feedlistcount%ld",(long)count);
    }
    
    
    return count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cellcollect;
    
    if (collectionView.tag==0) {
        
        cellcollect = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostCell" forIndexPath:indexPath];
        cellcollect.backgroundColor = [UIColor greenColor];
        
        
        
    }
    
    else{
        cellcollect = [collectionView dequeueReusableCellWithReuseIdentifier:@"feed_Grid" forIndexPath:indexPath];
        
        cellcollect.backgroundColor = [UIColor redColor];
        
    }return cellcollect;
}

#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize retval =  CGSizeMake((self.view.frame.size.width/3)-10, (self.view.frame.size.width/3)-10);
    
    return retval;
}

#pragma mark tableview delegates


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // static NSString *simpleTableIdentifier = @"feedCell";
    
   
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FeedTableViewCell" owner:self options:nil];
    FeedTableViewCell *cell = (FeedTableViewCell *)[nib objectAtIndex:0];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
- (CGFloat)tableView:(UITableView *)tableView
estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 436;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGPoint offset = scrollView.contentOffset;
   
    
    CGFloat yVelocity = [scrollView.panGestureRecognizer velocityInView:scrollView].y;
    if (yVelocity < 0) {
        NSLog(@"Up");
        
        if (_topConstraint.constant>-(_bgImageView.frame.size.height-64)) {
           
            
            
            
            if ( (_topConstraint.constant-offset.y)<-(_bgImageView.frame.size.height-64)) {
                 _topConstraint.constant=-(_bgImageView.frame.size.height-64);
                [self.view setNeedsUpdateConstraints];
                [UIView animateWithDuration:0.2 animations:^{
                    [self.view layoutIfNeeded];
                     _navigationView.alpha = 1.0;
                }];
               
                
            }else{
                 scrollView.contentOffset = CGPointMake(0, 0);
            _topConstraint.constant-=offset.y;
                _navigationView.alpha = ((_topConstraint.constant)/-(_bgImageView.frame.size.height-64));
                
            }
        }else{
            
        }
        
        
    } else if (yVelocity > 0) {
        NSLog(@"Down");
        if (offset.y<0 && _topConstraint.constant<0 && (_topConstraint.constant+(-offset.y))<=0) {
           
                _topConstraint.constant+=(-offset.y);
            _navigationView.alpha = ((_topConstraint.constant)/-(_bgImageView.frame.size.height-64));
            
        }else{
           
        }
        
    } else {
        NSLog(@"Can't determine direction as velocity is 0");
        
    }

    
}
- (IBAction)griddClicked:(id)sender {
    UIButton * bu = (UIButton*)sender;
    if(!bu.selected){
        bu.selected = YES;
    _tableView.hidden = YES;
    _postLsitVie.hidden = NO;
    }else{
        bu.selected = NO;
        _tableView.hidden = NO;
        _postLsitVie.hidden = YES;
    }
}
@end
