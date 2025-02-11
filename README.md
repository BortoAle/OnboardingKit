# OnboardingKit

Simplify your app's onboarding process with a collection of ready-to-use SwiftUI components. OnboardingKit offers a seamless way to introduce your users to your app.

## Installation

OnboardingKit is available as a Swift Package. You can easily add it to your project with Xcode:

1. **Open your project in Xcode**
2. **Select File > Swift Packages > Add Package Dependency...**
3. **Enter the package repository URL:** https://github.com/BortoAle/OnboardingKit
4. **Follow the prompts to choose the package options and add the package to your project.**

For more detailed instructions on using Swift Package Manager, refer to the [Swift Package Manager documentation](https://swift.org/package-manager/).

## Usage

### OnboardingRow

`OnboardingRow` allows you to create individual onboarding steps with an icon, title, and description. Each row represents a single step or concept in your onboarding flow.

```swift
OnboardingRow(image: Image(systemName: "star.fill"), title: "Feature Highlight", description: "Discover the amazing features of our app.")
```

## Welcome Sheet
Present a full onboarding experience as a welcome sheet from any view, using the `.welcomeSheet` modifier. This method allows for a seamless introduction to your app for first-time users.

```swift
@AppStorage("isOnboardingShown") var isOnboardingShown: Bool = false

let onboardingRows = [
    OnboardingRow(image: Image(systemName: "hand.wave.fill"), title: "Welcome", description: "Get a warm welcome to our app."),
    OnboardingRow(image: Image(systemName: "lightbulb.fill"), title: "Discover", description: "Learn about unique features."),
    OnboardingRow(image: Image(systemName: "paintbrush.fill"), title: "Customize", description: "Make the app yours with easy customization.")
]

var body: some View {
    YourMainView()
        .welcomeSheet(isPresented: $isOnboardingShown, onDismiss: {
            isOnboardingShown = false
        }, rows: onboardingRows, title: "Welcome to Our App", onConfirm: {
            isOnboardingShown = false
        })
}
```


## Demo
<img src="https://github.com/BortoAle/OnboardingKit/assets/64900362/dd47cbb6-0715-413c-84b0-679146cb6283" height="600">
<img src="https://github.com/BortoAle/OnboardingKit/assets/64900362/9029fc4d-bb1e-47d6-94da-e202efa50a36" height="600">

