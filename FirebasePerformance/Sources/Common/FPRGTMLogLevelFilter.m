// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "FirebasePerformance/Sources/Common/FPRGTMLogLevelFilter.h"

@implementation FPRGTMLogLevelFilter

/**
 * Checks if the log messages received should be allowed to be shown in the console logs or not.
 *
 * @param message Log message received.
 * @param level Log level as defined in GTMLoggerLevel.
 * @return YES if message should be logged by GTMLogger. NO, otherwise.
 */
- (BOOL)filterAllowsMessage:(NSString *)message level:(GTMLoggerLevel)level {
  // GMVGIPPseudonymousIDStore is the prefix of log messages generated by GIPPseudonymousIDStore.
  if (message) {
    if ([message rangeOfString:@"[GMVGIPPseudonymousIDStore"].location != NSNotFound) {
      return NO;
    }
  }
  return YES;
}

@end
