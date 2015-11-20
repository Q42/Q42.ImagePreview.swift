# ImagePreview

This is the client library for rendering the image previews.

Look at [this blog post](http://q42.com/blog/post/133591843068/imagepreview-library) for more details.

You can find the [.NET server component on Github](https://github.com/Q42/Q42.ImagePreview.swift).

<!-- [![CI Status](http://img.shields.io/travis/Tim van Steenis/ImagePreview.svg?style=flat)](https://travis-ci.org/Tim van Steenis/ImagePreview)
[![Version](https://img.shields.io/cocoapods/v/ImagePreview.svg?style=flat)](http://cocoapods.org/pods/ImagePreview)
[![License](https://img.shields.io/cocoapods/l/ImagePreview.svg?style=flat)](http://cocoapods.org/pods/ImagePreview)
[![Platform](https://img.shields.io/cocoapods/p/ImagePreview.svg?style=flat)](http://cocoapods.org/pods/ImagePreview) -->

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

ImagePreview is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ImagePreview"
```

## Example

This library extends UIImage with 2 methods.

```swift
init?(body: NSData)

func blurredImageWithRadius(blurRadius: CGFloat, tintColor: UIColor?, saturationDeltaFactor: CGFloat, maskImage: UIImage? = nil) -> UIImage?
```

Take a look at the example project how this is being used.

You can override the headers if you write your own server implementation and the headers do not match.

```swift
// version - NSData
ImagePreviewSettings.sharedSettings.headers = [
  1 : NSData(base64EncodedString: "your base64 encoded header", options: [])!
]
```

## Author

Tim van Steenis, tims@q42.nl

## License

ImagePreview is available under the MIT license. See the LICENSE file for more info.
