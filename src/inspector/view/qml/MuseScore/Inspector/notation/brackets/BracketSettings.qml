/*
 * SPDX-License-Identifier: GPL-3.0-only
 * MuseScore-CLA-applies
 *
 * MuseScore
 * Music Composition & Notation
 *
 * Copyright (C) 2021 MuseScore BVBA and others
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
import QtQuick 2.15

import MuseScore.Ui 1.0
import MuseScore.UiComponents 1.0
import MuseScore.Inspector 1.0

import "../../common"

Column {
    id: root

    property QtObject model: null

    property NavigationPanel navigationPanel: null
    property int navigationRowStart: 1

    objectName: "BracketSettings"

    spacing: 12

    function focusOnFirst() {
        columnSection.focusOnFirst()
    }

    SpinBoxPropertyView {
        id: columnSection
        titleText: qsTrc("inspector", "Column")
        propertyItem: root.model ? root.model.bracketColumnPosition : nul

        step: 1
        decimals: 0
        maxValue: 127
        minValue: 0

        navigationPanel: root.navigationPanel
        navigationRowStart: root.navigationRowStart + 1
    }

    SpinBoxPropertyView {
        titleText: qsTrc("inspector", "Span")
        propertyItem: root.model ? root.model.bracketSpanStaves : nul

        step: 1
        decimals: 0
        maxValue: 127
        minValue: 0

        navigationPanel: root.navigationPanel
        navigationRowStart: columnSection.navigationRowEnd + 1
    }
}
