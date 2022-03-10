//
//  Entitlements.swift
//
//
//  Created by Crazy凡 on 2020/7/4.
//

import Foundation

public extension MobileProvision {
    enum Environment: String, Decodable {
        case development
        case production
        case disabled
    }

    // Sublevel: decode entitlements informations
    struct Entitlements: Decodable {
        public var applicationIdentifier: String?

        // MARK: - Topic: Authentication

        /// A Boolean value that indicates whether the app may, with user permission, provide user names and passwords for AutoFill in Safari and other apps.
        public var developerAuthenticationServicesAutofillCredentialProvider: Bool?

        /// An entitlement that lets your app use Sign in with Apple.
        public var developerApplesignin: [String]?

        // MARK: - Topic: App Clips

        /// A list of parent application identifiers for an app clip with exactly one entry.
        public var developerParentApplicationIdentifiers: [String]?

        /// A Boolean value that indicates whether a bundle represents an app clip.
        public var developerOnDemandInstallCapable: Bool?

        // MARK: - Topic: CarPlay & There is no description of these keys.

        public var developerCarplayAudio: Bool?
        public var developerCarplayCharging: Bool?
        public var developerCarplayCommunication: Bool?
        public var developerCarplayMaps: Bool?
        public var developerCarplayParking: Bool?
        public var developerCarplayQuickOrdering: Bool?
        public var developerCarplayMessaging: Bool?
        public var developerCarplayContent: Bool?

        // MARK: - Topic: Contacts

        /// A Boolean value that indicates whether the app may access the notes stored in contacts.
        public var developerContactsNotes: Bool?

        // MARK: - Topic: Core Location

        /// Enables a location sharing app, with a user’s authorization, to query a user’s location in response to a location push from Apple Push Notification service (APNs).
        public var developerLocationPush: Bool?

        // MARK: - Topic: Education

        /// The ClassKit development or production environment for an education app that works with the Schoolwork app.
        public var developerClasskitEnvironment: String?

        /// A Boolean value that indicates whether an app may create an assessment session.
        public var developerAutomaticAssessmentConfiguration: Bool?

        // MARK: - Topic: Exposure Notification

        /// A Boolean value that indicates whether the app may use exposure notification.
        public var developerExposureNotification: Bool?

        // MARK: - Family Controls

        /// A Boolean value that indicates whether the app can request or revoke authorization to provide parental controls.
        public var developerFamilyControls: Bool?

        // MARK: - File Provider

        /// A Boolean value that indicates whether you can place domains in testing mode.
        public var developerFileproviderTestingMode: Bool?

        // MARK: - Group Activities

        /// A Boolean value that indicates whether the app may implement shared group experiences.
        public var developerGroupSession: Bool?

        // MARK: - Topic: Games

        /// A Boolean value that indicates whether users of the app may see and compare achievements on a leaderboard, invite friends, and start multiplayer games.
        public var developerGameCenter: Bool?

        // MARK: - Topic: Health

        /// A Boolean value that indicates whether the app may request user authorization to access health and activity data that appears in the Health app.
        public var developerHealthkit: Bool?

        /// Health data types that require additional permission.
        public var developerHealthkitAccess: [String]?

        /// A Boolean value that indicates whether observer queries receive updates while running in the background.
        public var developerHealthkitBackgroundDelivery: Bool?

        /// A Boolean value that determines whether your app can recalibrate the prediction algorithm used to calculate supported sample types.
        public var developerHealthkitRecalibrateEstimates: Bool?

        // MARK: - Topic: Home Automation

        /// A Boolean value that indicates whether users of the app may manage HomeKit-compatible accessories.
        public var developerHomekit: Bool?

        // MARK: - Topic: Hypervisor

        /// A Boolean value that indicates whether the app creates and manages virtual machines.
        public var securityHypervisor: Bool?

        /// A boolean that indicates whether the app creates and manages virtual machines.
        public var vmHypervisor: Bool?

        /// A boolean that indicates whether the app captures USB devices and uses them in the guest operating system.
        public var vmDeviceAccess: Bool?

        /// A boolean that indicates whether the app manages virtual network interfaces without escalating privileges to the root user.
        public var vmNetworking: Bool?

