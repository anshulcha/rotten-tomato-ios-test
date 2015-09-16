//
//  MoviesViewController.m
//  Rotten Tomato
//
//  Created by Anshul Chaurasia on 9/15/15.
//  Copyright © 2015 yahoo. All rights reserved.
//

#import "MoviesViewController.h"
#import "Movie.h"
#import "MovieCell.h"

@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *movies;

@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 150;
    
    UINib *movieCellNib = [UINib nibWithNibName:@"MovieCell" bundle:nil];
    [self.tableView registerNib:movieCellNib forCellReuseIdentifier:@"MovieCell"];
    
    NSURL *url = [NSURL URLWithString:@"https://gist.githubusercontent.com/timothy1ee/e41513a57049e21bc6cf/raw/b490e79be2d21818f28614ec933d5d8f467f0a66/gistfile1.json"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        _movies = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil][@"movies"];
        [self.tableView reloadData];
    }];
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return _movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];

//    NSString *title = [[_movies objectAtIndex:indexPath.row] objectForKey:@"title"];
    NSDictionary *dictonary = self.movies[indexPath.row];
    Movie *movie = [[Movie alloc] initWithDictionary:dictonary];
    NSLog(@"posterUrl: %@", movie.posterUrl);
    
    cell.movie = movie;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
