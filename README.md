
# NCX
This is a little project done by me and Luca D'Angelo about asynchronous API request and an integration of a non-modal UIView with the help of UIViewRepresentable object.

The first step is to create a UIViewRepresentable object in the existing SwiftUI project.

makeUIView function will create our view (UIButton) in which we define our UI components and also it includes an action that is triggered when the button is tapped.

Then we created a new Storyboard file that includes a label and a dismiss button.

To manage the dismiss button we have to create a UIViewController and we have to assign it to our ViewController.

updateUIView function let us access in the UIViewController created in the Storyboard file and instantiate it with instantiateViewController. Then we need created a UISheetPresentationController to create a non-modal view with the help of sheet.detents.

In the end we switch from two rootViewController depending by isPresenting boolean variable.

Last step is to show SwiftUI view (in this case downloadingView) in our storyboard with the help of ContainerView object.

In our ContentView we show NonModalButtonView and the API request done in the previous Artifact project.

