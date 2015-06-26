//
//  SetCard.h
//  Matchismo
//
//  Created by deus4 on 26/06/15.
//  Copyright (c) 2015 deus4. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *texture;
@property (strong, nonatomic) NSString *color;
@property (nonatomic) NSUInteger number;

@end
