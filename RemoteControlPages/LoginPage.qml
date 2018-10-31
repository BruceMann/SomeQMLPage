import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0


Rectangle {
    id:loginPage
    color:"#F8FCFF"
    signal loginBtnClicked

    Column{
        width: parent.width
        //title
        Label{
            id:title
            anchors.top:parent.top
            anchors.topMargin: 94
            anchors.horizontalCenter: parent.horizontalCenter

            text:"互动课堂遥控器"
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

        //userNam
        TextField{
            id:userName
            anchors.top:title.bottom
            anchors.topMargin: 48
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 15
            font.family: "微软雅黑"
            placeholderText: "用户名"
            verticalAlignment: TextInput.AlignVCenter

            background: Rectangle{
                implicitWidth: 327
                implicitHeight: 52
                radius: 12
                color:"#FFFFFF"
//                border.color:"blue"
//                border.width: 1
            }
        }
        DropShadow {
            id:userNameShadow
            anchors.fill: userName
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 12
            color: "#CCCCCC"
            source: userName
        }




        //passWord
        TextField{
            id:passWord
            anchors.top:userName.bottom
            anchors.topMargin: 24
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 15
            font.family: "微软雅黑"
            placeholderText: "密码"
            verticalAlignment: TextInput.AlignVCenter

            background: Rectangle{
                implicitWidth: 327
                implicitHeight: 52
                radius: 12
                color:"#FFFFFF"
//                border.color:"blue"
//                border.width: 1
            }
        }
        DropShadow {
            id:passWordShadow
            anchors.fill: passWord
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 12
            color: "#CCCCCC"
            source: passWord
        }


        //loginBtn
        Button{
            id:loginBtn
            Layout.alignment: Qt.AlignCenter
            anchors.top:passWord.bottom
            anchors.topMargin: 44
            anchors.horizontalCenter: parent.horizontalCenter
            implicitWidth: 327
            implicitHeight:52

            contentItem: Text {
                text: "登录"
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
                console.log("CDCDCD")
                 loginPage.loginBtnClicked()
            }
        }
        DropShadow {
            id:loginBtnShadow
            anchors.fill: loginBtn
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#999999"
            source: loginBtn
        }
    }
}
