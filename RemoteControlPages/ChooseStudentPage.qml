import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0

import com.fulaan.helper 1.0

Item {
    id:root
    property alias coverOpacity: coverRect.opacity
    property string groupName

    signal addItem(var itemName)

    function parseData(resultModel){
        var data=JSON.parse(resultModel)
        for(var i=0;i<data.students.length;i++){
            //console.log("name "+data.students[i].name+"avt "+data.students[i].avt)
            studentModel.append({"name":data.students[i].name,"avt":data.students[i].avt,"checked":false})
        }
    }

    function addCheckedItem(){
        var itemNum = studentModel.count
        for(var i=0;i<itemNum;i++)
        {
            var data = studentModel.get(i)
            if(data.checked===true){
                console.log(data.name)

            }
        }
    }

    Component.onCompleted: {
        var param = {classId: g_data.classId};
        network.jsGet(Fulaan.E_GetClassMembers, param, function (res){
            if (res.resultType === Fulaan.E_NetOK) {
                parseData(res.resultContent)
            } else {
                toast.show(res.resultContent)
            }
        })
    }

    Rectangle {
        id: coverRect
        anchors.fill: parent
        color: "#cc000000"
        opacity: 0.0
        z: 1

        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }
    }

    ColumnLayout{
        anchors.fill: parent
        spacing: 0
        Rectangle{
            id:title
            height: 50
            Layout.fillWidth: true
            //        Image {
            //            id: arrowImage
            //            source:""
            //        }

            Button{
                anchors.left: parent.left
                text:"课堂管理"
            }

            Text {
                anchors.centerIn: parent
                text: qsTr("添加组员")
            }

            Button{
                anchors.right: parent.right
                text:"完成"

                onClicked: {
                    console.log("GGGGGGGGGGG")
                    var itemNum = studentModel.count
                    for(var i=0;i<itemNum;i++)
                    {
                        var data = studentModel.get(i)
                        if(data.checked===true){
                            console.log(data.name)
                            addItem(data.name)
                        }
                    }
                    stackView.pop()
                }
            }
        }

        Rectangle{
            height: 47
            Layout.fillWidth: true
            color:"#EFEFF4"
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("学生列表")
            }
        }

        ListView{
            id:stuView
            clip:true
            Layout.fillHeight: true
            Layout.fillWidth: true

            model: studentModel
            delegate: stuCheckDelegateCom
        }

        AllStudentModel{
            id:studentModel
        }
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
                model.checked = !model.checked
            }

            contentItem: Rectangle{
                Rectangle{
                    id:stuIcon
                    width:35;height: 35
                    radius:17.5
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