        /// A Boolean that indicates whether the app can use the Virtualization framework.
        public var securityVirtualization: Bool?

        // MARK: - Topic: iCloud

        /// The container identifiers for the iCloud development environment.
        public var developerIcloudContainerDevelopmentContainerIdentifiers: [String]?

        /// The development or production environment to use for the iCloud containers.
        /// Note. Apple's documentation says that the type of value is `String`, which is actually an `Array of strings`.
        /// https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_icloud-container-environment
        public var developerIcloudContainerEnvironment: [String]?

        /// The container identifiers for the iCloud production environment.
        public var developerIcloudContainerIdentifiers: [String]?

        /// The iCloud services used by the app.
        /// Note. Apple's documentation: `Array of strings`,Test result: `String`.
        /// https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_icloud-container-environment
        public var developerIcloudServices: String?

        /// The container identifier to use for iCloud key-value storage.
        public var developerUbiquityKvstoreIdentifier: String?

        // MARK: - Topic: Media

        /// A Boolean value that indicates whether the app may continue using the camera while running alongside another foreground app.
        public var developerAvfoundationMultitaskingCameraAccess: Bool?

        // MARK: - Topic: Memory

        /// A Boolean value that indicates whether the app may continue using the camera while running alongside another foreground app.
        public var developerKernelIncreasedMemoryLimit: Bool?

        /// A Boolean value that indicates whether the app may access an extended address space.
        public var comAppleDeveloperKernelExtendedVirtualAddressing: Bool?

        // MARK: - Topic: Networking

        /// The APIs an app can use to customize networking features.
        public var developerNetworkingNetworkextension: [String]?

        /// The API an app can use to create and control a custom system VPN configuration.
        public var developerNetworkingVpnApi: [String]?

        /// The associated domains for specific services, such as shared web credentials and universal links.
        /// Note. Apple's document: `Array of strings`; Test result: `String`
        /// https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_associated-domains
        public var developerAssociatedDomains: String?

        /// A Boolean value that indicates whether an app can send or receive IP multicast traffic.
        public var developerNetworkingMulticast: Bool?

        public var developerAssociatedDomainsApplinksReadWrite: Bool?

        /// The entitlement developers need to use the ThreadNetwork API.
        public var developerNetworkingManageThreadNetworkCredentials: Bool?

        // MARK: - Topic: Push Notifications

        /// The environment for push notifications.
        public var apsEnvironment: Environment

        /// The environment for push notifications in macOS apps.
        public var developerApsEnvironment: String?

        /// Enable receiving notifications without displaying the notification to the user.
        public var developerUsernotificationsFiltering: Bool?

        // MARK: - Topic: Security -> App Sandbox -> Essentials

        /// A Boolean value that indicates whether the app may use access control technology to contain damage to the system and user data if an app is compromised.
        public var securityAppSandbox: Bool?

        // MARK: - Topic: Security -> App Sandbox -> Network

        /// A Boolean value indicating whether your app may listen for incoming network connections.
        public var securityNetworkServer: Bool?

        /// A Boolean value indicating whether your app may open outgoing network connections.
        public var securityNetworkClient: Bool?

        // MARK: - Topic: Security -> App Sandbox -> Hardware

        /// A Boolean value that indicates whether the app may capture movies and still images using the built-in camera.
        public var securityDeviceCamera: Bool?

        /// A Boolean value that indicates whether the app may use the microphone.
        public var securityDeviceMicrophone: Bool?

        /// A Boolean value indicating whether your app may interact with USB devices.
        public var securityDeviceUsb: Bool?

        /// A Boolean value indicating whether your app may print a document.
        public var securityPrint: Bool?

        /// A Boolean value indicating whether your app may interact with Bluetooth devices.
        public var securityDeviceBluetooth: Bool?

        // MARK: - Topic: Security -> App Sandbox -> App Data

        /// A Boolean value that indicates whether the app may have read-write access to contacts in the user's address book.
        public var securityPersonalInformationAddressbook: Bool?

        /// A Boolean value that indicates whether the app may access location information from Location Services.
        public var securityPersonalInformationLocation: Bool?

        /// A Boolean value that indicates whether the app may have read-write access to the user's calendar.
        public var securityPersonalInformationCalendars: Bool?

