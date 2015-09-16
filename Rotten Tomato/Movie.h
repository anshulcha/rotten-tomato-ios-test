//
//  Movie.h
//  Rotten Tomato
//
//  Created by Anshul Chaurasia on 9/15/15.
//  Copyright © 2015 yahoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *posterUrl;
//@property (nonatomic, strong) NSDictionary *dictionary;

- (NSString *) title;
- (NSString *) synopsis;
- (NSString *) posterUrl;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)moviesWithArray:(NSArray *)array;

/*- (void)setTitle:(NSString *)title;
- (void)setSynopsis:(NSString *)synopsis;
- (void)setPosterUrl:(NSString *)posterUrl;
*/
@end
