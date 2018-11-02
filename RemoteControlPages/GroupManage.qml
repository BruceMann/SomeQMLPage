import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0

Item {
    //    width: 200
    //    height: 300

    id:root
    ListView {
        anchors.fill: parent
        model: nestedModel
        delegate: categoryDelegate
    }

    ListModel {
        id: nestedModel
        ListElement {
            categoryName: "牛津剑桥毛毛雨"
            collapsed: true

            // A ListElement can't contain child elements, but it can contain
            // a list of elements. A list of ListElements can be used as a model
            // just like any other model type.
            subItems: [
                ListElement { itemName: "郭德纲" },
                ListElement { itemName: "于玉玉" },
                ListElement { itemName: "牛顿" }
                //                ListElement { itemName: "Brains" }
            ]
        }

        ListElement {
            categoryName: "考哈佛 so easy"
            collapsed: true
            subItems: [
                ListElement { itemName: "Orange" },
                ListElement { itemName: "Apple" },
                ListElement { itemName: "Pear" },
                ListElement { itemName: "Lemon" }
            ]
        }

        ListElement {
            categoryName: "目标北大小组"
            collapsed: true
            subItems: [
                ListElement { itemName: "Nissan" },
                ListElement { itemName: "Toyota" }
                //                ListElement { itemName: "Chevy" },
                //                ListElement { itemName: "Audi" }
            ]
        }
    }

    Component {
        id: categoryDelegate
        Column {
            width: root.width

            Rectangle {
                id: categoryItem
                color: "#FFFFFF"
                height: 55
                width: parent.width

                //icon  TODO: 更换成image
                Rectangle{
                    id:sectionIcon
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    width: 34.9;height: 34.9
                    radius:2
                    color:"blue"
                }

                Text {
                    anchors.left: sectionIcon.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 24
                    text: categoryName
                }

                // arrow  image
                Image{
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    source: collapsed?"qrc:/Images/areow1.png":"qrc:/Images/arrow2.png"
                }

                MouseArea {
                    anchors.fill: parent

                    // Toggle the 'collapsed' property
                    onClicked: nestedModel.setProperty(index, "collapsed", !collapsed)
                }
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

                // This is a workaround for a bug/feature in the Loader element. If sourceComponent is set to null
                // the Loader element retains the same height it had when sourceComponent was set. Setting visible
                // to false makes the parent Column treat it as if it's height was 0.

                //                visible: !collapsed
                opacity:collapsed? 0.0:1.0
                property variant subItemModel : subItems
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
            height: model.length*55
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
                    text: qsTr("Delete")
                    color: "white"
                    verticalAlignment: Label.AlignVCenter
                    padding: 12
                    height: parent.height
                    anchors.right: parent.right

                    SwipeDelegate.onClicked: subItemRepeater.model.remove(index)

                    background: Rectangle {
                        color: deleteLabel.SwipeDelegate.pressed ? Qt.darker("tomato", 1.1) : "tomato"
                    }
                }


            }

        }

    }
}

