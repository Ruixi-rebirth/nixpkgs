{ frameworks, libs, libobjc, libnetwork }: with frameworks; with libs;
{
  AGL                              = { inherit Carbon OpenGL; };
  AVFoundation                     = { inherit ApplicationServices AVFCapture AVFCore CoreGraphics simd UniformTypeIdentifiers; };
  AVKit                            = {};
  Accelerate                       = { inherit CoreWLAN IOBluetooth; };
  Accessibility                    = {};
  Accounts                         = {};
  AdSupport                        = {};
  AddressBook                      = { inherit AddressBookCore Carbon ContactsPersistence libobjc; };
  AppKit                           = { inherit ApplicationServices AudioToolbox AudioUnit Foundation QuartzCore UIFoundation; };
  AppTrackingTransparency          = {};
  AppleScriptKit                   = {};
  AppleScriptObjC                  = {};
  ApplicationServices              = { inherit ColorSync CoreGraphics CoreServices CoreText ImageIO; };
  AudioToolbox                     = { inherit AudioToolboxCore CoreAudio CoreMIDI; };
  AudioUnit                        = { inherit AudioToolbox Carbon CoreAudio; };
  AudioVideoBridging               = { inherit Foundation; };
  AuthenticationServices           = {};
  AutomaticAssessmentConfiguration = {};
  Automator                        = {};
  BackgroundTasks                  = {};
  BusinessChat                     = {};
  CFNetwork                        = {};
  CalendarStore                    = {};
  CallKit                          = {};
  Carbon                           = { inherit ApplicationServices CoreServices Foundation IOKit QuartzCore Security libobjc; };
  ClassKit                         = {};
  CloudKit                         = { inherit CoreLocation; };
  Cocoa                            = { inherit AppKit CoreData; };
  Collaboration                    = {};
  ColorSync                        = {};
  Combine                          = {};
  Contacts                         = {};
  ContactsUI                       = {};
  CoreAudio                        = { inherit IOKit CoreAudioTypes; };
  CoreAudioKit                     = { inherit AudioUnit; };
  CoreAudioTypes                   = {};
  CoreBluetooth                    = {};
  CoreData                         = { inherit CloudKit; };
  CoreDisplay                      = {};
  CoreFoundation                   = { inherit libobjc; };
  CoreGraphics                     = { inherit Accelerate IOKit IOSurface SystemConfiguration; };
  CoreHaptics                      = {};
  CoreImage                        = {};
  CoreLocation                     = {};
  CoreMIDI                         = {};
  CoreMIDIServer                   = { inherit CoreMIDI; };
  CoreML                           = {};
  CoreMedia                        = { inherit ApplicationServices AudioToolbox AudioUnit CoreAudio CoreGraphics CoreVideo; };
  CoreMediaIO                      = { inherit CoreMedia; };
  CoreMotion                       = {};
  CoreServices                     = { inherit CFNetwork CoreAudio CoreData CoreFoundation DiskArbitration NetFS OpenDirectory Security ServiceManagement; };
  CoreSpotlight                    = {};
  CoreTelephony                    = {};
  CoreText                         = { inherit CoreGraphics; };
  CoreVideo                        = { inherit ApplicationServices CoreGraphics IOSurface OpenGL; };
  CoreWLAN                         = { inherit SecurityFoundation; };
  CryptoKit                        = {};
  CryptoTokenKit                   = {};
  DVDPlayback                      = {};
  DeveloperToolsSupport            = {};
  DeviceCheck                      = {};
  DirectoryService                 = {};
  DiscRecording                    = { inherit CoreServices IOKit libobjc; };
  DiscRecordingUI                  = {};
  DiskArbitration                  = { inherit IOKit; };
  DriverKit                        = {};
  EventKit                         = {};
  ExceptionHandling                = {};
  ExecutionPolicy                  = {};
  ExternalAccessory                = {};
  FWAUserLib                       = {};
  FileProvider                     = {};
  FileProviderUI                   = {};
  FinderSync                       = {};
  ForceFeedback                    = { inherit IOKit; };
  Foundation                       = { inherit ApplicationServices CoreFoundation Security SystemConfiguration Combine libobjc; };
  GLKit                            = {};
  GLUT                             = { inherit OpenGL; };
  GSS                              = {};
  GameController                   = {};
  GameKit                          = { inherit Cocoa Foundation GameCenterFoundation GameCenterUI GameCenterUICore GameController GameplayKit Metal MetalKit ModelIO ReplayKit SceneKit SpriteKit; };
  GameplayKit                      = {};
  HIDDriverKit                     = {};
  Hypervisor                       = {};
  ICADevices                       = { inherit Carbon IOBluetooth libobjc; };
  IMServicePlugIn                  = {};
  IOBluetooth                      = { inherit CoreBluetooth IOKit; };
  IOBluetoothUI                    = { inherit IOBluetooth; };
  IOKit                            = {};
  IOSurface                        = { inherit IOKit; };
  IOUSBHost                        = {};
  IdentityLookup                   = {};
  ImageCaptureCore                 = {};
  ImageIO                          = { inherit CoreGraphics; };
  InputMethodKit                   = { inherit Carbon; };
  InstallerPlugins                 = {};
  InstantMessage                   = {};
  Intents                          = {};
  JavaNativeFoundation             = {};
  JavaRuntimeSupport               = {};
  JavaScriptCore                   = { inherit libobjc; };
  Kerberos                         = {};
  Kernel                           = { inherit IOKit; };
  KernelManagement                 = {};
  LDAP                             = {};
  LatentSemanticMapping            = { inherit Carbon; };
  LinkPresentation                 = { inherit URLFormatting; };
  LocalAuthentication              = {};
  MLCompute                        = {};
  MapKit                           = {};
  MediaAccessibility               = { inherit CoreGraphics CoreText QuartzCore; };
  MediaLibrary                     = {};
  MediaPlayer                      = {};
  MediaToolbox                     = { inherit AudioToolbox AudioUnit CoreMedia; };
  Message                          = {};
  Metal                            = {};
  MetalKit                         = { inherit Metal ModelIO; };
  MetalPerformanceShaders          = {};
  MetalPerformanceShadersGraph     = {};
  MetricKit                        = { inherit SignpostMetrics; };
  ModelIO                          = {};
  MultipeerConnectivity            = {};
  NaturalLanguage                  = {};
  NearbyInteraction                = {};
  NetFS                            = {};
  Network                          = { inherit libnetwork; };
  NetworkExtension                 = { inherit Network; };
  NetworkingDriverKit              = {};
  NotificationCenter               = {};
  OSAKit                           = { inherit Carbon; };
  OSLog                            = {};
  OpenAL                           = {};
  OpenCL                           = { inherit IOSurface OpenGL; };
  OpenDirectory                    = {};
  OpenGL                           = {};
  PCIDriverKit                     = {};
  PCSC                             = { inherit CoreData; };
  PDFKit                           = {};
  ParavirtualizedGraphics          = {};
  PassKit                          = { inherit PassKitCore; };
  PencilKit                        = {};
  Photos                           = {};
  PhotosUI                         = {};
  PreferencePanes                  = {};
  PushKit                          = {};
  Python                           = {};
  QTKit                            = { inherit CoreMedia CoreMediaIO MediaToolbox VideoToolbox; };
  Quartz                           = { inherit QTKit QuartzCore QuickLook PDFKit; };
  QuartzCore                       = { inherit ApplicationServices CoreImage CoreVideo Metal OpenCL libobjc; };
  QuickLook                        = { inherit ApplicationServices; };
  QuickLookThumbnailing            = {};
  RealityKit                       = {};
  ReplayKit                        = {};
  Ruby                             = {};
  SafariServices                   = {};
  SceneKit                         = {};
  ScreenSaver                      = {};
  ScreenTime                       = {};
  ScriptingBridge                  = {};
  Security                         = { inherit IOKit libDER; };
  SecurityFoundation               = { inherit Security; };
  SecurityInterface                = { inherit Security SecurityFoundation; };
  SensorKit                        = {};
  ServiceManagement                = { inherit Security; };
  Social                           = {};
  SoundAnalysis                    = {};
  Speech                           = {};
  SpriteKit                        = {};
  StoreKit                         = {};
  SwiftUI                          = { inherit AppKit DeveloperToolsSupport UniformTypeIdentifiers; };
  SyncServices                     = {};
  System                           = {};
  SystemConfiguration              = { inherit Security; };
  SystemExtensions                 = {};
  TWAIN                            = { inherit Carbon; };
  Tcl                              = {};
  Tk                               = {};
  USBDriverKit                     = {};
  UniformTypeIdentifiers           = {};
  UserNotifications                = {};
  UserNotificationsUI              = {};
  VideoDecodeAcceleration          = { inherit CoreVideo; };
  VideoSubscriberAccount           = {};
  VideoToolbox                     = { inherit CoreMedia CoreVideo; };
  Virtualization                   = {};
  Vision                           = {};
  WebKit                           = { inherit ApplicationServices Carbon JavaScriptCore OpenGL libobjc; };
  WidgetKit                        = {};
  iTunesLibrary                    = {};
  vmnet                            = {};
}
