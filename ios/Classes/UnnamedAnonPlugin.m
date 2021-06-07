#import "UnnamedAnonPlugin.h"
#if __has_include(<unnamed_anon/unnamed_anon-Swift.h>)
#import <unnamed_anon/unnamed_anon-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "unnamed_anon-Swift.h"
#endif

@implementation UnnamedAnonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUnnamedAnonPlugin registerWithRegistrar:registrar];
}
@end
