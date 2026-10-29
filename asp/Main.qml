import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    width: 800
    height: 600
    visible: true
    title: "Admission Speciality Predictor"

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // ==========================================
        // ЛЕВАЯ ЧАСТЬ: Светло-синяя боковая панель
        // ==========================================
        Rectangle {
            id: sidePanel
            property bool isExpanded: true

            Layout.fillHeight: true
            Layout.preferredWidth: isExpanded ? 200 : 50

            Behavior on Layout.preferredWidth {
                NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
            }

            color: "#34495e"

            Column {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 12
                spacing: 15
                width: parent.width - 24

                // Верхний блок: кнопка переключения и заголовок
                RowLayout {
                    width: parent.width
                    spacing: 10

                    Button {
                        id: toggleButton
                        text: sidePanel.isExpanded ? "<" : ">"
                        flat: true
                        Layout.preferredWidth: 30
                        Layout.preferredHeight: 30
                        onClicked: sidePanel.isExpanded = !sidePanel.isExpanded

                        contentItem: Text {
                            text: toggleButton.text
                            color: "#ffffff"
                            font.bold: true
                            font.family: "Arial"
                            font.pointSize: 14
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Text {
                        text: "МЕНЮ"
                        color: "#ffffff"
                        font.bold: true
                        font.family: "Arial"
                        font.pointSize: 16
                        Layout.fillWidth: true
                        visible: sidePanel.isExpanded
                    }
                }

                // Кнопка 1: Профиль
                Button {
                    id: btnProfile
                    width: parent.width
                    flat: true
                    visible: sidePanel.isExpanded
                    onClicked: stackLayout.currentIndex = 0

                    background: Rectangle {
                        color: stackLayout.currentIndex === 0 ? "#4e6a85" : "transparent"
                        radius: 4
                    }

                    contentItem: Text {
                        text: "Профиль"
                        color: "#ffffff"
                        font.bold: stackLayout.currentIndex === 0
                        font.family: "Arial"
                        font.pointSize: 16
                        leftPadding: 8
                    }
                }

                // Кнопка 2: Главная
                Button {
                    id: btnHome
                    width: parent.width
                    flat: true
                    visible: sidePanel.isExpanded
                    onClicked: stackLayout.currentIndex = 1

                    background: Rectangle {
                        color: stackLayout.currentIndex === 1 ? "#4e6a85" : "transparent"
                        radius: 4
                    }

                    contentItem: Text {
                        text: "Главная"
                        color: "#ffffff"
                        font.bold: stackLayout.currentIndex === 1
                        font.family: "Arial"
                        font.pointSize: 16
                        leftPadding: 8
                    }
                }

                // Кнопка 3: Источники
                Button {
                    id: btnSources
                    width: parent.width
                    flat: true
                    visible: sidePanel.isExpanded
                    onClicked: stackLayout.currentIndex = 2

                    background: Rectangle {
                        color: stackLayout.currentIndex === 2 ? "#4e6a85" : "transparent"
                        radius: 4
                    }

                    contentItem: Text {
                        text: "Источники"
                        color: "#ffffff"
                        font.bold: stackLayout.currentIndex === 2
                        font.family: "Arial"
                        font.pointSize: 16
                        leftPadding: 8
                    }
                }

                // Кнопка 4: Информация
                Button {
                    id: btnInfo
                    width: parent.width
                    flat: true
                    visible: sidePanel.isExpanded
                    onClicked: stackLayout.currentIndex = 3

                    background: Rectangle {
                        color: stackLayout.currentIndex === 3 ? "#4e6a85" : "transparent"
                        radius: 4
                    }

                    contentItem: Text {
                        text: "Информация"
                        color: "#ffffff"
                        font.bold: stackLayout.currentIndex === 3
                        font.family: "Arial"
                        font.pointSize: 16
                        leftPadding: 8
                    }
                }
            }
        }

        // ==========================================
        // ПРАВАЯ ЧАСТЬ: Контент вкладок
        // ==========================================
        StackLayout {
            id: stackLayout
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: 0

            // 1. ВКЛАДКА: ПРОФИЛЬ
            ScrollView {
                clip: true
                Column {
                    width: parent.width
                    spacing: 0
                    padding: 25

                    // --- БЛОК 1: МОЙ ПРОФИЛЬ ---
                    Text {
                        text: "Мой профиль"
                        font.bold: true
                        font.family: "Arial"
                        font.pointSize: 20
                    }

                    Text {
                        text: "Создайте свой профиль и выбирайте понравившиеся специальности!"
                        font.family: "Arial"
                        font.pointSize: 12
                        color: "dimgray"
                        bottomPadding: 15
                    }

                    // Поля формы внутри Профиля
                    Column {
                        spacing: 12
                        bottomPadding: 40

                        TextField { placeholderText: "ФИО"; font.family: "Arial"; font.pointSize: 12; width: 300 }
                        TextField { placeholderText: "Средний балл"; font.family: "Arial"; font.pointSize: 12; width: 150 }
                        Button { text: "Сохранить профиль"; highlighted: true }
                    }

                    // --- БЛОК 2: ИЗБРАННОЕ ---
                    Text {
                        text: "Избранное"
                        font.bold: true
                        font.family: "Arial"
                        font.pointSize: 20
                    }

                    Text {
                        text: "Здесь будет список предпочтительных Вам специальностей"
                        font.family: "Arial"
                        font.pointSize: 12
                        color: "dimgray"
                    }
                }
            }

            // 2. ВКЛАДКА: ГЛАВНАЯ
            Rectangle {
                color: "#fafafa"
                Column {
                    anchors.centerIn: parent
                    spacing: 15
                    Text {
                        text: "Добро пожаловать в систему!"
                        font.bold: true; font.family: "Arial"; font.pointSize: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Text {
                        text: "Здесь будет отображаться список рекомендуемых специальностей"
                        font.family: "Arial"; font.pointSize: 12; color: "gray"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }

            // 3. ВКЛАДКА: ИСТОЧНИКИ
            ScrollView {
                clip: true
                Column {
                    spacing: 12
                    padding: 25
                    Text { text: "Полезные ресурсы и проходные баллы"; font.bold: true; font.family: "Arial"; font.pointSize: 16; bottomPadding: 10 }
                    Label { text: "• <b>KudaPostupat.by</b> — Электронный справочник абитуриента"; font.family: "Arial"; font.pointSize: 12; textFormat: Text.RichText }
                    Label { text: "• <b>Abiturient.by</b> — Официальный сайт мониторинга вступительной кампании"; font.family: "Arial"; font.pointSize: 12; textFormat: Text.RichText }
                }
            }

            // 4. ВКЛАДКА: ИНФОРМАЦИЯ
            Rectangle {
                color: "#f4f4f4"
                Column {
                    anchors.centerIn: parent
                    spacing: 10
                    Text {
                        text: "Модель подбора специальности для поступления\n"; font.bold: true; font.family: "Arial"; font.pointSize: 16; anchors.horizontalCenter: parent.horizontalCenter }
                    Text { text: "Разработчики:\nПашкевич Н.В.\nТретьяк М.М.\nШумский М.В."; font.family: "Arial"; font.pointSize: 14 }
                }
            }
        }
    }
}
