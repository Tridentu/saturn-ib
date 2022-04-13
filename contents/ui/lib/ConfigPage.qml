import QtQuick 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15
 
ScrollView {
    id: pageRoot
    default property alias _contentChildren: content.data
    Layout.fillWidth: true
    ColumnLayout {
        id: page
        Layout.fillWidth: true

        ColumnLayout {
            id: content
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop

            // Workaround for crash when using default on a Layout.
            // https://bugreports.qt.io/browse/QTBUG-52490
            // Still affecting Qt 5.7.0
            Component.onDestruction: {
                while (children.length > 0) {
                    children[children.length - 1].parent = page;
                }
            }
        }
    }
}
