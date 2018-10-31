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


//    TestPage{
//        anchors.fill: parent
//    }

//    ChooseClassPage{
//        anchors.fill: parent
//    }

//    LoginPage{
//        anchors.fill: parent
//    }



        StackView{
            id:mainView
            anchors.fill: parent
            initialItem: LoginPage{
                id:loginPage
                onLoginBtnClicked:     {
                    console.log("AAAAAAAA")
                    mainView.pop()
                    mainView.push("qrc:/ChooseClassPage.qml")
                }
            }
        }
}

