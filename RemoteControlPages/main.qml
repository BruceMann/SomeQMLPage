import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4

Window {
    id:window
    visible: true
    width: 375
    height: 665
    title: qsTr("HuDong Class")



//        Image{
//            id:pic1
//            x:0;y:0
//            width: 300
//            height: 300
//            source: "http://p85m0b652.bkt.clouddn.com/4%60V4JLGY$2$D4Z%29NE7O%7BY%603.png"
//        }


//        Image{
//            id:pic2
//            x:300;y:0
//            width: 300
//            height: 300
//            source: ""
//        }

//        Button{
//            x:0;y:400
//            onClicked: {
//                pic2.source="http://p85m0b652.bkt.clouddn.com/4%60V4JLGY$2$D4Z%29NE7O%7BY%603.png"
//            }
//        }





//ChooseStudentPage{
//    anchors.fill: parent
//}

    AddGroupDialog{
        id:addGroupDialog
        onAddgroup: {
            groupManage.nestedModel.append({"categoryName":groupName,"collapsed":true,"subItems":[]})
        }
    }

    Rectangle{
        id:topBox
        height: 64
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        border.color: "blue"
        border.width: 1
    }

    Rectangle{
        id:leftBox
        width: 90
        anchors.top:topBox.bottom
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        border.color: "pink"
        border.width: 1
    }

    Rectangle{
        anchors.top:topBox.bottom
        anchors.left: leftBox.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        border.color: "yellow"
        border.width: 1

        GroupManage{
            id:groupManage
            anchors.fill: parent
            anchors.leftMargin: 11
            anchors.rightMargin: 11
            anchors.topMargin: 21
            onAddGroup: {
                addGroupDialog.open()
            }
        }
    }

//    TestPage{
//        anchors.fill: parent
//    }

//    ChooseClassPage{
//        anchors.fill: parent
//    }

//    LoginPage{
//        anchors.fill: parent
//    }

//    Component{
//        id:loginPageCom
//        LoginPage{
//            onLoginBtnClicked:{
//                mainView.pop();
//                mainView.push(chooseClassPageCom)
//            }
//        }
//    }

//    Component{
//        id:chooseClassPageCom
//        ChooseClassPage{
//            onBackToLoginBtnClicked:{
//                mainView.pop();
//                mainView.push(loginPageCom)
//            }
//        }

//    }

//    StackView{
//        id:mainView
//        anchors.fill: parent
//        initialItem: loginPageCom
//    }
}

