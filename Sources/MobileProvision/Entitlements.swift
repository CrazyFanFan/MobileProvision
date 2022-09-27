//
//  Entitlements.swift
//
//
//  Created by Crazy凡 on 2020/7/4.
//

import Foundation

typealias Entitlements = [MobileProvision.EntitlementType: AnyHashable]

/*
 All the information from the address below: https://developer.apple.com/documentation/bundleresources/entitlements
 */

public extension MobileProvision {
    // Sublevel: decode entitlements informations
    enum EntitlementType: String, CaseIterable, Hashable {
        case applicationIdentifier = "application-identifier"

        // MARK: - Topic: Authentication

        /// A Boolean value that indicates whether the app may, with user permission, provide user names and passwords for AutoFill in Safari and other apps.
        case developerAuthenticationServicesAutofillCredentialProvider = "com.apple.developer.authentication-services.autofill-credential-provider"

        /// An entitlement that lets your app use Sign in with Apple.
        case developerApplesignin = "com.apple.developer.applesignin"

        // MARK: - Topic: App Clips

        /// A list of parent application identifiers for an app clip with exactly one entry.
        case developerParentApplicationIdentifiers = "com.apple.developer.parent-application-identifiers"

        /// A list of App Clip identifiers for an app with exactly one entry.
        case developerAssociatedAppclipAppIdentifiers = "com.apple.developer.associated-appclip-app-identifiers"

        /// A Boolean value that indicates whether a bundle represents an app clip.
        case developerOnDemandInstallCapable = "com.apple.developer.on-demand-install-capable"

        // MARK: - Topic: CarPlay & There is no description of these keys.

        case developerCarplayAudio = "com.apple.developer.carplay-audio"
        case developerCarplayCharging = "com.apple.developer.carplay-charging"
        case developerCarplayCommunication = "com.apple.developer.carplay-communication"
        case developerCarplayMaps = "com.apple.developer.carplay-maps"
        case developerCarplayParking = "com.apple.developer.carplay-parking"
        case developerCarplayQuickOrdering = "com.apple.developer.carplay-quick-ordering"
        case developerCarplayMessaging = "com.apple.developer.carplay-messaging"
        case developerCarplayContent = "com.apple.developer.playable-content"

        // MARK: - Topic: Contacts

        /// A Boolean value that indicates whether the app may access the notes stored in contacts.
        case developerContactsNotes = "com.apple.developer.contacts.notes"

        // MARK: - Topic: Core Location

        /// Enables a location sharing app, with a user’s authorization, to query a user’s location in response to a location push from Apple Push Notification service (APNs).
        case developerLocationPush = "com.apple.developer.location.push"

        // MARK: - Topic: Education

        /// The ClassKit development or production environment for an education app that works with the Schoolwork app.
        case developerClasskitEnvironment = "com.apple.developer.ClassKit-environment"

        /// A Boolean value that indicates whether an app may create an assessment session.
        case developerAutomaticAssessmentConfiguration = "com.apple.developer.automatic-assessment-configuration"

        // MARK: - Topic: Exposure Notification

        /// A Boolean value that indicates whether the app may use exposure notification.
        case developerExposureNotification = "com.apple.developer.exposure-notification"

        // MARK: - Family Controls

        /// A Boolean value that indicates whether the app can request or revoke authorization to provide parental controls.
        case developerFamilyControls = "com.apple.developer.family-controls"

        // MARK: - File Provider

        /// A Boolean value that indicates whether you can place domains in testing mode.
        case developerFileproviderTestingMode = "com.apple.developer.fileprovider.testing-mode"

        // MARK: - Group Activities

        /// A Boolean value that indicates whether the app may implement shared group experiences.
        case developerGroupSession = "com.apple.developer.group-session"

        // MARK: - Topic: Games

        /// A Boolean value that indicates whether users of the app may see and compare achievements on a leaderboard, invite friends, and start multiplayer games.
        case developerGameCenter = "com.apple.developer.game-center"

