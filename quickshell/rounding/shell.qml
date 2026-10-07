import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Wayland

ShellRoot {
    Variants {
        model: Quickshell.screens

        Scope {
            required property var modelData

            CornerOverlay { screen: modelData; corner: 0 }
            CornerOverlay { screen: modelData; corner: 1 }
            CornerOverlay { screen: modelData; corner: 2 }
            CornerOverlay { screen: modelData; corner: 3 }
        }
    }

    component CornerOverlay: PanelWindow {
        property int corner: 0 // 0: top-left, 1: top-right, 2: bottom-left, 3: bottom-right
        property real radius: 23

        anchors {
            top: corner < 2
            right: corner === 1 || corner === 3
            bottom: corner >= 2
            left: corner === 0 || corner === 2
        }

        implicitWidth: radius
        implicitHeight: radius
        color: "transparent"
        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.namespace: "quickshell:screenRounding"
        WlrLayershell.layer: WlrLayer.Overlay

        Shape {
            id: cornerShape
            anchors.fill: parent
            layer.enabled: true
            layer.smooth: true
            preferredRendererType: Shape.CurveRenderer

            ShapePath {
                id: cornerShapePath
                strokeWidth: 0
                fillColor: "#000000"

                startX: corner === 0 || corner === 2 ? 0 : radius
                startY: corner === 0 || corner === 1 ? 0 : radius

                PathAngleArc {
                    moveToStart: false
                    centerX: radius - cornerShapePath.startX
                    centerY: radius - cornerShapePath.startY
                    radiusX: radius
                    radiusY: radius
                    startAngle: corner === 0 ? 180 : corner === 1 ? -90 : corner === 2 ? 90 : 0
                    sweepAngle: 90
                }

                PathLine {
                    x: cornerShapePath.startX
                    y: cornerShapePath.startY
                }

            }
        }
    }
}
