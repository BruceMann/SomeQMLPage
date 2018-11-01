import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0

Item {

    ListModel{
        id:stuModel
        ListElement{name:"bruce"}
        ListElement{name:"bruce"}
        ListElement{name:"bruce"}
        ListElement{name:"bruce"}
        ListElement{name:"bruce"}
        ListElement{name:"bruce"}
        ListElement{name:"bruce"}
        ListElement{name:"bruce"}
        ListElement{name:"bruce"}
        ListElement{name:"bruce"}
        ListElement{name:"bruce"}
        ListElement{name:"bruce"}
    }

    ListView{
        id:stuView
        anchors.fill: parent
        model: stuModel
        delegate: stuCheckDelegateCom
        }




    Component{
        id:stuCheckDelegateCom
        CheckDelegate {
            id: control
            text:name
            height: 50
            width: parent.width
            checked: false

            contentItem: Rectangle{
                //TODO 更换为image
                Rectangle{
                    id:stuIcon
                    width:35;height: 35
                    radius:17.5
                    color:"pink"
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    anchors.left: stuIcon.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    rightPadding: control.indicator.width + control.spacing
                    text: control.text
                    font: control.font
                    color:"#333333"
                    verticalAlignment: Text.AlignVCenter
                }
            }

            indicator: Rectangle {
                implicitWidth: 22
                implicitHeight: 22
                x: control.width - width - control.rightPadding
                y: control.topPadding + control.availableHeight / 2 - height / 2
                radius: 11
                color: "transparent"
                border.color:"#007AFF"

                Rectangle {
                    width: 12
                    height: 12
                    x: 5
                    y: 5
                    radius: 6
                    color: "#007AFF"
                    visible: control.checked
                }
            }

            background: Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "#DCDCDC"
            }
        }
    }
}