        // MARK: - Topic: Health

        /// A Boolean value that indicates whether the app may request user authorization to access health and activity data that appears in the Health app.
        case developerHealthkit = "com.apple.developer.healthkit"

        /// Health data types that require additional permission.
        case developerHealthkitAccess = "com.apple.developer.healthkit.access"

        /// A Boolean value that indicates whether observer queries receive updates while running in the background.
        case developerHealthkitBackgroundDelivery = "com.apple.developer.healthkit.background-delivery"

        /// A Boolean value that determines whether your app can recalibrate the prediction algorithm used to calculate supported sample types.
        case developerHealthkitRecalibrateEstimates = "com.apple.developer.healthkit.recalibrate-estimates"

        // MARK: - Topic: Home Automation

        /// A Boolean value that indicates whether users of the app may manage HomeKit-compatible accessories.
        case developerHomekit = "com.apple.developer.homekit"

        case developerMatterAllowSetupPayload = "com.apple.developer.matter.allow-setup-payload"

        // MARK: - Topic: Hypervisor

        /// A Boolean value that indicates whether the app creates and manages virtual machines.
        case securityHypervisor = "com.apple.security.hypervisor"

        /// A boolean that indicates whether the app creates and manages virtual machines.
        case vmHypervisor = "com.apple.vm.hypervisor"

        /// A boolean that indicates whether the app captures USB devices and uses them in the guest operating system.
        case vmDeviceAccess = "com.apple.vm.device-access"

        /// A boolean that indicates whether the app manages virtual network interfaces without escalating privileges to the root user.
        case vmNetworking = "com.apple.vm.networking"

        /// A Boolean that indicates whether the app can use the Virtualization framework.
        case securityVirtualization = "com.apple.security.virtualization"

        // MARK: - Topic: iCloud

        /// The container identifiers for the iCloud development environment.
        case developerIcloudContainerDevelopmentContainerIdentifiers = "com.apple.developer.icloud-container-development-container-identifiers"

        /// The development or production environment to use for the iCloud containers.
        case developerIcloudContainerEnvironment = "com.apple.developer.icloud-container-environment"

        /// The container identifiers for the iCloud production environment.
        case developerIcloudContainerIdentifiers = "com.apple.developer.icloud-container-identifiers"

        /// The iCloud services used by the app.
        case developerIcloudServices = "com.apple.developer.icloud-services"

        /// The container identifier to use for iCloud key-value storage.
        case developerUbiquityKvstoreIdentifier = "com.apple.developer.ubiquity-kvstore-identifier"

        // MARK: - Topic: Media

        /// An entitlement for an app extension that adds a specific third-party media receiver to a system device-picker UI.
        case developerMediaDeviceDiscoveryExtension = "com.apple.developer.media-device-discovery-extension"

        /// A Boolean value that indicates whether the app may continue using the camera while running alongside another foreground app.
        case developerAvfoundationMultitaskingCameraAccess = "com.apple.developer.avfoundation.multitasking-camera-access"

        // MARK: - Topic: Memory

        /// A Boolean value that indicates whether the app may continue using the camera while running alongside another foreground app.
        case developerKernelIncreasedMemoryLimit = "com.apple.developer.kernel.increased-memory-limit"

        /// A Boolean value that indicates whether the app may access an extended address space.
        case comAppleDeveloperKernelExtendedVirtualAddressing = "com.apple.developer.kernel.extended-virtual-addressing"

        // MARK: - Topic: Networking

        /// The APIs an app can use to customize networking features.
        case developerNetworkingNetworkextension = "com.apple.developer.networking.networkextension"

        /// The API an app can use to create and control a custom system VPN configuration.
        case developerNetworkingVpnApi = "com.apple.developer.networking.vpn.api"

        /// The associated domains for specific services, such as shared web credentials and universal links.
        case developerAssociatedDomains = "com.apple.developer.associated-domains"

