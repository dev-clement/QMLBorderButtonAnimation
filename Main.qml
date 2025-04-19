import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import QtQuick.Controls.Material

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    color: "#202020"

    RectangularShadow {
        id: rectangularShadow
        visible: btn.hovered
        anchors.fill: btn
        offset {
            x: 0
            y: 0
        }
        blur: 16
        spread: 4
        color: Qt.darker(myButton.borderColor, 1.6)

        Behavior on visible {
            NumberAnimation {
                duration: 600
            }
        }
    }

    Button {
        id: btn
        anchors.centerIn: parent
        implicitHeight: 70
        implicitWidth: 200

        contentItem: Text {
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "#fafafa"
            font.pointSize: 12.5
            font.weight: Font.DemiBold
            Component.onCompleted: font.capitalization = Font.AllUppercase
            text: qsTr("Hover Me !")
        }

        background: Item {
            id: myButton
            anchors.fill: parent

            property real borderWidth: 0.15
            property real borderHeight: 0.15
            property int animDuration: 300
            property int defaultHeight: 1
            property int defaultWidth: 1
            property color borderColor: Qt.color("#ff006e")

            Rectangle {
                anchors.fill: parent
                color: root.color
            }

            Rectangle {
                id: topBorder
                anchors {
                    left: parent.left
                    top: parent.top
                }
                width: myButton.borderWidth * parent.width
                height: myButton.defaultHeight
                color: myButton.borderColor

                Behavior on width {
                    NumberAnimation {
                        duration: myButton.animDuration
                    }
                }
            }

            Rectangle {
                id: leftBorder
                anchors {
                    left: parent.left
                    top: parent.top
                }
                width: myButton.defaultWidth
                height: myButton.borderHeight * parent.height
                color: myButton.borderColor

                Behavior on height {
                    NumberAnimation {
                        duration: myButton.animDuration
                    }
                }
            }

            Rectangle {
                id: bottomBorder
                anchors {
                    right: parent.right
                    bottom: parent.bottom
                }
                width: myButton.borderWidth * parent.width
                height: myButton.defaultHeight
                color: myButton.borderColor

                Behavior on width {
                    NumberAnimation {
                        duration: myButton.animDuration
                    }
                }
            }

            Rectangle {
                id: bottomTopBorder
                anchors {
                    right: parent.right
                    bottom: parent.bottom
                }
                width: myButton.defaultWidth
                height: myButton.borderHeight * parent.height
                color: myButton.borderColor

                Behavior on height {
                    NumberAnimation {
                        duration: myButton.animDuration
                    }
                }
            }

            MouseArea {
                id: mouseArea

                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    if (myButton.borderWidth != myButton.defaultWidth && myButton.borderHeight != myButton.defaultHeight) {
                        myButton.borderWidth = myButton.defaultWidth
                        myButton.borderHeight = myButton.defaultHeight
                    } else {
                        myButton.borderWidth = 0.15
                        myButton.borderHeight = 0.15
                    }
                }
            }
        }
    }
}
