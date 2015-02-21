    /*
 *  Copyright 2015 Robert <robspamm@fastmail.fm>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  2.010-1301, USA.
 */

import QtQuick 2.0
import QtQuick.Controls 1.0 as QtControls
import QtQuick.Layouts 1.0 as QtLayouts
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {

	width: childrenRect.width
    height: childrenRect.height

	QtLayouts.ColumnLayout {

		QtLayouts.RowLayout {		
	     	QtControls.Label {	     		
				text: "Command:";
			}
		    
		    QtControls.TextField {		  
		        placeholderText: "Command"
				text : plasmoid.configuration.Command;			
		        onTextChanged: {
	                plasmoid.configuration.Command = text;
		        }
			}
	    }
    
	    QtLayouts.RowLayout {		
	     	QtControls.Label {	     		
				text: "Interval [ms]:";
			}
		    
		    QtControls.SpinBox {				
				maximumValue : 10000
				minimumValue : 1000
				stepSize : 1000
				value : plasmoid.configuration.Interval			
		        onEditingFinished: {
	                plasmoid.configuration.Interval = value
		        }
			}
	    }
    
    }
	
}