        /// A Boolean value that indicates whether an app can send or receive IP multicast traffic.
        case developerNetworkingMulticast = "com.apple.developer.networking.multicast"

        case developerAssociatedDomainsApplinksReadWrite = "com.apple.developer.associated-domains.applinks.read-write"

        /// The entitlement developers need to use the ThreadNetwork API.
        case developerNetworkingManageThreadNetworkCredentials = "com.apple.developer.networking.manage-thread-network-credentials"

        // MARK: - Topic: Push Notifications

        /// The environment for push notifications.
        case apsEnvironment = "aps-environment"

        /// The environment for push notifications in macOS apps.
        case developerApsEnvironment = "com.apple.developer.aps-environment"

        /// Enable receiving notifications without displaying the notification to the user.
        case developerUsernotificationsFiltering = "com.apple.developer.usernotifications.filtering"

        // MARK: - Topic: Privact

        /// The entitlement for accessing the user-assigned device name instead of a generic device name.
        case developerDeviceInformationUserAssignedDeviceName = "com.apple.developer.device-information.user-assigned-device-name"

        // MARK: - Topic: Push to tale

        case developerPushToTalk = "com.apple.developer.push-to-talk"

        // MARK: - Topic: Security -> App Sandbox -> Essentials

        /// A Boolean value that indicates whether the app may use access control technology to contain damage to the system and user data if an app is compromised.
        case securityAppSandbox = "com.apple.security.app-sandbox"

        // MARK: - Topic: Security -> App Sandbox -> Network

        /// A Boolean value indicating whether your app may listen for incoming network connections.
        case securityNetworkServer = "com.apple.security.network.server"

        /// A Boolean value indicating whether your app may open outgoing network connections.
        case securityNetworkClient = "com.apple.security.network.client"

        // MARK: - Topic: Security -> App Sandbox -> Hardware

        /// A Boolean value that indicates whether the app may capture movies and still images using the built-in camera.
        case securityDeviceCamera = "com.apple.security.device.camera"

        /// A Boolean value that indicates whether the app may use the microphone.
        case securityDeviceMicrophone = "com.apple.security.device.microphone"

        /// A Boolean value indicating whether your app may interact with USB devices.
        case securityDeviceUsb = "com.apple.security.device.usb"

        /// A Boolean value indicating whether your app may print a document.
        case securityPrint = "com.apple.security.print"

        /// A Boolean value indicating whether your app may interact with Bluetooth devices.
        case securityDeviceBluetooth = "com.apple.security.device.bluetooth"

        // MARK: - Topic: Security -> App Sandbox -> App Data

        /// A Boolean value that indicates whether the app may have read-write access to contacts in the user's address book.
        case securityPersonalInformationAddressbook = "com.apple.security.personal-information.addressbook"

        /// A Boolean value that indicates whether the app may access location information from Location Services.
        case securityPersonalInformationLocation = "com.apple.security.personal-information.location"

        /// A Boolean value that indicates whether the app may have read-write access to the user's calendar.
        case securityPersonalInformationCalendars = "com.apple.security.personal-information.calendars"

        // MARK: - Topic: Security -> App Sandbox -> File Access

        /// A Boolean value that indicates whether the app may have read-write access to files the user has selected using an Open or Save dialog.
        case securityFilesUserSelectedReadWrite = "com.apple.security.files.user-selected.read-write"

        /// A Boolean value that indicates whether the app may have read-only access to files the user has selected using an Open or Save dialog.
        case securityFilesDownloadsReadOnly = "com.apple.security.files.downloads.read-only"

        /// A Boolean value that indicates whether the app may have read-write access to the Downloads folder.
        case securityFilesDownloadsReadWrite = "com.apple.security.files.downloads.read-write"

        /// A Boolean value that indicates whether the app may have read-only access to the Pictures folder.
        case securityAssetsPicturesReadOnly = "com.apple.security.assets.pictures.read-only"

