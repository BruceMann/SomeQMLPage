import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4


Item {
    id:root

    ColumnLayout{
        spacing:10
        anchors.fill: parent
        Row{
            spacing: 0
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.preferredHeight:93

            Button{
                id:freeStudyBtn
                width: parent.width/2
                height: parent.height

                contentItem: Text {
                    id: freeStudyBtnText
                    text:"自由学习"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    bottomPadding: 13
                }

                background: Rectangle{
                    id:freeStudyBtnBg
                    anchors.fill: parent
                    color: "#FCB243"
                    radius:10
                }
            }

            Button{
                id:lockScreenBtn
                width: parent.width/2
                height: parent.height
                contentItem: Text {
                    id: lockScreenBtnText
                    text:"锁屏"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    bottomPadding: 13
                }

                background: Rectangle{
                    id:lockScreenBtnBg
                    anchors.fill: parent
                    color: "#7045E6"
                    radius:10
                }
            }
        }

        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#696969"
        }
    }
}

    //Item{
    //    id:root

    //    Component {
    //        id: sectionHeading

    //        Rectangle {
    //            width: root.width
    //            height: 50
    //            color: "lightsteelblue"
    //            Text {
    //                text: section
    //                font.bold: true
    //                font.pixelSize: 20
    //                anchors.centerIn: parent
    //                verticalAlignment: Text.AlignVCenter
    //                horizontalAlignment: Text.AlignHCenter
    //            }

    //            MouseArea{
    //                anchors.fill: parent
    //                onClicked: {
    //                    console.log(section)
    //                }
    //            }
    //        }
    //    }

    //    Component{
    //        id:itemDelegate
    //        Rectangle{
    //            id:itemBox
    //            width: root.width
    //            height:50
    //            RowLayout{
    //                spacing: 10
    //                Layout.alignment: Qt.AlignLeft
    //                Layout.fillWidth: true

    //                Rectangle{
    //                    width: 10
    //                    height: 10
    //                    color:"red"
    //                    Layout.leftMargin: 10
    //                }

    //                Text {
    //                    text: name
    //                    font.pixelSize: 18
    //                }
    //            }
    //        }
    //    }


    //    ListModel{
    //        id:animalsModel
    //        ListElement{
    //            name:"ggg"
    //            team:"Small"
    //        }
    //        ListElement{
    //            name:"Parrot"
    //            team:"Small"
    //        }
    //        ListElement{
    //            name:"Rabbit"
    //            team:"Small"
    //        }

    //        ListElement{
    //            name:"Dog"
    //            team:"Medium"
    //        }
    //        ListElement{
    //            name:"Cat"
    //            team:"Medium"
    //        }

    //        ListElement{
    //            name:"KKK"
    //            team:"Large"
    //        }
    //        ListElement{
    //            name:"Elephant"
    //            team:"Large"
    //        }
    //        ListElement{
    //            name:"Tiger"
    //            team:"Large"
    //        }

    //    }


    //    ListView {
    //        id: view
    //        anchors.top: parent.top
    //        anchors.bottom: parent.bottom
    //        width: parent.width
    //        model: animalsModel
    //        delegate: itemDelegate

    //        section.property: "team"
    //        section.criteria: ViewSection.FullString
    //        section.delegate: sectionHeading
    //    }
    //}

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
