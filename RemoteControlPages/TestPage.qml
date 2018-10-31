import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4

Item{
    id:container

    Component {
        id: sectionHeading
        Rectangle {
            width: container.width
            height: childrenRect.height
            color: "lightsteelblue"

            Text {
                text: section
                font.bold: true
                font.pixelSize: 20
            }
        }
    }

    ListModel{
        id:animalsModel
        ListElement{
            name:"ggg"
            size:"Small"
        }
        ListElement{
            name:"Parrot"
            size:"Small"
        }
        ListElement{
            name:"Rabbit"
            size:"Small"
        }

        ListElement{
            name:"Dog"
            size:"Medium"
        }
        ListElement{
            name:"Cat"
            size:"Medium"
        }

        ListElement{
            name:"KKK"
            size:"Large"
        }
        ListElement{
            name:"Elephant"
            size:"Large"
        }
        ListElement{
            name:"Tiger"
            size:"Large"
        }

    }

    ListView {
        id: view
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width
        model: animalsModel
        delegate: Text { text: name; font.pixelSize: 18 }

        section.property: "size"
        section.criteria: ViewSection.FullString
        section.delegate: sectionHeading
    }
}

/*
Rectangle{
    id:root
    anchors.fill:parent
    border.color:"green"

    Column{
        spacing: 40
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 49

        Rectangle {
            //                Layout.alignment: Qt.AlignCenter
            color: "red"
            width: 40;height: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            //                Layout.alignment: Qt.AlignCenter
            color: "red"
            width: 40;height: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            //                Layout.alignment: Qt.AlignCenter
            color: "red"
            width: 40;height: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ComboBox {
            id:control
            model:["初三（1）班","初三（2）班","初三（3）班","初三（4）班"]
            width: 240
            anchors.horizontalCenter: parent.horizontalCenter

            indicator: Canvas {
                id: canvas
                x: control.width - width - control.rightPadding
                y: control.topPadding + (control.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                Connections {
                    target: control
                    onPressedChanged: canvas.requestPaint()
                }

                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle="#78849E";
                    context.fill();
                }
            }

            background: Rectangle{
                implicitWidth: 120
                implicitHeight: 40
                radius: 2
                color: "#FFFFFF"
                border.color: "#F0F0F0"
            }

            popup: Popup {
                y: control.height - 1
                width: control.width
                implicitHeight: contentItem.implicitHeight
                padding: 1

                contentItem: ListView {
                    clip: true
                    implicitHeight: contentHeight
                    model: control.popup.visible ? control.delegateModel : null
                    currentIndex: control.highlightedIndex

                    ScrollIndicator.vertical: ScrollIndicator { }
                }

                background: Rectangle {
                    border.color: "#F0F0F0"
                    radius: 2
                }
            }

        }
    }
}
*/
