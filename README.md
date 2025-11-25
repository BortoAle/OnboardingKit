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
OnboardingRow(
    image: Image(systemName: "star.fill"),
    style: .yellow,
    title: "Feature Highlight",
    description: "Discover the amazing features of our app."
)
```

You can also mark a row as a Pro feature by setting `isProFeature: true`, which displays a badge next to the title.

### Welcome Sheet

Present a full onboarding experience as a welcome sheet from any view, using the `.welcomeSheet` modifier. This method allows for a seamless introduction to your app for first-time users.

```swift
@AppStorage("isOnboardingShown") var isOnboardingShown: Bool = true

let onboardingRows = [
    OnboardingRow(image: Image(systemName: "hand.wave.fill"), style: .orange, title: "Welcome", description: "Get a warm welcome to our app."),
    OnboardingRow(image: Image(systemName: "lightbulb.fill"), style: .yellow, title: "Discover", description: "Learn about unique features."),
    OnboardingRow(image: Image(systemName: "paintbrush.fill"), style: .pink, title: "Customize", description: "Make the app yours with easy customization.")
]

var body: some View {
    YourMainView()
        .welcomeSheet(
            isPresented: $isOnboardingShown,
            onDismiss: {
                isOnboardingShown = false
            },
            rows: onboardingRows,
            title: "Welcome to Our App",
            actionTitle: "Get Started",
            onConfirm: {
                isOnboardingShown = false
            }
        )
}
```

You can optionally add a secondary button by providing `secondaryActionTitle` and `onSecondaryConfirm` parameters.

### OnboardingView

If you need more control over presentation, you can use `OnboardingView` directly instead of the `.welcomeSheet` modifier:

```swift
OnboardingView(
    title: "Welcome to Our App",
    rows: onboardingRows,
    actionTitle: "Continue",
    action: {
        // Handle primary action
    },
    secondaryActionTitle: nil,
    secondaryAction: nil
)
```

## Demo

<img alt="Light mode" src="https://github.com/user-attachments/assets/54c72abc-9661-4849-8650-2e9392485f05" height="600"/>
<img alt="Dark mode" src="https://github.com/user-attachments/assets/cd313e4a-6209-4efb-944f-80a87f939652" height="600"/>
