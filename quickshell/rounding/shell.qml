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
        property real radius: 36 // = decoration.rounding (26) + gaps_out (10): углы экрана параллельны углам окон
        property real power: 4 // как decoration.rounding_power: 2 = окружность, 4 = squircle

        readonly property bool isRight: corner === 1 || corner === 3
        readonly property bool isBottom: corner >= 2

        // Чёрная заливка между углом экрана и кривой суперэллипса |x|^n + |y|^n = 1
        function cornerPoints() {
            const steps = 48;
            const flip = (x, y) => Qt.point(isRight ? radius - x : x, isBottom ? radius - y : y);
            const pts = [flip(0, 0)];
            for (let i = 0; i <= steps; i++) {
                const t = (Math.PI / 2) * i / steps;
                const dx = radius * Math.pow(Math.cos(t), 2 / power);
                const dy = radius * Math.pow(Math.sin(t), 2 / power);
                pts.push(flip(radius - dx, radius - dy));
            }
            pts.push(flip(0, 0));
            return pts;
        }

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

                PathPolyline {
                    path: cornerPoints()
                }
            }
        }
    }
}