        // MARK: - Topic: Security -> App Sandbox -> File Access

        /// A Boolean value that indicates whether the app may have read-write access to files the user has selected using an Open or Save dialog.
        public var securityFilesUserSelectedReadWrite: Bool?

        /// A Boolean value that indicates whether the app may have read-only access to files the user has selected using an Open or Save dialog.
        public var securityFilesDownloadsReadOnly: Bool?

        /// A Boolean value that indicates whether the app may have read-write access to the Downloads folder.
        public var securityFilesDownloadsReadWrite: Bool?

        /// A Boolean value that indicates whether the app may have read-only access to the Pictures folder.
        public var securityAssetsPicturesReadOnly: Bool?

        /// A Boolean value that indicates whether the app may have read-write access to the Pictures folder.
        public var securityAssetsPicturesReadWrite: Bool?

        /// A Boolean value that indicates whether the app may have read-only access to the Music folder.
        public var securityAssetsMusicReadOnly: Bool?

        /// A Boolean value that indicates whether the app may have read-write access to the Music folder.
        public var securityAssetsMusicReadWrite: Bool?

        /// A Boolean value that indicates whether the app may have read-only access to the Movies folder.
        public var securityAssetsMoviesReadOnly: Bool?

        /// A Boolean value that indicates whether the app may have read-write access to the Movies folder.
        public var securityAssetsMoviesReadWrite: Bool?

        /// A Boolean value that indicates whether the app may have access to all files.
        public var securityFilesAll: Bool?

        // MARK: - Topic: Security -> Hardened Runtime -> Runtime Exceptions

        /// A Boolean value that indicates whether the app may create writable and executable memory using the MAP_JIT flag.
        public var securityCsAllowJit: Bool?

        /// A Boolean value that indicates whether the app may create writable and executable memory without the restrictions imposed by using the MAP_JIT flag.
        public var securityCsAllowUnsignedExecutableMemory: Bool?

        /// A Boolean value that indicates whether the app may be affected by dynamic linker environment variables, which you can use to inject code into your app’s process.
        public var securityCsAllowDyldEnvironmentVariables: Bool?

        /// A Boolean value that indicates whether the app may load arbitrary plug-ins or frameworks, without requiring code signing.
        public var securityCsDisableLibraryValidation: Bool?

        /// A Boolean value that indicates whether to disable all code signing protections while launching an app, and during its execution.
        public var securityCsDisableExecutablePageProtection: Bool?

        /// A Boolean value that indicates whether the app is a debugger and may attach to other processes or get task ports.
        public var securityCsDebugger: Bool?

        // MARK: - Topic: Security -> Hardened Runtime -> Resource Access

        /// A Boolean value that indicates whether the app may record audio using the built-in microphone and access audio input using Core Audio.
        public var securityDeviceAudioInput: Bool?

        /*
         The following cases are defined in other sections.

         /// A Boolean value that indicates whether the app may capture movies and still images using the built-in camera.
         public var securityDeviceCamera: Bool? = nil

         /// A Boolean value that indicates whether the app may access location information from Location Services.
         public var securityPersonalInformationLocation: Bool? = nil

         /// A Boolean value that indicates whether the app may have read-write access to contacts in the user's address book.
         public var securityPersonalInformationAddressbook: Bool? = nil

         /// A Boolean value that indicates whether the app may have read-write access to the user's calendar.
         public var securityPersonalInformationCalendars: Bool? = nil
         */

        /// A Boolean value that indicates whether the app has read-write access to the user's Photos library.
        public var securityPersonalInformationPhotosLibrary: Bool?

        /// A Boolean value that indicates whether the app may prompt the user for permission to send Apple events to other apps.
        public var securityAutomationAppleEvents: Bool?

        // MARK: - Topic: Security

        /// A list of identifiers specifying the groups your app belongs to.
        public var securityApplicationGroups: [String]?

        /// The identifiers for the keychain groups that the app may share items with.
        public var keychainAccessGroups: [String]?

        /// The level of data protection that encrypts sensitive user data when accessed on some devices.
        public var developerDefaultDataProtection: String?

        /// The level of data protection that encrypts sensitive user data when accessed on some devices.
        public var developerDevicecheckAppattestEnvironment: String?

