from PeaceEngine import *
from math import *
import random,time

counter = 0
objcount = 0


def drop_object():
	global  counter, objcount
	#e.peCreateObj(int(random.random()*0),0,0,10,random.random(),random.random(),random.random(),random.random()*360,random.random()*1,0.2,0.2 ) # objType = box  , posx , posy , posz , rotx , roty ,  rotz , angle , sidex , sidey , sidez 
	e.peSetObjPos(0.1, 0.1, 10.25)
	e.peSetObjRot(random.random(), random.random(), random.random(), random.random()*360)
	e.peSetObjSize(random.random()*1,0.2,0.2)
	e.peCreateObjEx (0)
	
	counter = 0
	objcount += 1

def stepsim(n):
	for i in xrange(n):
		e.peSimulationStep(0)
	
def MainLoop():
	global counter
	counter += 1
	if counter==55:
		drop_object()
	if objcount == 2000:
		e.peShutdown()


e = PeaceEngine()

e.InitPeaceEngine()
e.peInitPhysics()
e.peCreateGround()
drop_object()

#for i in range(10000):
while not (e.peIsShutdown()):
	e.peBeginScene()
	e.peDrawGround()
	
	MainLoop()
	
	e.peDrawObjs()
	e.peRender()
	
	stepsim(2)
	
	
	
e.peShutdown()
