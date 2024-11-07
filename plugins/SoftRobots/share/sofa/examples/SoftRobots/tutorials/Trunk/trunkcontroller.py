from splib3.numerics import Vec3
from Sofa.Core import Controller

class TrunkController(Controller):
    def __init__(self, node, trunk, move_distance=1.0):
        Controller.__init__(self)
        self.node = node
        self.trunk = trunk
        self.move_distance = move_distance
        self.direction = 1
        self.fixed_points = self.trunk.node.getObject('fixedPoints')

    def onAnimateBeginEvent(self, event):
        current_position = self.fixed_points.position.value[0]
        new_position = Vec3(current_position[0] + self.direction * self.move_distance, 
                            current_position[1], 
                            current_position[2])
        
        self.fixed_points.position.value = [new_position]
        self.direction *= -1