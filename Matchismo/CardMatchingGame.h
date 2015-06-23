//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by deus4 on 17/06/15.
//  Copyright (c) 2015 deus4. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject
//Custom init not like a superclass
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
-(void) chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic) NSUInteger maxMatchingCards;
@property (nonatomic, readonly) NSArray *lastChosenCards;
@property (nonatomic, readonly) NSInteger lastScore;
@property (nonatomic, readonly) NSInteger score;

@end
