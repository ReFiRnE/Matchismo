//
//  Card.h
//  Matchismo
//
//  Created by deus4 on 15/06/15.
//  Copyright (c) 2015 deus4. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;

@end
