#if 0
#elif defined(__arm64__) && __arm64__
// Generated by Apple Swift version 6.0.2 effective-5.10 (swiftlang-6.0.2.1.2 clang-1600.0.26.4)
#ifndef FLUTTER_INAPPWEBVIEW_MACOS_SWIFT_H
#define FLUTTER_INAPPWEBVIEW_MACOS_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#if defined(__OBJC__)
#include <Foundation/Foundation.h>
#endif
#if defined(__cplusplus)
#include <cstdint>
#include <cstddef>
#include <cstdbool>
#include <cstring>
#include <stdlib.h>
#include <new>
#include <type_traits>
#else
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include <string.h>
#endif
#if defined(__cplusplus)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnon-modular-include-in-framework-module"
#if defined(__arm64e__) && __has_include(<ptrauth.h>)
# include <ptrauth.h>
#else
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreserved-macro-identifier"
# ifndef __ptrauth_swift_value_witness_function_pointer
#  define __ptrauth_swift_value_witness_function_pointer(x)
# endif
# ifndef __ptrauth_swift_class_method_pointer
#  define __ptrauth_swift_class_method_pointer(x)
# endif
#pragma clang diagnostic pop
#endif
#pragma clang diagnostic pop
#endif

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...) 
# endif
#endif
#if !defined(SWIFT_RUNTIME_NAME)
# if __has_attribute(objc_runtime_name)
#  define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
# else
#  define SWIFT_RUNTIME_NAME(X) 
# endif
#endif
#if !defined(SWIFT_COMPILE_NAME)
# if __has_attribute(swift_name)
#  define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
# else
#  define SWIFT_COMPILE_NAME(X) 
# endif
#endif
#if !defined(SWIFT_METHOD_FAMILY)
# if __has_attribute(objc_method_family)
#  define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
# else
#  define SWIFT_METHOD_FAMILY(X) 
# endif
#endif
#if !defined(SWIFT_NOESCAPE)
# if __has_attribute(noescape)
#  define SWIFT_NOESCAPE __attribute__((noescape))
# else
#  define SWIFT_NOESCAPE 
# endif
#endif
#if !defined(SWIFT_RELEASES_ARGUMENT)
# if __has_attribute(ns_consumed)
#  define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
# else
#  define SWIFT_RELEASES_ARGUMENT 
# endif
#endif
#if !defined(SWIFT_WARN_UNUSED_RESULT)
# if __has_attribute(warn_unused_result)
#  define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
# else
#  define SWIFT_WARN_UNUSED_RESULT 
# endif
#endif
#if !defined(SWIFT_NORETURN)
# if __has_attribute(noreturn)
#  define SWIFT_NORETURN __attribute__((noreturn))
# else
#  define SWIFT_NORETURN 
# endif
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA 
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA 
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA 
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif
#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif
#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER 
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility) 
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED_OBJC)
# if __has_feature(attribute_diagnose_if_objc)
#  define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
# else
#  define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
# endif
#endif
#if defined(__OBJC__)
#if !defined(IBSegueAction)
# define IBSegueAction 
#endif
#endif
#if !defined(SWIFT_EXTERN)
# if defined(__cplusplus)
#  define SWIFT_EXTERN extern "C"
# else
#  define SWIFT_EXTERN extern
# endif
#endif
#if !defined(SWIFT_CALL)
# define SWIFT_CALL __attribute__((swiftcall))
#endif
#if !defined(SWIFT_INDIRECT_RESULT)
# define SWIFT_INDIRECT_RESULT __attribute__((swift_indirect_result))
#endif
#if !defined(SWIFT_CONTEXT)
# define SWIFT_CONTEXT __attribute__((swift_context))
#endif
#if !defined(SWIFT_ERROR_RESULT)
# define SWIFT_ERROR_RESULT __attribute__((swift_error_result))
#endif
#if defined(__cplusplus)
# define SWIFT_NOEXCEPT noexcept
#else
# define SWIFT_NOEXCEPT 
#endif
#if !defined(SWIFT_C_INLINE_THUNK)
# if __has_attribute(always_inline)
# if __has_attribute(nodebug)
#  define SWIFT_C_INLINE_THUNK inline __attribute__((always_inline)) __attribute__((nodebug))
# else
#  define SWIFT_C_INLINE_THUNK inline __attribute__((always_inline))
# endif
# else
#  define SWIFT_C_INLINE_THUNK inline
# endif
#endif
#if defined(_WIN32)
#if !defined(SWIFT_IMPORT_STDLIB_SYMBOL)
# define SWIFT_IMPORT_STDLIB_SYMBOL __declspec(dllimport)
#endif
#else
#if !defined(SWIFT_IMPORT_STDLIB_SYMBOL)
# define SWIFT_IMPORT_STDLIB_SYMBOL 
#endif
#endif
#if defined(__OBJC__)
#if __has_feature(objc_modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import AppKit;
@import AuthenticationServices;
@import CoreFoundation;
@import FlutterMacOS;
@import Foundation;
@import ObjectiveC;
@import WebKit;
#endif

