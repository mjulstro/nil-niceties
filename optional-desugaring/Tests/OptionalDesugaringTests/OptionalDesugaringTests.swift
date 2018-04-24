import XCTest
@testable import OptionalDesugaring

class OptionalDesugaringTests: XCTestCase {
    let theme0 = Style(
        backgroundColor: nil,
        foregroundColor: .fulvous)

    let theme1 = Style(
        backgroundColor: .fuchsia,
        foregroundColor: .smaragdine)

    let theme2 = Style(
        backgroundColor: .mauve,
        foregroundColor: .wenge)

    func profileScreen(avatarStyle: Style?, appTheme: Style) -> ProfileScreen {
        let avatar: StyledImage?
        if let avatarStyle = avatarStyle {
            avatar = StyledImage(image: Image(), style: avatarStyle)
        } else {
            avatar = nil
        }
        return ProfileScreen(
            user: User(name: "Sally Jones", avatar: avatar),
            appTheme: appTheme)
    }


    func testAvatarHasBackgroundColor() {
        assertBackgroundColorDesugarings(
            on: profileScreen(avatarStyle: theme2, appTheme: theme1),
            allEqual: Color.mauve)
    }

    func testAvatarHasNoBackgroundColor() {
        assertBackgroundColorDesugarings(
            on: profileScreen(avatarStyle: theme0, appTheme: theme1),
            allEqual: Color.fuchsia)
    }

    func testAvatarAndAppThemeBothHaveNoBackgroundColor() {
        assertBackgroundColorDesugarings(
            on: profileScreen(avatarStyle: theme0, appTheme: theme0),
            allEqual: nil)
    }

    func testNoAvatar() {
        assertBackgroundColorDesugarings(
            on: profileScreen(avatarStyle: nil, appTheme: theme2),
            allEqual: Color.mauve)
    }

    func testNoStylesAtAll() {
        assertBackgroundColorDesugarings(
            on: profileScreen(avatarStyle: nil, appTheme: theme0),
            allEqual: nil)
    }

    func testAllDesugaringsImplemented() {
        XCTAssertEqual(
            profileScreen(avatarStyle: nil, appTheme: theme2).headerBackgroundColorDesugarings.count,
            7,
            "Not all desugarings are implemented yet")
    }

    private func assertBackgroundColorDesugarings(
            on profileScreen: ProfileScreen,
            allEqual expectedValue: Color?)
        {
        for (index, value) in profileScreen.headerBackgroundColorDesugarings.enumerated() {
            XCTAssertEqual(expectedValue, value, "Value \(index) does not match")
        }
    }
}
