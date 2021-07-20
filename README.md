# Internship Project 1

#### Stack: Flutter and Firebase
#### Implemented: 
- Authentication
- Localisation
- BLoC pattern
- Geolocation
- Google Maps
- Local storage

#### And here is how the app looks:
Part 1 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Part 2  
![gif1](./lib/gif_pt1.gif)&emsp;
![gif2](./lib/gif_pt2.gif)

### Notes for iOS build

After adding Firebase to the project it might not be able to build for iOS and throw multiple errors. Study each error thoroughly and try to fix it. Below you can find possible errors and how to handle them, but first:

**Always add a `Google.plist` file only with Xcode**. See here:

https://stackoverflow.com/questions/45317777/could-not-find-a-valid-googleservice-info-plist-in-your-project

So, errors:

1. This error might be misleading
   

   `objc[15046]: Class AMSupportURLConnectionDelegate is implemented in both ?? (0x1fbd54188) and ?? (0x117bac2b8). One of the two will be used. Which one is undefined.`
   
So run `flutter build ios --verbose`, read output carefully and fix displayed errors one by one.

2. If using Mac on M1 chip, updating Cocoapods should remove some issues. For that run these commands from your ios folder:

`sudo arch -x86_64 gem install ffi`

`arch -x86_64 pod install`

3. If you see 

``[!] Automatically assigning platform `iOS` with version `9.0` on target `Runner` because no platform was specified. Please specify a platform for this target in your Podfile.``

Go to your Podfile, uncomment `#platform :ios, ‘9.0'`  or just delete # in the beginning of the line.

4. If you encounted 

``Resolving dependencies of `Podfile`
CDN: trunk Relative path: CocoaPods-version.yml exists! Returning local because checking is only perfomed in repo update
[!] CocoaPods could not find compatible versions for pod "cloud_firestore":
In Podfile:
cloud_firestore (from `.symlinks/plugins/cloud_firestore/ios`)
    Specs satisfying the `cloud_firestore (from `.symlinks/plugins/cloud_firestore/ios`)` dependency were found, but they required a higher minimum deployment target.``

In iOS/Podfile change to `platform :ios, ’11.0’`.

5. In other cases sustain efforts and breathe. 
   
In these links you may also find a possible solution:

https://github.com/CocoaPods/CocoaPods/issues/10518

https://stackoverflow.com/questions/26287103/cocoapods-warning-cocoapods-did-not-set-the-base-configuration-of-your-project

https://stackoverflow.com/questions/54704207/the-ios-simulator-deployment-targets-is-set-to-7-0-but-the-range-of-supported-d

https://stackoverflow.com/questions/65089767/class-amsupporturlconnectiondelegate-is-implemented-in-both

https://github.com/flutter/flutter/issues/70895#issuecomment-744734693

https://github.com/flutter/flutter/issues/66222

https://stackoverflow.com/questions/43111501/the-bundles-info-plist-does-not-contain-a-cfbundleversion-key-or-its-value-is-n

https://stackoverflow.com/questions/64973346/error-flutter-flutter-h-file-not-found-when-flutter-run-on-ios

https://stackoverflow.com/questions/64153084/tl-xcodeproj-the-linked-framework-pods-tl-framework-is-missing-one-or-more-arc

https://dev.to/idawnwon/error-running-pod-install-after-add-cloudfirestore-to-flutter-5lj

