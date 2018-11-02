import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0

Item {

    ListView{
        id:stuView
        anchors.fill: parent

        JSONListModel{
            id:jsonModel
            source:"data.txt"
            query: "$.students[*]"
        }

        model: jsonModel.model
        delegate: stuCheckDelegateCom
    }

    Component{
        id:stuCheckDelegateCom
        CheckDelegate {
            id: control
            text:model.name
            height: 50
            width: parent.width
            checked: false

            onCheckedChanged: {
                pop.open()
            }

            contentItem: Rectangle{
                //TODO 更换为image
                Rectangle{
                    id:stuIcon
                    width:35;height: 35
                    radius:17.5
                    //                    color:"pink"
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter

                    Image {
                        id: img
                        anchors.fill: stuIcon
                        source: model.avt
                        property bool rounded: true
                        property bool adapt: true

                        layer.enabled: rounded
                        layer.effect: OpacityMask {
                            maskSource: Item {
                                width: img.width
                                height: img.height
                                Rectangle {
                                    anchors.centerIn: parent
                                    width: img.adapt ? img.width : Math.min(img.width, img.height)
                                    height: img.adapt ? img.height : width
                                    radius: Math.min(width, height)
                                }
                            }
                        }
                    }
                }

                Text {
                    anchors.left: stuIcon.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    rightPadding: control.indicator.width + control.spacing
                    text: control.text
                    font.family: "微软雅黑"
                    font.pixelSize: 14
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