        /// A Boolean that indicates whether your app has access to smart card slots and smart cards.
        public var securitySmartcard: Bool?

        // MARK: - Topic: Sensors

        public enum Sensors: String, Decodable {
            /// A sensor that describes the watch’s position on the wrist.
            case onWrist = "on-wrist"

            /// A sensor that provides ambient light information.
            case ambientLightSensor = "ambient-light-sensor"

            /// A sensor that provides acceleration motion data.
            case motionAccelerometer = "motion-accelerometer"

            /// A sensor that provides rotation motion data.
            case motionRotationRate = "motion-rotation-rate"

            /// A sensor that provides information about the user’s frequently visited locations.
            case visits

            /// A sensor that provides information about the user’s steps.
            case pedometer

            /// A sensor that provides information about the user’s device usage.
            case deviceUsage = "device-usage"

            /// A sensor that provides information about the user’s Messages app usage.
            case messagesUsage = "messages-usage"

            /// A sensor that reports the amount of time that the user is on phone calls.
            case phoneUsage = "phone-usage"

            /// A sensor that provides information about the user’s keyboard usage.
            case keyboardMetrics = "keyboard-metrics"

            /// A sensor that provides data describing a user’s speech during phone calls.
            case speechMetricsTelephony = "speech-metrics-telephony"

            /// A sensor that provides data describing a user’s speech to Siri.
            case speechMetricsSiri = "speech-metrics-siri"

            /// A sensor that describes the pressure and temperature of the user's environment.
            case ambientPressure = "ambient-pressure"
        }

        /// The necessary entitlement to access sensor data that’s required by your app’s preapproved research study.
        public var developerSensorkitReaderAllow: [Sensors]?

        // MARK: - Topic: Siri

        /// A Boolean value that indicates whether the app handles Siri requests.
        public var developerSiri: Bool?

        // MARK: - StoreKit

        /// A Boolean value that indicates whether your app can offer external purchases.
        public var comAppleDeveloperStorekitExternalPurchase: Bool?

        /// A Boolean value that indicates whether your app can include a link that directs users to a website to make an external purchase.
        public var comAppleDeveloperStorekitExternalPurchaseLink: Bool?

        // MARK: - Topic: System -> System Extensions -> Essentials

        /// A Boolean value that indicates whether your app has permission to activate or deactivate system extensions.
        public var developerSystemExtensionInstall: Bool?

        /// A Boolean value that indicates whether other development teams may distribute a system extension you create.
        public var developerSystemExtensionRedistributable: Bool?

        // MARK: - Topic: System -> System Extensions -> Endpoint Security

        /// The entitlement required to monitor system events for potentially malicious activity.
        public var developerEndpointSecurityClient: Bool?

        // MARK: - Topic: System -> DriverKit Device Drivers -> DriverKit Device Drivers

        /// A Boolean value that indicates whether your extension has permission to run as a user-space driver.
        public var developerDriverkit: Bool?

        /// A Boolean value that indicates whether to match the driver against block storage devices that use custom drivers.
        public var developerDriverkitFamilyBlockStorageDevice: Bool?

        /// A Boolean value indicating whether to match the driver against devices that communicate using networking protocols.
        public var developerDriverkitFamilyNetworking: Bool?

        /// A Boolean value that indicates whether to match the driver against devices with SCSI controllers.
        public var developerDriverkitFamilyScsicontroller: Bool?

        /// A Boolean value that indicates whether to match the driver against devices with serial communication interfaces.
        public var developerDriverkitFamilySerial: Bool?

        /// An array of PCI device descriptors that your custom driver supports.
        public var developerDriverkitTransportPci: [[String: String]]?

        /// An array of dictionaries that identify the USB devices the driver supports.
        public var developerDriverkitTransportUsb: [[String: String]]?

        /// An array of strings that represent driver extensions which may communicate with other DriverKit services.
        public var developerDriverkitUserclientAccess: [String]?

        // MARK: - Topic:  System -> System Extensions -> Human Interface Device Drivers

        /// A Boolean value that indicates whether the driver provides a HID-related service to the system.
        public var developerDriverkitFamilyHidDevice: Bool?