#endif
#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"
#pragma clang diagnostic ignored "-Wunsafe-buffer-usage"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="flutter_inappwebview_macos",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

#if defined(__OBJC__)

SWIFT_CLASS("_TtC26flutter_inappwebview_macos25FlutterMethodCallDelegate")
@interface FlutterMethodCallDelegate : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos15ChannelDelegate")
@interface ChannelDelegate : FlutterMethodCallDelegate
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos19ClientCertChallenge")
@interface ClientCertChallenge : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos18ClientCertResponse")
@interface ClientCertResponse : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos18CreateWindowAction")
@interface CreateWindowAction : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos18CredentialDatabase")
@interface CredentialDatabase : ChannelDelegate
@end

@class WKWebView;
@protocol WKURLSchemeTask;

SWIFT_CLASS("_TtC26flutter_inappwebview_macos19CustomSchemeHandler") SWIFT_AVAILABILITY(macos,introduced=10.13)
@interface CustomSchemeHandler : NSObject <WKURLSchemeHandler>
- (void)webView:(WKWebView * _Nonnull)webView startURLSchemeTask:(id <WKURLSchemeTask> _Nonnull)urlSchemeTask;
- (void)webView:(WKWebView * _Nonnull)webView stopURLSchemeTask:(id <WKURLSchemeTask> _Nonnull)urlSchemeTask;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos20CustomSchemeResponse")
@interface CustomSchemeResponse : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos20DownloadStartRequest")
@interface DownloadStartRequest : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos30FindInteractionChannelDelegate")
@interface FindInteractionChannelDelegate : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos25FindInteractionController")
@interface FindInteractionController : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos11FindSession")
@interface FindSession : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end



@class NSCoder;

SWIFT_CLASS("_TtC26flutter_inappwebview_macos24FlutterWebViewController")
@interface FlutterWebViewController : NSView
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)nsCoder SWIFT_UNAVAILABLE;
- (nonnull instancetype)initWithFrame:(NSRect)frameRect SWIFT_UNAVAILABLE;
@end

@protocol FlutterMessageCodec;
@protocol NSObject;

SWIFT_CLASS("_TtC26flutter_inappwebview_macos21FlutterWebViewFactory")
@interface FlutterWebViewFactory : NSObject <FlutterPlatformViewFactory>
- (id <FlutterMessageCodec, NSObject> _Nullable)createArgsCodec SWIFT_WARN_UNUSED_RESULT;
- (NSView * _Nonnull)createWithViewIdentifier:(int64_t)viewId arguments:(id _Nullable)args SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos27HeadlessInAppWebViewManager")
@interface HeadlessInAppWebViewManager : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos30HeadlessWebViewChannelDelegate")
@interface HeadlessWebViewChannelDelegate : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos13HitTestResult")
@interface HitTestResult : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos16HttpAuthResponse")
@interface HttpAuthResponse : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos27HttpAuthenticationChallenge")
@interface HttpAuthenticationChallenge : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos27InAppBrowserChannelDelegate")
@interface InAppBrowserChannelDelegate : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos19InAppBrowserManager")
@interface InAppBrowserManager : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos20InAppBrowserMenuItem")
@interface InAppBrowserMenuItem : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

@class NSBundle;

SWIFT_CLASS("_TtC26flutter_inappwebview_macos29InAppBrowserWebViewController")
@interface InAppBrowserWebViewController : NSViewController
- (void)loadView;
- (void)viewDidLoad;
- (void)viewDidAppear;
- (void)reload;
- (void)goBack;
- (void)goForward;
- (void)goBackOrForwardWithSteps:(NSInteger)steps;
- (void)onMenuItemClickedWithSender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSNibName _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSToolbar;
@class NSToolbarItem;
@class NSControl;
@class NSTextView;
@class NSNotification;

