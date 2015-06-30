//
//  SetDeck.m
//  Matchismo
//
//  Created by deus4 on 26/06/15.
//  Copyright (c) 2015 deus4. All rights reserved.
//
#import "SetCard.h"
#import "SetDeck.h"

@implementation SetDeck
- (id)init
{
    self = [super init];
    if (self) {
        for (NSString *color in [SetCard validColors]) {
            for (NSString *symbol in [SetCard validSymbols]) {
                for (NSString *texture in [SetCard validTextures]) {
                    for (NSUInteger number = 1; number <= [SetCard maxNumber]; number++) {
                        SetCard *card = [[SetCard alloc] init];
                        card.color = color;
                        card.symbol = symbol;
                        card.texture = texture;
                        card.number = number;
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    return self;
}
@end