        /// A Boolean value that indicates whether the driver provides a HID-related event service to the system.
        public var developerDriverkitFamilyHidEventservice: Bool?

        /// A Boolean value that indicates whether the driver communicates with human interface devices.
        public var developerDriverkitTransportHid: Bool?

        /// A Boolean value that indicates whether the driver creates a virtual HID device.
        public var developerHidVirtualDevice: Bool?

        /// A Boolean that indicates whether the app can act as a user’s default mail client.
        public var comAppleDeveloperMailClient: Bool?

        /// A Boolean that indicates whether the app can act as the user’s default web browser.
        public var comAppleDeveloperWebBrowser: Bool?

        // MARK: - Topic: TV

        /// The entitlement for distinguishing between multiple user accounts on Apple TV.
        public var developerUserManagement: [String]?

        public var developerVideoSubscriberSingleSignOn: Bool?
        public var smootSubscriptionservice: Bool?

        // MARK: - Topic: Wallet

        /// A list of identifiers that specify pass types that your app can access in Wallet.
        public var developerPassTypeIdentifiers: [String]?

        /// A list of merchant IDs your app uses for Apple Pay support.
        public var developerInAppPayments: [String]?

        // MARK: - Topic: Wireless Interfaces

        /// A Boolean value indicating whether your app can access information about the connected Wi-Fi network.
        public var developerNetworkingWifiInfo: Bool?

        /// A Boolean value indicating whether your app may configure MFi Wi-Fi accessories.
        public var externalAccessoryWirelessConfiguration: Bool?

        /// A Boolean value indicating whether your app may use Multipath protocols to seamlessly transition between Wi-Fi and cellular networks.
        public var developerNetworkingMultipath: Bool?

        /// A Boolean value indicating whether your app can use the hotspot manager to configure Wi-Fi networks.
        public var developerNetworkingHotspotconfiguration: Bool?

        /// The Near Field Communication data formats an app can read.
        public var developerNfcReadersessionFormats: [String]?

        // MARK: - Topic: Deprecated Entitlements

        /// A Boolean value that indicates whether the app may provide directions beyond what Maps supports, such as subway routes, hiking trails, and bike paths.
        public var developerMaps: Bool?

        /// A Boolean value that indicates whether the app may exchange audio with other Inter-App Audio-enabled apps.
        public var interAppAudio: Bool?

        private enum CodingKeys: String, CodingKey {
            case applicationIdentifier = "application-identifier"

            case developerAuthenticationServicesAutofillCredentialProvider = "com.apple.developer.authentication-services.autofill-credential-provider"
            case developerApplesignin = "com.apple.developer.applesignin"

            case developerParentApplicationIdentifiers = "com.apple.developer.parent-application-identifiers"
            case developerOnDemandInstallCapable = "com.apple.developer.on-demand-install-capable"

            case developerCarplayAudio = "com.apple.developer.carplay-audio"
            case developerCarplayCharging = "com.apple.developer.carplay-charging"
            case developerCarplayCommunication = "com.apple.developer.carplay-communication"
            case developerCarplayMaps = "com.apple.developer.carplay-maps"
            case developerCarplayParking = "com.apple.developer.carplay-parking"
            case developerCarplayQuickOrdering = "com.apple.developer.carplay-quick-ordering"
            case developerCarplayMessaging = "com.apple.developer.carplay-messaging"
            case developerCarplayContent = "com.apple.developer.playable-content"

            case developerContactsNotes = "com.apple.developer.contacts.notes"

            case developerLocationPush = "com.apple.developer.location.push"

            case developerClasskitEnvironment = "com.apple.developer.ClassKit-environment"
            case developerAutomaticAssessmentConfiguration = "com.apple.developer.automatic-assessment-configuration"

            case developerExposureNotification = "com.apple.developer.exposure-notification"

            case developerFamilyControls = "com.apple.developer.family-controls"

            case developerFileproviderTestingMode = "com.apple.developer.fileprovider.testing-mode"

            case developerGameCenter = "com.apple.developer.game-center"

            case developerGroupSession = "com.apple.developer.group-session"

