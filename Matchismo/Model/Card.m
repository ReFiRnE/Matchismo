//
//  Card.m
//  Matchismo
//
//  Created by deus4 on 15/06/15.
//  Copyright (c) 2015 deus4. All rights reserved.
//

#import "Card.h"

@interface Card()
@end

@implementation Card
- (NSUInteger)numberOfMatchingCards
{
    if (!_numberOfMatchingCards) _numberOfMatchingCards = 2;
    return _numberOfMatchingCards;
}

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
