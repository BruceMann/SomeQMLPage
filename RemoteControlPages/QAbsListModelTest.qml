import QtQuick 2.0

import Backend 1.0

ListView{
    id:listView

    delegate: Rectangle{
        width: listView.width
        height: 50
        Text {
            anchors.centerIn: parent
            text:name
        }
    }

    model:StudentModel{
        id:sModel
    }

    section.property: "gender"
    section.criteria: ViewSection.FullString
    section.delegate: Rectangle{
        width: listView.width
        height: 50
        color:"gray"
        Text{
            anchors.centerIn: parent
            text:section
        }
    }
}
