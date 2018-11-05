import QtQuick 2.0


Item{

    property ListModel model: nestedModel

    function addGroupName(groupName){
        console.log("HHHHHHHHHHHHHH   "+groupName) 
        var flag= true
        var num = nestedModel.count
        for(var i=0;i<num;i++){
            var item = nestedModel.get(i)
            if(item.categoryName===groupName){
                flag=false
                break
            }
        }
        if(flag)
            nestedModel.append({"categoryName":groupName,"collapsed":true,"subItems":[]})

    }

    function addGroupItem(groupName,groupItem){
        var num = nestedModel.count
        for(var i=0;i<num;i++){
            var item = nestedModel.get(i)
            if(item.categoryName===groupName){
                item.subItems.append({"itemName":groupItem})
            }
        }
    }

    function deleteGroup(index){
        nestedModel.remove(index)
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
}

