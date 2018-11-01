import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0

Rectangle {
    id:chooseClassPage
    color:"#F8FCFF"

    signal backToLoginBtnClicked

    Column{
        width: parent.width
        //title
        Label{
            id:title
            anchors.top:parent.top
            anchors.topMargin: 94
            anchors.horizontalCenter: parent.horizontalCenter

            text:"请选择授课班级"
            color: "#665FAA"
            font.pixelSize:28
            font.family: "微软雅黑"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        //decorate
        Rectangle{
            id:decorateLine
            anchors.top:title.bottom
            anchors.topMargin: 4
            anchors.horizontalCenter: parent.horizontalCenter
            width: title.width
            height: 3.52
            Row{
                anchors.fill: parent
                Repeater{
                    model:["#FF7700","#F8C44F","#3497FD","#3ACCE1"]
                    Rectangle{
                        width:decorateLine.width/4
                        height: decorateLine.height
                        color:modelData
                    }
                }
            }
        }

        //ComboBox
        Rectangle{
            id:comboClassBox
            anchors.top:title.bottom
            anchors.topMargin: 48
            anchors.horizontalCenter: parent.horizontalCenter

            implicitWidth: 327
            implicitHeight: 52
            radius: 12

            Rectangle{
                id:chooseText
                height: 21
                width: 69
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
//                border.color: "red"

                Text{
                    anchors.fill: parent
                    text:"年/班级: "
                    font.family: "微软雅黑"
                    font.pixelSize: 15
                    verticalAlignment: Qt.AlignVCenter
                    color: "#78849E"
                }
            }
            ComboBox {
                id:control
                model:["初三（1）班","初三（2）班","初三（3）班","初三（4）班"]
                //width: 240
                anchors.left: chooseText.right
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter


                delegate: ItemDelegate {
                    width: control.width
                    contentItem: Text {
                        text: modelData
                        color: "#333333"
                        font.family: "微软雅黑"
                        verticalAlignment: Text.AlignVCenter
                    }
                    highlighted: control.highlightedIndex === index
                }

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
//                    border.color: "red"
                }

                contentItem: Text {
                    leftPadding: 12

                    text: control.displayText
                    font.family: "微软雅黑"
                    color: "#333333"
                    verticalAlignment: Text.AlignVCenter
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
        DropShadow {
            id:comboClassBoxShadow
            anchors.fill: comboClassBox
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 12
            color: "#CCCCCC"
            source: comboClassBox
        }

        //enterClassBtn
        Button{
            id:enterClassBtn
            Layout.alignment: Qt.AlignCenter
            anchors.top:comboClassBox.bottom
            anchors.topMargin: 44
            anchors.horizontalCenter: parent.horizontalCenter
            implicitWidth: 327
            implicitHeight:52

            contentItem: Text {
                text: "进入课堂"
                font.pixelSize: 15
                font.family: "微软雅黑"
                color:"#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle{
                radius: 55
                color: "#FF7141"
            }

            onClicked: {
                console.log("adcddac")
                chooseClassPage.backToLoginBtnClicked()
            }
        }
        DropShadow {
            id:enterClassBtnShadow
            anchors.fill: enterClassBtn
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#CCCCCC"
            source: enterClassBtn
        }



    }
}