SWIFT_CLASS("_TtC26flutter_inappwebview_macos18InAppBrowserWindow")
@interface InAppBrowserWindow : NSWindow <NSSearchFieldDelegate, NSToolbarDelegate, NSWindowDelegate>
- (NSArray<NSToolbarItemIdentifier> * _Nonnull)toolbarAllowedItemIdentifiers:(NSToolbar * _Nonnull)toolbar SWIFT_WARN_UNUSED_RESULT;
- (NSArray<NSToolbarItemIdentifier> * _Nonnull)toolbarDefaultItemIdentifiers:(NSToolbar * _Nonnull)toolbar SWIFT_WARN_UNUSED_RESULT;
- (NSToolbarItem * _Nullable)toolbar:(NSToolbar * _Nonnull)toolbar itemForItemIdentifier:(NSToolbarItemIdentifier _Nonnull)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag SWIFT_WARN_UNUSED_RESULT;
- (BOOL)control:(NSControl * _Nonnull)control textView:(NSTextView * _Nonnull)textView doCommandBySelector:(SEL _Nonnull)commandSelector SWIFT_WARN_UNUSED_RESULT;
- (void)windowWillClose:(NSNotification * _Nonnull)notification;
- (nonnull instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)backingStoreType defer:(BOOL)flag OBJC_DESIGNATED_INITIALIZER;
@end

@class NSString;
@class WKSecurityOrigin;
@class WKFrameInfo;
@class WKNavigationAction;
@class WKWebpagePreferences;
@class WKDownload;
@class NSURLResponse;
@class NSURL;
@class WKNavigationResponse;
@class WKNavigation;
@class NSURLAuthenticationChallenge;
@class NSURLCredential;
@class WKOpenPanelParameters;
@class WKWebViewConfiguration;
@class WKWindowFeatures;
@class WKUserContentController;
@class WKScriptMessage;

