//
//  MobileProvision.swift
//
//
//  Created by Crazy凡 on 2020/7/4.
//

import Foundation

public struct MobileProvision: Hashable {
    public private(set) var appIDName: String
    public private(set) var applicationIdentifierPrefix: [String]
    public private(set) var creationDate: Date
    public private(set) var developerCertificates: [Data]
    public private(set) var expirationDate: Date
    public private(set) var isXcodeManaged: Bool? = false
    public private(set) var name: String
    public private(set) var platform: [String]
    public private(set) var provisionedDevices: [String]?
    public private(set) var rawEntitlements: [String: AnyHashable]
    public private(set) var teamIdentifier: [String]
    public private(set) var teamName: String
    public private(set) var timeToLive: Int
    public private(set) var uuid: String
    public private(set) var version: Int

    public private(set) var path: URL!
    public private(set) var entitlements: [EntitlementType: AnyHashable]

    public private(set) var applicationIdentifier: String?

    public init?(with fileURL: URL) {
        var decoder: CMSDecoder?
        var dataRef: CFData?

        CMSDecoderCreate(&decoder)

        guard let tmpDecoder = decoder, let data = try? Data(contentsOf: fileURL) else { return nil }

        let plist: Any? = data.withUnsafeBytes { (bufferRawBufferPointer) -> Any? in

            let bufferPointer: UnsafePointer<UInt8> = bufferRawBufferPointer.baseAddress!.assumingMemoryBound(to: UInt8.self)
            let rawPtr = UnsafeRawPointer(bufferPointer)
            // USE THE rawPtr

            CMSDecoderUpdateMessage(tmpDecoder, rawPtr, data.count)
            CMSDecoderFinalizeMessage(tmpDecoder)
            CMSDecoderCopyContent(tmpDecoder, &dataRef)
            if let dataRef = dataRef,
               let plist = try? PropertyListSerialization.propertyList(
                from: dataRef as Data,
                options: [.mutableContainers],
                format: nil
               ) {
                return plist
            }

            return nil
        }

        guard let plist = plist as? [String: AnyHashable] else { return nil }

        func value<T>(for key: String, default: T) -> T {
            if let tmp = plist[key] as? T {
                return tmp
            }

            assert(key == "ProvisionedDevices" || false, "Cannot read key: \(key)")
            return `default`
        }

        self.appIDName = value(for: "AppIDName", default: .init())
        self.applicationIdentifierPrefix = value(for: "ApplicationIdentifierPrefix", default: .init())
        self.creationDate = value(for: "CreationDate", default: .init())
        self.developerCertificates = value(for: "DeveloperCertificates", default: .init())
        self.expirationDate = value(for: "ExpirationDate", default: .init())
        self.isXcodeManaged = value(for: "isXcodeManaged", default: false)
        self.name = value(for: "Name", default: "")
        self.platform = value(for: "Platform", default: .init())
        self.provisionedDevices = value(for: "ProvisionedDevices", default: .init())
        self.rawEntitlements = (plist["Entitlements"] as? [String: AnyHashable]) ?? [:]
        self.teamIdentifier = value(for: "TeamIdentifier", default: .init())
        self.teamName = value(for: "TeamName", default: "")
        self.teamName = value(for: "TeamName", default: .init())
        self.timeToLive =  value(for: "TimeToLive", default: .init())
        self.uuid = value(for: "UUID", default: "")
        self.version = value(for: "Version", default: .init())

        self.path = fileURL

        self.entitlements = rawEntitlements.reduce(into: [EntitlementType: AnyHashable](), { partialResult, pair in
            if let key = EntitlementType(rawValue: pair.0) {
                partialResult[key] = pair.1
            }
        })

        self.applicationIdentifier = entitlements[.applicationIdentifier] as? String

        decoder = nil
        dataRef = nil
    }
}

public extension MobileProvision {
    /// Read mobileprovision file in app.
    static func read() -> MobileProvision? {
        guard let path = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") else { return nil }
        return .init(with: URL(fileURLWithPath: path))
    }

    /// Read a .mobileprovision file with path.
    static func read(from path: String) -> MobileProvision? {
        .init(with: URL(fileURLWithPath: path))
    }
}
