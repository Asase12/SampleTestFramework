A Sample Test Framework to showcase simple UI Tests for a iOS SPM framework.

It has few key building blocks:
- Package manifest that defines the dependencies.
- `Page Object` - a layer that describes the UI elements of the view under test, so our tests stay expressive and don't repeat selectors everywhere.
- Base Test class - a shared foundation that handles App launch, teardown, and other setup logic. All UI test classes inherit from it.
- A concrete Test Case - an actual test that interacts with `SampleView` from the `SampleUIFramework`, using the `Page Object` pattern and the base class.
Inside `test_SampleView_screen`, I locate elements, interact and assert content.