        /// A Boolean value that indicates whether the app may have read-write access to the Pictures folder.
        case securityAssetsPicturesReadWrite = "com.apple.security.assets.pictures.read-write"

        /// A Boolean value that indicates whether the app may have read-only access to the Music folder.
        case securityAssetsMusicReadOnly = "com.apple.security.assets.music.read-only"

        /// A Boolean value that indicates whether the app may have read-write access to the Music folder.
        case securityAssetsMusicReadWrite = "com.apple.security.assets.music.read-write"

        /// A Boolean value that indicates whether the app may have read-only access to the Movies folder.
        case securityAssetsMoviesReadOnly = "com.apple.security.assets.movies.read-only"

        /// A Boolean value that indicates whether the app may have read-write access to the Movies folder.
        case securityAssetsMoviesReadWrite = "com.apple.security.assets.movies.read-write"

        /// A Boolean value that indicates whether the app may have access to all files.
        case securityFilesAll = "com.apple.security.files.all"

        // MARK: - Topic: Security -> Hardened Runtime -> Runtime Exceptions

        /// A Boolean value that indicates whether the app may create writable and executable memory using the MAP_JIT flag.
        case securityCsAllowJit = "com.apple.security.cs.allow-jit"

        /// A Boolean value that indicates whether the app may create writable and executable memory without the restrictions imposed by using the MAP_JIT flag.
        case securityCsAllowUnsignedExecutableMemory = "com.apple.security.cs.allow-unsigned-executable-memory"

        /// A Boolean value that indicates whether the app may be affected by dynamic linker environment variables, which you can use to inject code into your app’s process.
        case securityCsAllowDyldEnvironmentVariables = "com.apple.security.cs.allow-dyld-environment-variables"

        /// A Boolean value that indicates whether the app may load arbitrary plug-ins or frameworks, without requiring code signing.
        case securityCsDisableLibraryValidation = "com.apple.security.cs.disable-library-validation"

        /// A Boolean value that indicates whether to disable all code signing protections while launching an app, and during its execution.
        case securityCsDisableExecutablePageProtection = "com.apple.security.cs.disable-executable-page-protection"

        /// A Boolean value that indicates whether the app is a debugger and may attach to other processes or get task ports.
        case securityCsDebugger = "com.apple.security.cs.debugger"

        // MARK: - Topic: Security -> Hardened Runtime -> Resource Access

        /// A Boolean value that indicates whether the app may record audio using the built-in microphone and access audio input using Core Audio.
        case securityDeviceAudioInput = "com.apple.security.device.audio-input"

        /*
         The following cases are defined in other sections.

         /// A Boolean value that indicates whether the app may capture movies and still images using the built-in camera.
         case securityDeviceCamera = "com.apple.security.device.camera"

         /// A Boolean value that indicates whether the app may access location information from Location Services.
         case securityPersonalInformationLocation = "com.apple.security.personal-information.location"

         /// A Boolean value that indicates whether the app may have read-write access to contacts in the user's address book.
         case securityPersonalInformationAddressbook = "com.apple.security.personal-information.addressbook"

         /// A Boolean value that indicates whether the app may have read-write access to the user's calendar.
         case securityPersonalInformationCalendars = "com.apple.security.personal-information.calendars"
         */

        /// A Boolean value that indicates whether the app has read-write access to the user's Photos library.
        case securityPersonalInformationPhotosLibrary = "com.apple.security.personal-information.photos-library"

        /// A Boolean value that indicates whether the app may prompt the user for permission to send Apple events to other apps.
        case securityAutomationAppleEvents = "com.apple.security.automation.apple-events"

        // MARK: - Topic: Security

        /// A list of identifiers specifying the groups your app belongs to.
        case securityApplicationGroups = "com.apple.security.application-groups"

        /// The identifiers for the keychain groups that the app may share items with.
        case keychainAccessGroups = "keychain-access-groups"

        /// The level of data protection that encrypts sensitive user data when accessed on some devices.
        case developerDefaultDataProtection = "com.apple.developer.default-data-protection"

