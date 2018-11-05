import QtQuick 2.7
import QtQuick.Controls 2.1

Dialog {
    id:dialog

    signal addgroup(string groupName)

    x:parent.width/2-width/2
    y:parent.height/2-height/2

    focus:true
    modal:true
    title:qsTr("添加小组")
    standardButtons:Dialog.Cancel|Dialog.Ok

    contentItem: TextField{
        id:inputText
        text: ""
    }

    onAccepted: {
        stackView.push(chooseStudentPage)
        addgroup(inputText.text)
        inputText.text = ""
    }

}
