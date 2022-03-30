//
//  JailbrokenCheckService.swift
//  JailbrokenCheck
//
//  Created by Jeffrey hu on 2022/3/30.
//

import Foundation
import MachO

public protocol JailbrokenCheckProtocol {
  func checkIsJailbroken() -> Bool
  func checkIsExternalLibs() -> Bool
}

public struct JailbrokenServiceProvider {
  public static let service: JailbrokenCheckProtocol = JailbrokenCheckService()
}

private final class JailbrokenCheckService: JailbrokenCheckProtocol {
  private let jailbrokenPaths = [
    "/Applications/Cydia.app",
    "/usr/sbin/sshd",
    "/bin/bash",
    "/etc/apt",
    "/Library/MobileSubstrate",
    "/User/Applications/"
  ]
  
  func checkIsJailbroken() -> Bool {
    guard TARGET_OS_SIMULATOR != 1 else {
      return false
    }
    
    let fileManager = FileManager.default
    for path in jailbrokenPaths {
      if fileManager.fileExists(atPath: path) {
        return true
      }
    }
    
    return false
  }
  
  func checkIsExternalLibs() -> Bool {
    guard TARGET_OS_SIMULATOR != 1 else {
      return false
    }
    
    let dyldCount = _dyld_image_count()
    for index in 0..<dyldCount {
      if let imageName = _dyld_get_image_name(index) {
        let res = String(cString: imageName)
        if res.hasPrefix("/var/containers/Bundle/Application"),
           res.hasSuffix(".dylib") {
          return true
        }
      }
    }
    
    return false
  }
}