        /// The level of data protection that encrypts sensitive user data when accessed on some devices.
        case developerDevicecheckAppattestEnvironment = "com.apple.developer.devicecheck.appattest-environment"

        /// A Boolean that indicates whether your app has access to smart card slots and smart cards.
        case securitySmartcard = "com.apple.security.smartcard"

        // MARK: - Topic: Sensors

        /// The necessary entitlement to access sensor data that’s required by your app’s preapproved research study.
        case developerSensorkitReaderAllow = "com.apple.developer.sensorkit.reader.allow"

        // MARK: - Topic: Siri

        /// A Boolean value that indicates whether the app handles Siri requests.
        case developerSiri = "com.apple.developer.siri"

        // MARK: - StoreKit

        /// A Boolean value that indicates whether your app can link to an external website for account creation or management.
        case comAppleDeveloperStorekitExternalLinkAccount = "com.apple.developer.storekit.external-link.account"

        /// A Boolean value that indicates whether your app can offer external purchases.
        case comAppleDeveloperStorekitExternalPurchase = "com.apple.developer.storekit.external-purchase"

        /// A Boolean value that indicates whether your app can include a link that directs users to a website to make an external purchase.
        case comAppleDeveloperStorekitExternalPurchaseLink = "com.apple.developer.storekit.external-purchase-link"

        // MARK: - Topic: System -> System Extensions -> Essentials

        /// A Boolean value that indicates whether your app has permission to activate or deactivate system extensions.
        case developerSystemExtensionInstall = "com.apple.developer.system-extension.install"

        /// A Boolean value that indicates whether other development teams may distribute a system extension you create.
        case developerSystemExtensionRedistributable = "com.apple.developer.system-extension.redistributable"

        // MARK: - Topic: System -> System Extensions -> Endpoint Security

        /// The entitlement required to monitor system events for potentially malicious activity.
        case developerEndpointSecurityClient = "com.apple.developer.endpoint-security.client"

        // MARK: - Topic: System -> DriverKit Device Drivers -> DriverKit Device Drivers

        /// A Boolean value that indicates whether your extension has permission to run as a user-space driver.
        case developerDriverkit = "com.apple.developer.driverkit"

        /// A Boolean value that indicates whether to match the driver against block storage devices that use custom drivers.
        case developerDriverkitFamilyBlockStorageDevice = "com.apple.developer.driverkit.family.block-storage-device"

        /// A Boolean value indicating whether to match the driver against devices that communicate using networking protocols.
        case developerDriverkitFamilyNetworking = "com.apple.developer.driverkit.family.networking"

        /// A Boolean value that indicates whether to match the driver against devices with SCSI controllers.
        case developerDriverkitFamilyScsicontroller = "com.apple.developer.driverkit.family.scsicontroller"

        /// A Boolean value that indicates whether to match the driver against devices with serial communication interfaces.
        case developerDriverkitFamilySerial = "com.apple.developer.driverkit.family.serial"

        /// An array of PCI device descriptors that your custom driver supports.
        case developerDriverkitTransportPci = "com.apple.developer.driverkit.transport.pci"

        /// An array of dictionaries that identify the USB devices the driver supports.
        case developerDriverkitTransportUsb = "com.apple.developer.driverkit.transport.usb"

        // MARK: - Topic: System -> DriverKit Device Drivers -> DriverKit Device Drivers -> User client entitlements

        /// An array of strings that represent driver extensions which may communicate with other DriverKit services.
        case developerDriverkitUserclientAccess = "com.apple.developer.driverkit.userclient-access"

        /// A Boolean value that determines whether a macOS driver accepts user client connections from any application.
        case developerDriverkitAllowAnyUserclientAccess = "com.apple.developer.driverkit.allow-any-userclient-access"

        /// A Boolean value that indicates whether an iPadOS app can communicate with drivers.
        case developerDriverkitCommunicatesWithDrivers = "com.apple.developer.driverkit.communicates-with-drivers"

