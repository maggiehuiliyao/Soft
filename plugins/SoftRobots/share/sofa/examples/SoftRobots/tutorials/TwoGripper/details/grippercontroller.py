# -*- coding: utf-8 -*-
import Sofa.Core
import Sofa.constants.Key as Key
from finger import FingerController


def getTranslated(points, vec):
    r = []
    for v in points:
        r.append([v[0] + vec[0], v[1] + vec[1], v[2] + vec[2]])
    return r


class GripperController(Sofa.Core.Controller):

    def __init__(self, *args, **kwargs):
        Sofa.Core.Controller.__init__(self, args, kwargs)
        self.fingers = args[0]
        self.name = "GripperController"
        self.rootNode = kwargs.get("rootNode")
        self.moveCount = 0
        
    def onAnimateBeginEvent(self, event):
        gripper_moves = ["up", "down", "left", "right"]
        finger_moves = ["open", "close"]
        moves = ["down"] * 70 + ["left"] * 20 + ["close"]* 25 + ["up"]* 40 + ["open"]*45
        self.moveCount += 1
        
        cur_move = moves[self.moveCount]
        if cur_move in gripper_moves:
            self.programmed_motion(cur_move)
        elif cur_move in finger_moves:
            for finger in self.fingers:
                finger.getChild("ElasticMaterialObject").getObject("FingerController").programmed_motion(cur_move)
                # finger.getChild("ElasticMaterialObject").getChild("PullingCable").getObject("FingerController").programmed_motion("close")
        self.moveCount += 1
        
    def programmed_motion(self, e):
        direction = None

        if e == "up": direction = [0.0, 1.0, 0.0]
        elif e == "down": direction = [0.0, -1.0, 0.0]
        elif e == "left": direction = [1.0, 0.0, 0.0]
        elif e == "right": direction = [-1.0, 0.0, 0.0]

        if direction is not None and self.fingers is not None:
            for finger in self.fingers:
                m = finger.getChild("ElasticMaterialObject")
                mecaobject = m.getObject("dofs")
                mecaobject.findData('rest_position').value = getTranslated(mecaobject.rest_position.value, direction)

                cable = m.getChild("PullingCable").getObject("CableConstraint")
                p = cable.pullPoint.value
                cable.findData("pullPoint").value = [p[0] + direction[0], p[1] + direction[1], p[2] + direction[2]]
            
            Sofa.Simulation.animate(self.rootNode, 0.000001)

    def onKeypressedEvent(self, e):
        direction = None

        if e["key"] == Key.uparrow:
            direction = [0.0, 1.0, 0.0]
        elif e["key"] == Key.downarrow:
            direction = [0.0, -1.0, 0.0]
        elif e["key"] == Key.leftarrow:
            direction = [1.0, 0.0, 0.0]
        elif e["key"] == Key.rightarrow:
            direction = [-1.0, 0.0, 0.0]

        if direction is not None and self.fingers is not None:
            for finger in self.fingers:
                m = finger.getChild("ElasticMaterialObject")
                mecaobject = m.getObject("dofs")
                mecaobject.findData('rest_position').value = getTranslated(mecaobject.rest_position.value, direction)

                cable = m.getChild("PullingCable").getObject("CableConstraint")
                p = cable.pullPoint.value
                cable.findData("pullPoint").value = [p[0] + direction[0], p[1] + direction[1], p[2] + direction[2]]


def createScene(rootNode):
    rootNode.addObject(GripperController(None))

    return
