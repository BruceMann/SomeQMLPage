import QtQuick 2.0

Item{
        id: root
        width: 1406; height: 536

        ListModel {
            id: animalsModel
            ListElement { name: "Puss in Boots"; type: "Cats"; aVisible: false}
            ListElement { name: "Bengal"; type: "Cats"; aVisible: false }
            ListElement { name: "Pug"; type: "Dogs"; aVisible: false }
            ListElement { name: "German Shepherd"; type: "Dogs"; aVisible: false }
            ListElement { name: "Parrot"; type: "Birds"; aVisible: false }
//            ListElement { name: "cdcd"; type: "Cats"; aVisible: false }
//            ListElement { name: "rrr"; type: "Dogs"; aVisible: false }
        }

        Component {
            id: sectionHeader

            Rectangle {
                width: root.width
                color:"green"
                height: 50


                Text {
                    text: section
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
//                        console.log("clicked");
                        for(var i=0; i<animalsModel.count; i++)
                        {
                            var animal = animalsModel.get(i);
                            if(animal.type === section)
                                animal.aVisible = !animal.aVisible;
//                            else
//                                animal.aVisible = false;
                        }
                    }
                }
            }
        }


        ListView {
            id: listing
            width: root.width
            height: parent.height
            model: animalsModel

            delegate: listdelegate

            section.property: "type"
            section.criteria: ViewSection.FullString
            section.delegate: sectionHeader
        }

        Component {
            id: listdelegate

            Rectangle {
                id: menuItem
                width: root.width

                color: ListView.isCurrentItem ? "lightblue" : "white"
                visible: aVisible

                onVisibleChanged: {
                    if(visible)
                        height = 55;
                    else
                        height = 0;
                }

                Behavior on height {
                    NumberAnimation { duration: 500 }
                }

                Text {
                    id: text
                    text: name
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        listing.currentIndex = index;
                    }
                }
            }
        }
    }