        /// A Boolean value that indicates whether an iPadOS driver accepts calls from third-party user clients.
        case developerDriverkitAllowThirdPartyUserclients = "com.apple.developer.driverkit.allow-third-party-userclients"

        // MARK: - Topic:  System -> System Extensions -> Human Interface Device Drivers

        /// A Boolean value that indicates whether the driver provides a HID-related service to the system.
        case developerDriverkitFamilyHidDevice = "com.apple.developer.driverkit.family.hid.device"

        /// A Boolean value that indicates whether the driver provides a HID-related event service to the system.
        case developerDriverkitFamilyHidEventservice = "com.apple.developer.driverkit.family.hid.eventservice"

        /// A Boolean value that indicates whether the driver communicates with human interface devices.
        case developerDriverkitTransportHid = "com.apple.developer.driverkit.transport.hid"

        /// A Boolean value that indicates whether the driver creates a virtual HID device.
        case developerHidVirtualDevice = "com.apple.developer.hid.virtual.device"

        /// A Boolean that indicates whether the app can act as a user’s default mail client.
        case comAppleDeveloperMailClient = "com.apple.developer.mail-client"

        /// A Boolean that indicates whether the app can act as the user’s default web browser.
        case comAppleDeveloperWebBrowser = "com.apple.developer.web-browser"

        // MARK: - Topic: TV

        /// The entitlement for distinguishing between multiple user accounts on Apple TV.
        case developerUserManagement = "com.apple.developer.user-management"

        case developerVideoSubscriberSingleSignOn = "com.apple.developer.video-subscriber-single-sign-on"
        case smootSubscriptionservice = "com.apple.smoot.subscriptionservice"

        // MARK: - Topic: Wallet

        /// A list of identifiers that specify pass types that your app can access in Wallet.
        case developerPassTypeIdentifiers = "com.apple.developer.pass-type-identifiers"

        /// A list of merchant IDs your app uses for Apple Pay support.
        case developerInAppPayments = "com.apple.developer.in-app-payments"

        case developerInAppIdentityPresentment = "com.apple.developer.in-app-identity-presentment"

        case developerInAppIdentityPresentmentMerchantIdentifiers = "com.apple.developer.in-app-identity-presentment.merchant-identifiers"

        // WeatherKit
        /// A Boolean value that indicates whether the app may use WeatherKit.
        case developerWeatherkit = "com.apple.developer.weatherkit"

        // MARK: - Topic: Wireless Interfaces

        /// A Boolean value indicating whether your app can access information about the connected Wi-Fi network.
        case developerNetworkingWifiInfo = "com.apple.developer.networking.wifi-info"

        /// A Boolean value indicating whether your app may configure MFi Wi-Fi accessories.
        case externalAccessoryWirelessConfiguration = "com.apple.external-accessory.wireless-configuration"

        /// A Boolean value indicating whether your app may use Multipath protocols to seamlessly transition between Wi-Fi and cellular networks.
        case developerNetworkingMultipath = "com.apple.developer.networking.multipath"

        /// A Boolean value indicating whether your app can use the hotspot manager to configure Wi-Fi networks.
        case developerNetworkingHotspotconfiguration = "com.apple.developer.networking.HotspotConfiguration"

        /// The Near Field Communication data formats an app can read.
        case developerNfcReadersessionFormats = "com.apple.developer.nfc.readersession.formats"

        // MARK: - Topic: Deprecated Entitlements

        /// A Boolean value that indicates whether the app may provide directions beyond what Maps supports, such as subway routes, hiking trails, and bike paths.
        case developerMaps = "com.apple.developer.maps"

        /// A Boolean value that indicates whether the app may exchange audio with other Inter-App Audio-enabled apps.
        case interAppAudio = "inter-app-audio"

        // MARK: - Topic: DriverKit Device Drivers
        case developerDriverkitFamilyAudio = "com.apple.developer.driverkit.family.audio"
    }
}
