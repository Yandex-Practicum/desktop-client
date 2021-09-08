import QtQuick 2.12
import QtQuick.Controls 2.12
import "./"
import "../Controls"
import "../Config"

Item {
    id: root
    enabled: ServerContainersLogic.pageEnabled
    ImageButtonType {
        id: back
        x: 10
        y: 10
        width: 26
        height: 20
        icon.source: "qrc:/images/arrow_left.png"
        onClicked: {
            UiLogic.closePage()
        }
    }
    Text {
        font.family: "Lato"
        font.styleName: "normal"
        font.pixelSize: 24
        color: "#100A44"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: qsTr("Protocols")
        x: 10
        y: 35
        width: 361
        height: 31
    }
    ProgressBar {
        id: progress_bar
        anchors.horizontalCenter: parent.horizontalCenter
        y: 570
        width: 301
        height: 40
        from: 0
        to: ServerContainersLogic.progressBarProtocolsContainerReinstallMaximium
        value: ServerContainersLogic.progressBarProtocolsContainerReinstallValue
        visible: ServerContainersLogic.progressBarProtocolsContainerReinstallVisible
        background: Rectangle {
            implicitWidth: parent.width
            implicitHeight: parent.height
            color: "#100A44"
            radius: 4
        }

        contentItem: Item {
            implicitWidth: parent.width
            implicitHeight: parent.height
            Rectangle {
                width: progress_bar.visualPosition * parent.width
                height: parent.height
                radius: 4
                color: Qt.rgba(255, 255, 255, 0.15);
            }
        }

        LabelType {
            anchors.fill: parent
            text: qsTr("Configuring...")
            horizontalAlignment: Text.AlignHCenter
            font.family: "Lato"
            font.styleName: "normal"
            font.pixelSize: 16
            color: "#D4D4D4"
        }
    }
    ScrollView {
        x: 0
        y: 70
        width: 380
        height: 471
        clip: true
        Column {
            spacing: 5
            Rectangle {
                id: frame_openvpn_ss_cloak
                x: 9
                height: 135
                width: 363
                border.width: 1
                border.color: "lightgray"
                radius: 2
                visible: ServerContainersLogic.frameOpenvpnSsCloakSettingsVisible
                Item {
                    x: 5
                    y: 5
                    width: parent.width - 10
                    height: parent.height - 10
                    LabelType {
                        anchors.left: parent.left
                        width: 239
                        height: 24
                        text: qsTr("Cloak container")
                        leftPadding: 5
                    }
                    ImageButtonType {
                        anchors.right: sr1.left
                        anchors.rightMargin: 5
                        checkable: true
                        icon.source: checked ? "qrc:/images/check.png" : "qrc:/images/uncheck.png"
                        width: 24
                        height: 24
                        checked: ServerContainersLogic.pushButtonCloakOpenVpnContDefaultChecked
                        onCheckedChanged: {
                            ServerContainersLogic.pushButtonCloakOpenVpnContDefaultChecked = checked
                        }
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoCloakOpenVpnContDefaultClicked(checked)
                        }

                        visible: ServerContainersLogic.pushButtonCloakOpenVpnContDefaultVisible
                    }

                    ImageButtonType {
                        id: sr1
                        anchors.right: cn1.left
                        anchors.rightMargin: 5
                        icon.source: "qrc:/images/share.png"
                        width: 24
                        height: 24
                        visible: ServerContainersLogic.pushButtonCloakOpenVpnContShareVisible
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoCloakOpenVpnContShareClicked(false)
                        }
                    }
                    ImageButtonType {
                        id: cn1
                        anchors.right: parent.right
                        checkable: true
                        icon.source: checked ? "qrc:/images/connect_button_connected.png"
                                             : "qrc:/images/connect_button_disconnected.png"
                        width: 36
                        height: 24
                        checked: ServerContainersLogic.pushButtonCloakOpenVpnContInstallChecked
                        onCheckedChanged: {
                            ServerContainersLogic.pushButtonCloakOpenVpnContInstallChecked = checked
                        }
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoCloakOpenVpnContInstallClicked(checked)
                        }
                        enabled: ServerContainersLogic.pushButtonCloakOpenVpnContInstallEnabled
                    }
                }
                Rectangle {
                    x: 10
                    y: 42
                    height: 83
                    width: 343
                    border.width: 1
                    border.color: "lightgray"
                    radius: 2
                    SettingButtonType {
                        x: 10
                        y: 10
                        width: 323
                        height: 24
                        text: qsTr("OpenVPN settings")
                        icon.source: "qrc:/images/settings.png"
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoCloakOpenVpnContOpenvpnConfigClicked()
                        }
                    }
                    SettingButtonType {
                        x: 10
                        y: 33
                        width: 323
                        height: 24
                        text: qsTr("ShadowSocks settings")
                        icon.source: "qrc:/images/settings.png"
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoCloakOpenVpnContSsConfigClicked()
                        }
                    }
                    SettingButtonType {
                        x: 10
                        y: 56
                        width: 323
                        height: 24
                        text: qsTr("Cloak settings")
                        icon.source: "qrc:/images/settings.png"
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoCloakOpenVpnContCloakConfigClicked()
                        }
                    }
                }
            }
            Rectangle {
                id: frame_openvpn_ss
                x: 9
                height: 105
                width: 363
                border.width: 1
                border.color: "lightgray"
                radius: 2
                visible: ServerContainersLogic.frameOpenvpnSsSettingsVisible
                Item {
                    x: 5
                    y: 5
                    width: parent.width - 10
                    height: parent.height - 10
                    LabelType {
                        anchors.left: parent.left
                        width: 239
                        height: 24
                        text: qsTr("ShadowSocks container")
                        leftPadding: 5
                    }
                    ImageButtonType {
                        anchors.right: sr2.left
                        anchors.rightMargin: 5
                        checkable: true
                        icon.source: checked ? "qrc:/images/check.png" : "qrc:/images/uncheck.png"
                        width: 24
                        height: 24
                        checked: ServerContainersLogic.pushButtonSsOpenVpnContDefaultChecked
                        onCheckedChanged: {
                            ServerContainersLogic.pushButtonSsOpenVpnContDefaultChecked = checked
                        }
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoSsOpenVpnContDefaultClicked(checked)
                        }

                        visible: ServerContainersLogic.pushButtonSsOpenVpnContDefaultVisible
                    }

                    ImageButtonType {
                        id: sr2
                        anchors.right: cn2.left
                        anchors.rightMargin: 5
                        icon.source: "qrc:/images/share.png"
                        width: 24
                        height: 24
                        visible: ServerContainersLogic.pushButtonSsOpenVpnContShareVisible
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoSsOpenVpnContShareClicked(false)
                        }
                    }
                    ImageButtonType {
                        id: cn2
                        anchors.right: parent.right
                        checkable: true
                        icon.source: checked ? "qrc:/images/connect_button_connected.png"
                                             : "qrc:/images/connect_button_disconnected.png"
                        width: 36
                        height: 24
                        checked: ServerContainersLogic.pushButtonSsOpenVpnContInstallChecked
                        onCheckedChanged: {
                            ServerContainersLogic.pushButtonSsOpenVpnContInstallChecked = checked
                        }
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoSsOpenVpnContInstallClicked(checked)
                        }
                        enabled: ServerContainersLogic.pushButtonSsOpenVpnContInstallEnabled
                    }
                }
                Rectangle {
                    x: 10
                    y: 42
                    height: 53
                    width: 343
                    border.width: 1
                    border.color: "lightgray"
                    radius: 2
                    SettingButtonType {
                        x: 10
                        y: 5
                        width: 323
                        height: 24
                        text: qsTr("OpenVPN settings")
                        icon.source: "qrc:/images/settings.png"
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoSsOpenVpnContOpenvpnConfigClicked()
                        }
                    }
                    SettingButtonType {
                        x: 10
                        y: 27
                        width: 323
                        height: 24
                        text: qsTr("ShadowSocks settings")
                        icon.source: "qrc:/images/settings.png"
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoSsOpenVpnContSsConfigClicked()
                        }
                    }
                }
            }
            Rectangle {
                id: frame_openvpn
                x: 9
                height: 100
                width: 363
                border.width: 1
                border.color: "lightgray"
                radius: 2
                visible: ServerContainersLogic.frameOpenvpnSettingsVisible
                Item {
                    x: 5
                    y: 5
                    width: parent.width - 10
                    height: parent.height - 10
                    LabelType {
                        anchors.left: parent.left
                        width: 239
                        height: 24
                        text: qsTr("OpenVPN container")
                        leftPadding: 5
                    }
                    ImageButtonType {
                        anchors.right: sr3.left
                        anchors.rightMargin: 5
                        checkable: true
                        icon.source: checked ? "qrc:/images/check.png" : "qrc:/images/uncheck.png"
                        width: 24
                        height: 24
                        checked: ServerContainersLogic.pushButtonOpenVpnContDefaultChecked
                        onCheckedChanged: {
                            ServerContainersLogic.pushButtonOpenVpnContDefaultChecked = checked
                        }
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoOpenVpnContDefaultClicked(checked)
                        }

                        visible: ServerContainersLogic.pushButtonOpenVpnContDefaultVisible
                    }

                    ImageButtonType {
                        id: sr3
                        anchors.right: cn3.left
                        anchors.rightMargin: 5
                        icon.source: "qrc:/images/share.png"
                        width: 24
                        height: 24
                        visible: ServerContainersLogic.pushButtonOpenVpnContShareVisible
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoOpenVpnContShareClicked(false)
                        }
                    }
                    ImageButtonType {
                        id: cn3
                        anchors.right: parent.right
                        checkable: true
                        icon.source: checked ? "qrc:/images/connect_button_connected.png"
                                             : "qrc:/images/connect_button_disconnected.png"
                        width: 36
                        height: 24
                        checked: ServerContainersLogic.pushButtonOpenVpnContInstallChecked
                        onCheckedChanged: {
                            ServerContainersLogic.pushButtonOpenVpnContInstallChecked = checked
                        }
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoOpenVpnContInstallClicked(checked)
                        }
                        enabled: ServerContainersLogic.pushButtonOpenVpnContInstallEnabled
                    }
                }
                Rectangle {
                    x: 10
                    y: 42
                    height: 44
                    width: 343
                    border.width: 1
                    border.color: "lightgray"
                    radius: 2
                    SettingButtonType {
                        x: 10
                        y: 10
                        width: 323
                        height: 24
                        text: qsTr("OpenVPN settings")
                        icon.source: "qrc:/images/settings.png"
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoOpenVpnContOpenvpnConfigClicked()
                        }
                    }
                }
            }
            Rectangle {
                id: frame_wireguard
                x: 9
                height: 100
                width: 363
                border.width: 1
                border.color: "lightgray"
                radius: 2
                visible: ServerContainersLogic.frameWireguardVisible
                Item {
                    x: 5
                    y: 5
                    width: parent.width - 10
                    height: parent.height - 10
                    LabelType {
                        anchors.left: parent.left
                        width: 239
                        height: 24
                        text: qsTr("WireGuard container")
                        leftPadding: 5
                    }
                    ImageButtonType {
                        anchors.right: sr4.left
                        anchors.rightMargin: 5
                        checkable: true
                        icon.source: checked ? "qrc:/images/check.png" : "qrc:/images/uncheck.png"
                        width: 24
                        height: 24
                        checked: ServerContainersLogic.pushButtonWireguardContDefaultChecked
                        onCheckedChanged: {
                            ServerContainersLogic.pushButtonWireguardContDefaultChecked = checked
                        }
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoWireguardContDefaultClicked(checked)
                        }

                        visible: ServerContainersLogic.pushButtonWireguardContDefaultVisible
                    }

                    ImageButtonType {
                        id: sr4
                        anchors.right: cn4.left
                        anchors.rightMargin: 5
                        icon.source: "qrc:/images/share.png"
                        width: 24
                        height: 24
                        visible: ServerContainersLogic.pushButtonWireguardContShareVisible
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoWireguardContShareClicked(false)
                        }
                    }
                    ImageButtonType {
                        id: cn4
                        anchors.right: parent.right
                        checkable: true
                        icon.source: checked ? "qrc:/images/connect_button_connected.png"
                                             : "qrc:/images/connect_button_disconnected.png"
                        width: 36
                        height: 24
                        checked: ServerContainersLogic.pushButtonWireguardContInstallChecked
                        onCheckedChanged: {
                            ServerContainersLogic.pushButtonWireguardContInstallChecked = checked
                        }
                        onClicked: {
                            ServerContainersLogic.onPushButtonProtoWireguardContInstallClicked(checked)
                        }
                        enabled: ServerContainersLogic.pushButtonWireguardContInstallEnabled
                    }
                }
                Rectangle {
                    id: frame_wireguard_settings
                    visible: ServerContainersLogic.frameWireguardSettingsVisible
                    x: 10
                    y: 42
                    height: 44
                    width: 343
                    border.width: 1
                    border.color: "lightgray"
                    radius: 2
                    SettingButtonType {
                        x: 10
                        y: 10
                        width: 323
                        height: 24
                        text: qsTr("WireGuard settings")
                        icon.source: "qrc:/images/settings.png"
                    }
                }
            }
        }
    }
}