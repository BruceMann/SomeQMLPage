import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0

import com.fulaan.helper 1.0

Item {
    id:root

    signal addGroup

    property string addGroupName


    AddGroupDialog{
        id:addGroupDialog
        parent: stackView
        onAddgroup: {
            nestedModel.addGroupName(groupName)
            addGroupName = groupName
        }
    }


    Component {
        id:chooseStudentPage
        ChooseStudentPage{
            onAddItem:{
                console.log(addGroupName+"      "+itemName)
                nestedModel.addGroupItem(addGroupName,itemName)
            }
        }
    }

    NestedModel{id:nestedModel}

    ColumnLayout{
        spacing:0
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
                    color:"white"
                    font.pixelSize:14
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
                    color:"white"
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
            height: 50

            Text {
                text: "小组"
                anchors.verticalCenter:parent.verticalCenter
                font.pixelSize: 16
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#333333"
            }
            Button{
                id:addGroupBtn
                anchors.right: parent.right
                anchors.verticalCenter:parent.verticalCenter
                width: 18;height: 18
                background: Rectangle{
                    anchors.fill: parent
                    color: "#daa520"
                }

                onClicked: {
                    addGroupDialog.open()
                }
            }
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: nestedModel.model
            delegate:categoryDelegate
        }
    }

    Component{
        id:categoryDelegate
        Column{
            spacing: 0
            width: parent.width

            SwipeDelegate{
                id:sDelegat
                width: parent.width
                height: 55

                ListView.onRemove:SequentialAnimation {
                    PropertyAction {
                        target: sDelegat
                        property: "ListView.delayRemove"
                        value: true
                    }
                    ParallelAnimation{
                        NumberAnimation {
                            target: sDelegat
                            property: "height"
                            to: 0
                            easing.type: Easing.Linear
                        }
                        NumberAnimation{
                            target: sDelegat
                            property: "opacity"
                            to:0.0
                            easing.type: Easing.Linear
                        }
                    }
                    PropertyAction {
                        target: sDelegat
                        property: "ListView.delayRemove"
                        value: false
                    }
                }

                contentItem:Rectangle {
                    id: categoryItem
                    color: "#FFFFFF"
                    height: parent.height
                    width: parent.width

                    //icon  TODO: 更换成image
                    Rectangle{
                        id:sectionIcon
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        width: 34.9;height: 34.9
                        radius:2
                        color:"#1e90ff"
                    }

                    Text {
                        anchors.left: sectionIcon.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 14
                        text: categoryName
                    }

                    // arrow  image
                    Image{
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        source: collapsed?"qrc:/images/areow1.png":"qrc:/images/arrow2.png"
                    }

                }

                Component {
                    id: component

                    Rectangle {
                        color: SwipeDelegate.pressed ? "#333" : "#444"
                        width:editbtn.width+addbtn.width+delbtn.width
                        height: parent.height
                        anchors.right: parent.right
                        clip: true

                        Button{
                            id:editbtn
                            height: parent.height
                            width: 60
                            anchors.right: addbtn.left
                            background: Rectangle{
                                color:"#C2C2C2"
                                anchors.fill: parent
                            }
                            contentItem: Text {
                                text: qsTr("编辑")
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                color:"#FFFFFF"
                            }
                        }
                        Button{
                            id:addbtn
                            height: parent.height
                            width: 72
                            anchors.right: delbtn.left

                            background: Rectangle{
                                color:"#FCB243"
                                anchors.fill: parent
                            }
                            contentItem: Text {
                                text: qsTr("添加组员")
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                color:"#FFFFFF"
                            }
                            onClicked: {
                                addGroupName=nestedModel.model.get(index).categoryName
                                nestedModel.addGroupName(addGroupName)
                                console.log(addGroupName)
                                stackView.push(chooseStudentPage)
                            }
                        }
                        Button{
                            id:delbtn
                            height: parent.height
                            width: 60
                            anchors.right: parent.right

                            background: Rectangle{
                                color:"#FF3B30"
                                anchors.fill: parent
                            }
                            contentItem: Text {
                                text: qsTr("删除")
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                color:"#FFFFFF"
                            }
                            onClicked: {
                                nestedModel.deleteGroup(index)
                            }
                        }
                    }
                }

                swipe.right:component

                onClicked: nestedModel.model.setProperty(index, "collapsed", !collapsed)

                clip: true
            }

            Loader {
                id: subItemLoader
                height:collapsed?0:subItemModel.count*55

                Behavior on height {
                    NumberAnimation{
                        duration: 300
                    }
                }

                Behavior on opacity {
                    NumberAnimation{
                        duration: 500
                    }
                }

                opacity:collapsed? 0.0:1.0
                property variant subItemModel :subItems
                sourceComponent: subItemColumnDelegate
                onStatusChanged: if (status == Loader.Ready) item.model = subItemModel
            }
        }
    }

    Component {
        id: subItemColumnDelegate

        ListView {
            clip:true
            property alias model : subItemRepeater.model
            width: root.width
            height: nestedModel.count*55
            id: subItemRepeater

            delegate: SwipeDelegate {
                id:swipeDelegate
                height: 55
                width: parent.width

                ListView.onRemove:SequentialAnimation {
                    PropertyAction {
                        target: swipeDelegate
                        property: "ListView.delayRemove"
                        value: true
                    }
                    ParallelAnimation{
                        NumberAnimation {
                            target: swipeDelegate
                            property: "height"
                            to: 0
                            easing.type: Easing.Linear
                        }
                        NumberAnimation{
                            target: swipeDelegate
                            property: "opacity"
                            to:0.0
                            easing.type: Easing.Linear
                        }
                    }
                    PropertyAction {
                        target: swipeDelegate
                        property: "ListView.delayRemove"
                        value: false
                    }
                }

                Rectangle{
                    id:itemIcon
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter:parent.verticalCenter
                    width: 35;height: 35
                    radius: 17.5
                    color: "green"
                }

                Text {
                    anchors.left: itemIcon.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter:parent.verticalCenter
                    font.pixelSize:14
                    text: itemName
                }

                swipe.right: Label {
                    id: deleteLabel
                    text: qsTr("删除")
                    color: "white"
                    verticalAlignment: Label.AlignVCenter
                    padding: 12
                    height: parent.height
                    anchors.right: parent.right

                    SwipeDelegate.onClicked: subItemRepeater.model.remove(index)

                    background: Rectangle {
                        color: deleteLabel.SwipeDelegate.pressed ? Qt.darker("#FF2300", 1.1) : "#FF2300"
                    }
                }


            }
        }
    }
}