            case developerHealthkit = "com.apple.developer.healthkit"
            case developerHealthkitAccess = "com.apple.developer.healthkit.access"
            case developerHealthkitBackgroundDelivery = "com.apple.developer.healthkit.background-delivery"
            case developerHealthkitRecalibrateEstimates = "com.apple.developer.healthkit.recalibrate-estimates"

            case developerHomekit = "com.apple.developer.homekit"

            case securityHypervisor = "com.apple.security.hypervisor"
            case vmHypervisor = "com.apple.vm.hypervisor"
            case vmDeviceAccess = "com.apple.vm.device-access"
            case vmNetworking = "com.apple.vm.networking"
            case securityVirtualization = "com.apple.security.virtualization"

            case developerIcloudContainerDevelopmentContainerIdentifiers = "com.apple.developer.icloud-container-development-container-identifiers"
            case developerIcloudContainerEnvironment = "com.apple.developer.icloud-container-environment"
            case developerIcloudContainerIdentifiers = "com.apple.developer.icloud-container-identifiers"
            case developerIcloudServices = "com.apple.developer.icloud-services"
            case developerUbiquityKvstoreIdentifier = "com.apple.developer.ubiquity-kvstore-identifier"

            case developerAvfoundationMultitaskingCameraAccess = "com.apple.developer.avfoundation.multitasking-camera-access"
            case developerKernelIncreasedMemoryLimit = "com.apple.developer.kernel.increased-memory-limit"
            case comAppleDeveloperKernelExtendedVirtualAddressing = "com.apple.developer.kernel.extended-virtual-addressing"

            case developerNetworkingNetworkextension = "com.apple.developer.networking.networkextension"
            case developerNetworkingVpnApi = "com.apple.developer.networking.vpn.api"
            case developerAssociatedDomains = "com.apple.developer.associated-domains"

            case developerNetworkingMulticast = "com.apple.developer.networking.multicast"
            case developerAssociatedDomainsApplinksReadWrite = "com.apple.developer.associated-domains.applinks.read-write"
            case developerNetworkingManageThreadNetworkCredentials = "com.apple.developer.networking.manage-thread-network-credentials"

            case apsEnvironment = "aps-environment"
            case developerApsEnvironment = "com.apple.developer.aps-environment"
            case developerUsernotificationsFiltering = "com.apple.developer.usernotifications.filtering"

            case securityAppSandbox = "com.apple.security.app-sandbox"

            case securityNetworkServer = "com.apple.security.network.server"
            case securityNetworkClient = "com.apple.security.network.client"

            case securityDeviceCamera = "com.apple.security.device.camera"
            case securityDeviceMicrophone = "com.apple.security.device.microphone"
            case securityDeviceUsb = "com.apple.security.device.usb"
            case securityPrint = "com.apple.security.print"
            case securityDeviceBluetooth = "com.apple.security.device.bluetooth"

            case securityPersonalInformationAddressbook = "com.apple.security.personal-information.addressbook"
            case securityPersonalInformationLocation = "com.apple.security.personal-information.location"
            case securityPersonalInformationCalendars = "com.apple.security.personal-information.calendars"

            case securityFilesUserSelectedReadWrite = "com.apple.security.files.user-selected.read-write"
            case securityFilesDownloadsReadOnly = "com.apple.security.files.downloads.read-only"
            case securityFilesDownloadsReadWrite = "com.apple.security.files.downloads.read-write"
            case securityAssetsPicturesReadOnly = "com.apple.security.assets.pictures.read-only"
            case securityAssetsPicturesReadWrite = "com.apple.security.assets.pictures.read-write"
            case securityAssetsMusicReadOnly = "com.apple.security.assets.music.read-only"
            case securityAssetsMusicReadWrite = "com.apple.security.assets.music.read-write"
            case securityAssetsMoviesReadOnly = "com.apple.security.assets.movies.read-only"
            case securityAssetsMoviesReadWrite = "com.apple.security.assets.movies.read-write"
            case securityFilesAll = "com.apple.security.files.all"

            case securityCsAllowJit = "com.apple.security.cs.allow-jit"
            case securityCsAllowUnsignedExecutableMemory = "com.apple.security.cs.allow-unsigned-executable-memory"
            case securityCsAllowDyldEnvironmentVariables = "com.apple.security.cs.allow-dyld-environment-variables"
            case securityCsDisableLibraryValidation = "com.apple.security.cs.disable-library-validation"
            case securityCsDisableExecutablePageProtection = "com.apple.security.cs.disable-executable-page-protection"
            case securityCsDebugger = "com.apple.security.cs.debugger"

