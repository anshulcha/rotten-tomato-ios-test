//
//  Movie.m
//  Rotten Tomato
//
//  Created by Anshul Chaurasia on 9/15/15.
//  Copyright © 2015 yahoo. All rights reserved.
//

#import "Movie.h"


@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        self.title = dictionary[@"title"];
        self.synopsis = dictionary[@"synopsis"];
        NSString *url = [[dictionary objectForKey:@"posters"] valueForKey:@"detailed"];
        NSRange range = [url rangeOfString:@".*cloudfront.net/" options:NSRegularExpressionSearch];
        if (range.location != NSNotFound) {
            url = [url stringByReplacingCharactersInRange:range withString:@"https://content6.flixster.com/"];
        }
        self.posterUrl = url;
    }
    return self;
}

+ (NSArray *)moviesWithArray:(NSArray *)array{
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    for(NSDictionary *dictionary in array){
        Movie *movie = [[Movie alloc] initWithDictionary:dictionary];
        [movies addObject:movie];
    }
    return movies;
}

@end