SWIFT_CLASS("_TtC26flutter_inappwebview_macos12InAppWebView")
@interface InAppWebView : WKWebView <WKDownloadDelegate, WKNavigationDelegate, WKScriptMessageHandler, WKUIDelegate>
- (nonnull instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)observeValueForKeyPath:(NSString * _Nullable)keyPath ofObject:(id _Nullable)object change:(NSDictionary<NSKeyValueChangeKey, id> * _Nullable)change context:(void * _Nullable)context;
- (void)evaluateJavaScript:(NSString * _Nonnull)javaScriptString completionHandler:(void (^ _Nullable)(id _Nullable, NSError * _Nullable))completionHandler;
- (void)webView:(WKWebView * _Nonnull)webView requestMediaCapturePermissionForOrigin:(WKSecurityOrigin * _Nonnull)origin initiatedByFrame:(WKFrameInfo * _Nonnull)frame type:(WKMediaCaptureType)type decisionHandler:(void (^ _Nonnull)(WKPermissionDecision))decisionHandler SWIFT_AVAILABILITY(macos,introduced=12.0);
- (void)webView:(WKWebView * _Nonnull)webView decidePolicyForNavigationAction:(WKNavigationAction * _Nonnull)navigationAction preferences:(WKWebpagePreferences * _Nonnull)preferences decisionHandler:(void (^ _Nonnull)(WKNavigationActionPolicy, WKWebpagePreferences * _Nonnull))decisionHandler SWIFT_AVAILABILITY(macos,introduced=10.15);
- (void)download:(WKDownload * _Nonnull)download decideDestinationUsingResponse:(NSURLResponse * _Nonnull)response suggestedFilename:(NSString * _Nonnull)suggestedFilename completionHandler:(void (^ _Nonnull)(NSURL * _Nullable))completionHandler SWIFT_AVAILABILITY(macos,introduced=11.3);
- (void)webView:(WKWebView * _Nonnull)webView navigationResponse:(WKNavigationResponse * _Nonnull)navigationResponse didBecomeDownload:(WKDownload * _Nonnull)download SWIFT_AVAILABILITY(macos,introduced=11.3);
- (void)webView:(WKWebView * _Nonnull)webView decidePolicyForNavigationAction:(WKNavigationAction * _Nonnull)navigationAction decisionHandler:(void (^ _Nonnull)(WKNavigationActionPolicy))decisionHandler;
- (void)webView:(WKWebView * _Nonnull)webView decidePolicyForNavigationResponse:(WKNavigationResponse * _Nonnull)navigationResponse decisionHandler:(void (^ _Nonnull)(WKNavigationResponsePolicy))decisionHandler;
- (void)webView:(WKWebView * _Nonnull)webView didStartProvisionalNavigation:(WKNavigation * _Null_unspecified)navigation;
- (void)webView:(WKWebView * _Nonnull)webView didFinishNavigation:(WKNavigation * _Null_unspecified)navigation;
- (void)webView:(WKWebView * _Nonnull)view didFailProvisionalNavigation:(WKNavigation * _Null_unspecified)navigation withError:(NSError * _Nonnull)error;
- (void)webView:(WKWebView * _Nonnull)webView didFailNavigation:(WKNavigation * _Null_unspecified)navigation withError:(NSError * _Nonnull)error;
- (void)webView:(WKWebView * _Nonnull)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge * _Nonnull)challenge completionHandler:(void (^ _Nonnull)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler;
- (void)webView:(WKWebView * _Nonnull)webView runOpenPanelWithParameters:(WKOpenPanelParameters * _Nonnull)parameters initiatedByFrame:(WKFrameInfo * _Nonnull)frame completionHandler:(void (^ _Nonnull)(NSArray<NSURL *> * _Nullable))completionHandler SWIFT_AVAILABILITY(macos,introduced=10.12);
- (void)webView:(WKWebView * _Nonnull)webView runJavaScriptAlertPanelWithMessage:(NSString * _Nonnull)message initiatedByFrame:(WKFrameInfo * _Nonnull)frame completionHandler:(void (^ _Nonnull)(void))completionHandler;
- (void)webView:(WKWebView * _Nonnull)webView runJavaScriptConfirmPanelWithMessage:(NSString * _Nonnull)message initiatedByFrame:(WKFrameInfo * _Nonnull)frame completionHandler:(void (^ _Nonnull)(BOOL))completionHandler;
- (void)webView:(WKWebView * _Nonnull)webView runJavaScriptTextInputPanelWithPrompt:(NSString * _Nonnull)message defaultText:(NSString * _Nullable)defaultValue initiatedByFrame:(WKFrameInfo * _Nonnull)frame completionHandler:(void (^ _Nonnull)(NSString * _Nullable))completionHandler;
- (WKWebView * _Nullable)webView:(WKWebView * _Nonnull)webView createWebViewWithConfiguration:(WKWebViewConfiguration * _Nonnull)configuration forNavigationAction:(WKNavigationAction * _Nonnull)navigationAction windowFeatures:(WKWindowFeatures * _Nonnull)windowFeatures SWIFT_WARN_UNUSED_RESULT;
- (void)webView:(WKWebView * _Nonnull)webView authenticationChallenge:(NSURLAuthenticationChallenge * _Nonnull)challenge shouldAllowDeprecatedTLS:(void (^ _Nonnull)(BOOL))decisionHandler;
- (void)webViewDidClose:(WKWebView * _Nonnull)webView;
- (void)webViewWebContentProcessDidTerminate:(WKWebView * _Nonnull)webView;
- (void)webView:(WKWebView * _Nonnull)webView didCommitNavigation:(WKNavigation * _Null_unspecified)navigation;
- (void)webView:(WKWebView * _Nonnull)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation * _Null_unspecified)navigation;
- (void)userContentController:(WKUserContentController * _Nonnull)userContentController didReceiveScriptMessage:(WKScriptMessage * _Nonnull)message;
- (nonnull instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration * _Nonnull)configuration SWIFT_UNAVAILABLE;
@end

@protocol FlutterPluginRegistrar;