            case securityDeviceAudioInput = "com.apple.security.device.audio-input"
            /*
             The following cases are defined in other sections
             case securityDeviceCamera = "com.apple.security.device.camera"
             case securityPersonalInformationLocation = "com.apple.security.personal-information.location"
             case securityPersonalInformationAddressbook = "com.apple.security.personal-information.addressbook"
             case securityPersonalInformationCalendars = "com.apple.security.personal-information.calendars"
             */
            case securityPersonalInformationPhotosLibrary = "com.apple.security.personal-information.photos-library"
            case securityAutomationAppleEvents = "com.apple.security.automation.apple-events"
            case securityApplicationGroups = "com.apple.security.application-groups"
            case keychainAccessGroups = "keychain-access-groups"
            case developerDefaultDataProtection = "com.apple.developer.default-data-protection"
            case developerDevicecheckAppattestEnvironment = "com.apple.developer.devicecheck.appattest-environment"
            case securitySmartcard = "com.apple.security.smartcard"

            case developerSensorkitReaderAllow = "com.apple.developer.sensorkit.reader.allow"

            case developerSiri = "com.apple.developer.siri"

            case comAppleDeveloperStorekitExternalPurchase = "com.apple.developer.storekit.external-purchase"
            case comAppleDeveloperStorekitExternalPurchaseLink = "com.apple.developer.storekit.external-purchase-link"

            case developerSystemExtensionInstall = "com.apple.developer.system-extension.install"
            case developerSystemExtensionRedistributable = "com.apple.developer.system-extension.redistributable"

            case developerEndpointSecurityClient = "com.apple.developer.endpoint-security.client"

            case developerDriverkit = "com.apple.developer.driverkit"
            case developerDriverkitFamilyBlockStorageDevice = "com.apple.developer.driverkit.family.block-storage-device"
            case developerDriverkitFamilyNetworking = "com.apple.developer.driverkit.family.networking"
            case developerDriverkitFamilyScsicontroller = "com.apple.developer.driverkit.family.scsicontroller"
            case developerDriverkitFamilySerial = "com.apple.developer.driverkit.family.serial"
            case developerDriverkitTransportPci = "com.apple.developer.driverkit.transport.pci"
            case developerDriverkitTransportUsb = "com.apple.developer.driverkit.transport.usb"
            case developerDriverkitUserclientAccess = "com.apple.developer.driverkit.userclient-access"

            case developerDriverkitFamilyHidDevice = "com.apple.developer.driverkit.family.hid.device"
            case developerDriverkitFamilyHidEventservice = "com.apple.developer.driverkit.family.hid.eventservice"
            case developerDriverkitTransportHid = "com.apple.developer.driverkit.transport.hid"
            case developerHidVirtualDevice = "com.apple.developer.hid.virtual.device"

            case comAppleDeveloperMailClient = "com.apple.developer.mail-client"
            case comAppleDeveloperWebBrowser = "com.apple.developer.web-browser"

            case developerUserManagement = "com.apple.developer.user-management"
            case developerVideoSubscriberSingleSignOn = "com.apple.developer.video-subscriber-single-sign-on"
            case smootSubscriptionservice = "com.apple.smoot.subscriptionservice"

            case developerPassTypeIdentifiers = "com.apple.developer.pass-type-identifiers"
            case developerInAppPayments = "com.apple.developer.in-app-payments"

            case developerNetworkingWifiInfo = "com.apple.developer.networking.wifi-info"
            case externalAccessoryWirelessConfiguration = "com.apple.external-accessory.wireless-configuration"
            case developerNetworkingMultipath = "com.apple.developer.networking.multipath"
            case developerNetworkingHotspotconfiguration = "com.apple.developer.networking.HotspotConfiguration"
            case developerNfcReadersessionFormats = "com.apple.developer.nfc.readersession.formats"

            case developerMaps = "com.apple.developer.maps"
            case interAppAudio = "inter-app-audio"
        }
    }
}
