from math import cos
from math import sin
from splib3.numerics import Vec3, Quat
from splib3.animation import animate, AnimationManager
from trunkcontroller import TrunkController

import os
path = os.path.dirname(os.path.abspath(__file__))+'/mesh/'
dirPath = os.path.dirname(os.path.abspath(__file__))+'/'


def effectorTarget(parentNode, position=[0., 0., 200]):
    target = parentNode.addChild('Target')
    target.addObject('EulerImplicitSolver', firstOrder=True)
    target.addObject('CGLinearSolver')
    target.addObject('MechanicalObject', name='dofs', position=position, showObject=True, showObjectScale=8, drawMode=2, showColor=[1., 1., 1., 1.])
    target.addObject('UncoupledConstraintCorrection', defaultCompliance=1e-5)
    return target


class Trunk:
    """ This prefab is implementing a soft robot inspired by the elephant's trunk.
        The robot is entirely soft and actuated with 8 cables.

        The prefab is composed of:
        - a visual model
        - a collision model
        - a mechanical model for the deformable structure

        The prefab has the following parameters:
        - youngModulus
        - poissonRatio
        - totalMass

        Example of use in a Sofa scene:

        def createScene(root):
            ...
            trunk = Trunk(root)

            ## Direct access to the components
            trunk.displacements = [0., 0., 0., 0., 5., 0., 0., 0.]
    """

    def __init__(self, parentNode, youngModulus=250, poissonRatio=0.45, totalMass=0.042, inverseMode=False):

        self.inverseMode = inverseMode
        self.node = parentNode.addChild('Trunk')

        self.node.addObject('MeshVTKLoader', name='loader', filename=path+'trunk.vtk')
        self.node.addObject('MeshTopology', src='@loader', name='container')

        self.node.addObject('MechanicalObject', name='dofs', template='Vec3')
        self.node.addObject('UniformMass', totalMass=totalMass)
        self.node.addObject('TetrahedronFEMForceField', template='Vec3', name='FEM', method='large', poissonRatio=poissonRatio,  youngModulus=youngModulus)


    def addVisualModel(self, color=[1., 1., 1., 1.]):
        trunkVisu = self.node.addChild('VisualModel')
        trunkVisu.addObject('MeshSTLLoader', filename=path+'trunk.stl')
        trunkVisu.addObject('OglModel', color=color)
        trunkVisu.addObject('BarycentricMapping')

    def addCollisionModel(self, selfCollision=False):
        trunkColli = self.node.addChild('CollisionModel')
        for i in range(2):
            part = trunkColli.addChild('Part'+str(i+1))
            part.addObject('MeshSTLLoader', name='loader', filename=path+'trunk_colli'+str(i+1)+'.stl')
            part.addObject('MeshTopology', src='@loader')
            part.addObject('MechanicalObject')
            part.addObject('TriangleCollisionModel', group=1 if not selfCollision else i)
            part.addObject('LineCollisionModel', group=1 if not selfCollision else i)
            part.addObject('PointCollisionModel', group=1 if not selfCollision else i)
            part.addObject('BarycentricMapping')

    def fixExtremity(self):
        self.node.addObject('BoxROI', name='boxROI', box=[[-20, -20, 0], [20, 20, 20]], drawBoxes=False)
        self.node.addObject('PartialFixedProjectiveConstraint', fixedDirections=[1, 1, 1], indices='@boxROI.indices')
        # self.node.addObject('PositionConstraint', indices='@boxROI.indices', template='Vec3d', restPosition='@fixedPoints.position')
    def addEffectors(self, target, position=[0., 0., 195.]):
        effectors = self.node.addChild('Effectors')
        effectors.addObject('MechanicalObject', position=position)
        effectors.addObject('PositionEffector', indices=list(range(len(position))), effectorGoal=target)
        effectors.addObject('BarycentricMapping', mapForces=False, mapMasses=False)


def createScene(rootNode):

    # Choose your resolution mode
    # 1- inverseMode=True, solve the inverse problem and control the end effectors
    # 2- inverseMode=False, solve the direct problem and set the cable displacements by hand
    inverseMode = False

    rootNode.addObject('RequiredPlugin', name='SoftRobots')
    rootNode.addObject('RequiredPlugin', name='SofaPython3')
    rootNode.addObject('RequiredPlugin', pluginName=[
                            "Sofa.Component.AnimationLoop",  # Needed to use components FreeMotionAnimationLoop
                            "Sofa.Component.Constraint.Lagrangian.Correction",  # Needed to use components GenericConstraintCorrection
                            "Sofa.Component.Constraint.Lagrangian.Solver",  # Needed to use components GenericConstraintSolver
                            "Sofa.Component.Constraint.Projective",  # Needed to use components PartialFixedProjectiveConstraint
                            "Sofa.Component.Engine.Select",  # Needed to use components BoxROI
                            "Sofa.Component.IO.Mesh",  # Needed to use components MeshSTLLoader, MeshVTKLoader
                            "Sofa.Component.LinearSolver.Direct",  # Needed to use components SparseLDLSolver
                            "Sofa.Component.LinearSolver.Iterative",  # Needed to use components ShewchukPCGLinearSolver
                            "Sofa.Component.Mass",  # Needed to use components UniformMass
                            "Sofa.Component.ODESolver.Backward",  # Needed to use components EulerImplicitSolver
                            "Sofa.Component.SolidMechanics.FEM.Elastic",  # Needed to use components TetrahedronFEMForceField
                            "Sofa.Component.Topology.Container.Constant",  # Needed to use components MeshTopology
                            "Sofa.Component.Visual",  # Needed to use components VisualStyle
                            "Sofa.GL.Component.Rendering3D",  # Needed to use components OglModel
                        ])
    AnimationManager(rootNode)
    rootNode.addObject('DefaultVisualManagerLoop')
    rootNode.addObject('VisualStyle', displayFlags='showBehavior')
    rootNode.gravity = [0., 0., 9810.]

    rootNode.addObject('FreeMotionAnimationLoop')
    if inverseMode:
        # For inverse resolution, i.e control of effectors position
        rootNode.addObject('RequiredPlugin', name='SoftRobots.Inverse')
        rootNode.addObject('QPInverseProblemSolver', epsilon=1e-1)
    else:
        # For direct resolution, i.e direct control of the cable displacement
        rootNode.addObject('GenericConstraintSolver', maxIterations=100, tolerance=1e-5)

    simulation = rootNode.addChild('Simulation')

    simulation.addObject('EulerImplicitSolver', name='odesolver', firstOrder=False, rayleighMass=0.1, rayleighStiffness=0.1)
    simulation.addObject('SparseLDLSolver', name='precond')
    simulation.addObject('GenericConstraintCorrection')

    trunk = Trunk(simulation, inverseMode=inverseMode)
    trunk.addVisualModel(color=[1., 1., 1., 0.8])
    trunk.fixExtremity()

    # Add the controller
    trunk_controller = TrunkController(simulation, trunk)
    simulation.addObject(trunk_controller)
