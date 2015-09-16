//
//  MovieCell.m
//  Rotten Tomato
//
//  Created by Anshul Chaurasia on 9/15/15.
//  Copyright © 2015 yahoo. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@interface MovieCell ()
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setMovie:(Movie *)movie{
    _movie = movie;
    self.titleLabel.text = movie.title;
    self.synopsisLabel.text = movie.synopsis;
    
    [self.posterView setImageWithURL:[NSURL URLWithString:movie.posterUrl]];
}

@end
