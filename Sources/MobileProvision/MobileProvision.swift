//
//  MobileProvision.swift
//
//
//  Created by Crazy凡 on 2020/7/4.
//

import Foundation

public struct MobileProvision: Decodable {
    public var appIDName: String
    public var applicationIdentifierPrefix: [String]
    public var creationDate: Date
    public var platform: [String]
    public var isXcodeManaged: Bool? = false
    public var developerCertificates: [Data]
    public var entitlements: Entitlements
    public var expirationDate: Date
    public var name: String
    public var provisionedDevices: [String]?
    public var teamIdentifier: [String]
    public var teamName: String
    public var timeToLive: Int
    public var uuid: String
    public var version: Int

    private enum CodingKeys: String, CodingKey {
        case appIDName = "AppIDName"
        case applicationIdentifierPrefix = "ApplicationIdentifierPrefix"
        case creationDate = "CreationDate"
        case platform = "Platform"
        case isXcodeManaged = "IsXcodeManaged"
        case developerCertificates = "DeveloperCertificates"
        case entitlements = "Entitlements"
        case expirationDate = "ExpirationDate"
        case name = "Name"
        case provisionedDevices = "ProvisionedDevices"
        case teamIdentifier = "TeamIdentifier"
        case teamName = "TeamName"
        case timeToLive = "TimeToLive"
        case uuid = "UUID"
        case version = "Version"
    }
}

extension MobileProvision {
    /// Read mobileprovision file in app.
    public static func read() -> MobileProvision? {
        guard let path = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") else { return nil }
        return read(from: path)
    }

    /// Read a .mobileprovision file with path.
    public static func read(from path: String) -> MobileProvision? {
        guard let string = try? NSString(contentsOfFile: path, encoding: String.Encoding.isoLatin1.rawValue) else {
            return nil
        }

        let plistStart = "<?xml"
        let plistEnd = "</plist>"

        let scanner = Scanner(string: string as String)
        if #available(OSX 10.15, iOS 13.0, tvOS 13.0, *) {
            guard scanner.scanUpToString(plistStart) != nil else { return nil }
        } else {
            guard scanner.scanUpTo(plistStart, into: nil) else { return nil }
        }

        let extractedPlist: String

        if #available(OSX 10.15, iOS 13.0, tvOS 13.0, *) {
            guard let _extractedPlist = scanner.scanUpToString(plistEnd) else { return nil }
            extractedPlist = _extractedPlist
        } else {
            var nsExtractedPlist: NSString?
            guard scanner.scanUpTo(plistEnd, into: &nsExtractedPlist),
                let _extractedPlist = nsExtractedPlist as String? else {
                return nil
            }

            extractedPlist = _extractedPlist
        }

        guard let plist = extractedPlist.appending(plistEnd).data(using: .isoLatin1) else { return nil }

        let decoder = PropertyListDecoder()

        do {
            return try decoder.decode(MobileProvision.self, from: plist)
        } catch {
            print(error)
            return nil
        }
    }
}