SWIFT_CLASS("_TtC26flutter_inappwebview_macos25InAppWebViewFlutterPlugin")
@interface InAppWebViewFlutterPlugin : NSObject <FlutterPlugin>
+ (void)registerWithRegistrar:(id <FlutterPluginRegistrar> _Nonnull)registrar;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos19InAppWebViewManager")
@interface InAppWebViewManager : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos15JsAlertResponse")
@interface JsAlertResponse : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos17JsConfirmResponse")
@interface JsConfirmResponse : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos16JsPromptResponse")
@interface JsPromptResponse : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos11LeakAvoider")
@interface LeakAvoider : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos15MyCookieManager") SWIFT_AVAILABILITY(macos,introduced=10.13)
@interface MyCookieManager : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos19MyWebStorageManager")
@interface MyWebStorageManager : ChannelDelegate
@end






SWIFT_CLASS("_TtC26flutter_inappwebview_macos17PermissionRequest")
@interface PermissionRequest : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos18PermissionResponse")
@interface PermissionResponse : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos12PlatformUtil")
@interface PlatformUtil : ChannelDelegate
@end

@class WKContentWorld;

SWIFT_CLASS("_TtC26flutter_inappwebview_macos10UserScript")
@interface UserScript : WKUserScript
- (nonnull instancetype)initWithSource:(NSString * _Nonnull)source injectionTime:(WKUserScriptInjectionTime)injectionTime forMainFrameOnly:(BOOL)forMainFrameOnly OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithSource:(NSString * _Nonnull)source injectionTime:(WKUserScriptInjectionTime)injectionTime forMainFrameOnly:(BOOL)forMainFrameOnly inContentWorld:(WKContentWorld * _Nonnull)contentWorld OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(macos,introduced=11.0);
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos12PluginScript")
@interface PluginScript : UserScript
- (nonnull instancetype)initWithSource:(NSString * _Nonnull)source injectionTime:(WKUserScriptInjectionTime)injectionTime forMainFrameOnly:(BOOL)forMainFrameOnly OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithSource:(NSString * _Nonnull)source injectionTime:(WKUserScriptInjectionTime)injectionTime forMainFrameOnly:(BOOL)forMainFrameOnly inContentWorld:(WKContentWorld * _Nonnull)contentWorld OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(macos,introduced=11.0);
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos15PrintAttributes")
@interface PrintAttributes : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos23PrintJobChannelDelegate")
@interface PrintJobChannelDelegate : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos18PrintJobController")
@interface PrintJobController : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos12PrintJobInfo")
@interface PrintJobInfo : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos15PrintJobManager")
@interface PrintJobManager : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos23ServerTrustAuthResponse")
@interface ServerTrustAuthResponse : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos20ServerTrustChallenge")
@interface ServerTrustChallenge : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos6Size2D")
@interface Size2D : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos14SslCertificate")
@interface SslCertificate : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos8SslError")
@interface SslError : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end













@class ASWebAuthenticationSession;

SWIFT_CLASS("_TtC26flutter_inappwebview_macos24WebAuthenticationSession")
@interface WebAuthenticationSession : NSObject <ASWebAuthenticationPresentationContextProviding>
- (ASPresentationAnchor _Nonnull)presentationAnchorForWebAuthenticationSession:(ASWebAuthenticationSession * _Nonnull)session SWIFT_WARN_UNUSED_RESULT SWIFT_AVAILABILITY(macos,introduced=10.15);
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos39WebAuthenticationSessionChannelDelegate")
@interface WebAuthenticationSessionChannelDelegate : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos31WebAuthenticationSessionManager")
@interface WebAuthenticationSessionManager : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos10WebMessage")
@interface WebMessage : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos17WebMessageChannel")
@interface WebMessageChannel : FlutterMethodCallDelegate
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos32WebMessageChannelChannelDelegate")
@interface WebMessageChannelChannelDelegate : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos18WebMessageListener")
@interface WebMessageListener : FlutterMethodCallDelegate
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos33WebMessageListenerChannelDelegate")
@interface WebMessageListenerChannelDelegate : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos14WebMessagePort")
@interface WebMessagePort : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos16WebResourceError")
@interface WebResourceError : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos18WebResourceRequest")
@interface WebResourceRequest : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos19WebResourceResponse")
@interface WebResourceResponse : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos22WebViewChannelDelegate")
@interface WebViewChannelDelegate : ChannelDelegate
@end


SWIFT_CLASS("_TtC26flutter_inappwebview_macos16WebViewTransport")
@interface WebViewTransport : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

#endif
#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#if defined(__cplusplus)
#endif
#pragma clang diagnostic pop
#endif

#else
#error unsupported Swift architecture
#endif
