// -*- coding: iso-8859-1 -*-
/*
 *   Copyright 2015 Robert <robspamm@fastmail.fm>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import ApplicationLauncher 1.0

Item {
    Layout.minimumWidth: 20
    Layout.minimumHeight: 20

	Layout.maximumWidth: plasmoid.formFactor == PlasmaCore.Types.Planar ? units.gridUnit * 10 : Layout.minimumWidth
    Layout.maximumHeight: plasmoid.formFactor == PlasmaCore.Types.Planar ? units.gridUnit * 10 : Layout.minimumHeight

    Application{
        id: launcher  
        appName: plasmoid.configuration.Command;
	}
	Timer {
		interval: plasmoid.configuration.Interval; 
		running: true;
		repeat: true;
		onTriggered: out.text = launcher.launchScriptGetSTDOUT(); 
	}
	
    PlasmaComponents.Label {
    	id: out;
    	text: "Default";
        /* text: launcher.launchScript(); */
    }

    /* Plasmoid.associatedApplicationUrls: "file:///home" */
}
