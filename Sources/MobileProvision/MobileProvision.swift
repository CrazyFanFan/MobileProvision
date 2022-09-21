//
//  MobileProvision.swift
//
//
//  Created by Crazy凡 on 2020/7/4.
//

import Foundation

public struct MobileProvision: Decodable, Hashable {
    public private(set) var appIDName: String
    public private(set) var applicationIdentifierPrefix: [String]
    public private(set) var creationDate: Date
    public private(set) var platform: [String]
    public private(set) var isXcodeManaged: Bool? = false
    public private(set) var developerCertificates: [Data]
    public private(set) var entitlements: Entitlements
    public private(set) var expirationDate: Date
    public private(set) var name: String
    public private(set) var provisionedDevices: [String]?
    public private(set) var teamIdentifier: [String]
    public private(set) var teamName: String
    public private(set) var timeToLive: Int
    public private(set) var uuid: String
    public private(set) var version: Int

    public private(set) var path: URL!

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

    public init?(with fileURL: URL) {
        guard let value = Self.read(from: fileURL.path) else { return nil }
        self = value
    }
}

public extension MobileProvision {
    /// Read mobileprovision file in app.
    static func read() -> MobileProvision? {
        guard let path = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") else { return nil }
        return read(from: path)
    }

    /// Read a .mobileprovision file with path.
    static func read(from path: String) -> MobileProvision? {
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
            var provision = try decoder.decode(MobileProvision.self, from: plist)
            provision.path = URL(fileURLWithPath: path)

            return provision
        } catch {
            print(error)
            return nil
        }
    }
}
