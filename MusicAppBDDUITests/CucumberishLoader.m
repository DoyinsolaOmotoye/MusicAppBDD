//
//  CucumberishLoader.m
//  MusicAppBDDUITests
//
//  Created by Temitope Gabriel Molomo  on 22/09/2023.
//

#import <Foundation/Foundation.h>
#import "MusicAppBDDUITests-Swift.h"

__attribute__((constructor))
void CucumberishInit()
{
    [CucumberishInitializer setupCucumberish];
}
