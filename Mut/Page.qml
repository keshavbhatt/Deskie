import QtQuick 2.0
import QtQuick.Controls 1.1
import Mut 0.1
import Mut.Themes 0.1

FocusScope {
    id: root

    property string title
    property list<Action> actions

    property var navHandler: function () { root.pop(); };
    property Action navAction: Action {
        iconSource: Theme.image("arrow_back.svg")
        onTriggered: root.navHandler()
    }

    /*! Push a new component into the stack */
    function push(item) {
        return Stack.view.push(item);
    }

    /*! Pop this page from the stack */
    function pop() {
        if (Stack.view.currentItem === root)
            return Stack.view.pop();
    }
}
