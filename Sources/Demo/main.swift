import AppKit

private let appDelegate = AppDelegate()

NSApplication.shared.delegate = appDelegate
NSApplication.shared.setActivationPolicy(.regular)
exit(NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv))
