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


    GroupManage{
        anchors.fill: parent
    }

//    Testpage2{
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

