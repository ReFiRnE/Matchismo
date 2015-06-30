//
//  SetCard.m
//  Matchismo
//
//  Created by deus4 on 26/06/15.
//  Copyright (c) 2015 deus4. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard
@synthesize symbol = _symbol;
@synthesize texture = _texture;
@synthesize color = _color;

-(NSString *)symbol
{
    return _symbol ? _symbol : @"?";
}

+ (NSArray *)validSymbols
{
    return @[@"oval", @"squiggle", @"diamond"];
}

-(void)setSymbol:(NSString *)symbol
{
    if ([[SetCard validSymbols] containsObject:symbol]) _symbol = symbol;
}

-(NSString *)texture
{
    return _texture ? _texture : @"?";
}

-(void)setTexture:(NSString *)texture
{
    if ([[SetCard validTextures] containsObject:texture]) _texture = texture;
}

+(NSArray *)validTextures
{
    return @[@"solid", @"open", @"striped"];
}

-(NSString *)color
{
    return _color ? _color : @"?";
}

-(void)setColor:(NSString *)color
{
    if ([[SetCard validColors] containsObject:color]) _color = color;
}

+(NSArray *)validColors
{
    return @[@"red", @"green", @"purple"];
}

-(void)setNumber:(NSUInteger)number
{
    if (number <= [SetCard maxNumber]) _number = number;
}

+(NSUInteger)maxNumber
{
    return 3;
}

-(NSString *)contents
{
    return [NSString stringWithFormat:@"%@:%@:%@:%d", self.symbol, self.texture, self.color, self.number];
}

- (id)init
{
    self = [super init];
    
    if (self) {
        self.numberOfMatchingCards = 3;
    }
    
    return self;
}

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count] == self.numberOfMatchingCards - 1) {
        NSMutableArray *colors = [[NSMutableArray alloc] init];
        NSMutableArray *symbols = [[NSMutableArray alloc] init];
        NSMutableArray *textures = [[NSMutableArray alloc] init];
        NSMutableArray *numbers = [[NSMutableArray alloc] init];
        [colors addObject:self.color];
        [symbols addObject:self.symbol];
        [textures addObject:self.texture];
        [numbers addObject:@(self.number)];
        for (id otherCard in otherCards) {
            if ([otherCard isKindOfClass:[SetCard class]]) {
                SetCard *otherSetCard = (SetCard *)otherCard;
                if (![colors containsObject:otherSetCard.color])
                    [colors addObject:otherSetCard.color];
                if (![symbols containsObject:otherSetCard.symbol])
                    [symbols addObject:otherSetCard.symbol];
                if (![textures containsObject:otherSetCard.texture])
                    [textures addObject:otherSetCard.texture];
                if (![numbers containsObject:@(otherSetCard.number)])
                    [numbers addObject:@(otherSetCard.number)];
                if (([colors count] == 1 || [colors count] == self.numberOfMatchingCards)
                    && ([symbols count] == 1 || [symbols count] == self.numberOfMatchingCards)
                    && ([textures count] == 1 || [textures count] == self.numberOfMatchingCards)
                    && ([numbers count] == 1 || [numbers count] == self.numberOfMatchingCards)) {
                    score = 4;
                }
            }
        }
    }
    return score;
}

+(NSArray *)cardsFromText:(NSString *)text
{
    NSString *pattern = [NSString stringWithFormat:@"(%@):(%@):(%@):(\\d+)",
                         [[SetCard validSymbols] componentsJoinedByString:@"|"],
                         [[SetCard validColors] componentsJoinedByString:@"|"],
                         [[SetCard validTextures] componentsJoinedByString:@"|"]];
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    if (error) return nil;
    NSArray *matches = [regex matchesInString:text
                                      options:0
                                        range:NSMakeRange(0, [text length])];
    if (![matches count]) return nil;
    
    NSMutableArray *setCards = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult *match in matches) {
        SetCard *setCard = [[SetCard alloc] init];
        setCard.symbol = [text substringWithRange:[match rangeAtIndex:1]];
        setCard.color = [text substringWithRange:[match rangeAtIndex:2]];
        setCard.texture = [text substringWithRange:[match rangeAtIndex:3]];
        setCard.number = [[text substringWithRange:[match rangeAtIndex:4]] intValue];
        [setCards addObject:setCard];
    }
    
    return setCards;
}

@end
