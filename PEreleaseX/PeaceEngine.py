from ctypes import *
peBox = 0
peCapsule = 2
peSphere = 1

class PeaceEngine:
		
	e = ""
	def __init__(self):
		global e
		self.e = cdll.PeaceEngine
		print "engine init1"
		#try:
		#	self.e = cdll.PeaceEngine
		#except ValueError:
		#	print "engine init2 error"
		#	pass
		
	def InitPeaceEngine(self):
		self.e.InitPeaceEngine()
	def peInitPhysics(self):
		self.e.peInitPhysics()
	def peShutdown(self):
		self.e.peShutdown()
	def peCreateObj(self, objType = 0 , posx = 0, posy = 0, posz = 0, rotx = 0, roty = 0,  rotz = 0, angle = 0, sidex = 0, sidey = 0, sidez = 0):
		try:
			self.e.peCreateObj(c_int(objType),c_float(posx),c_float(posy),c_float(posz),c_float(rotx),c_float(roty),c_float(rotz),c_float(angle),c_float(sidex),c_float(sidey),c_float(sidez))
		except ValueError:
			pass
	def peDrawObjs(self):
		self.e.peDrawObjs()
	def peBeginScene(self):
		self.e.peBeginScene()
	def peDrawGround(self):
		self.e.peDrawGround()
	def peSetCameraPos(self,posx,posy,posz):
		self.e.peSetCameraPos(c_float(posx),c_float(posy),c_float(posz))
	def peRender(self):
		self.e.peRender()
	def peSimulationStep(self,Pause):
		try:
			self.e.peSimulationStep(c_int(Pause))
		except ValueError:
			pass
	def peAddForce(self,ObjID,fx,fy,fz):
		try:
			self.e.peAddForce(c_float(ObjID),c_float(fx),c_float(fy),c_float(fz))
		except ValueError:
			pass
	def peDSetColor(self,r,g,b,a):
		try:
			self.e.peDSetColor(c_float(r),c_float(g),c_float(b),c_float(a))
		except ValueError:
			pass	
	def peIsShutdown(self):
		return self.e.peIsShutdown()
	def peCreateGround(self):
		return self.e.peCreateGround()
	def peSetObjPos(self,posx,posy,posz):
		try:
			self.e.peSetObjPos(c_float(posx),c_float(posy),c_float(posz))
		except ValueError:
			pass	
	def peSetObjRot(self,rotx,roty,rotz,angle):
		try:
			self.e.peSetObjRot(c_float(rotx),c_float(roty),c_float(rotz),c_float(angle))
		except ValueError:
			pass	
	def peSetObjSize(self,Sizex,Sizey,Sizez):
		try:
			self.e.peSetObjSize(c_float(Sizex),c_float(Sizey),c_float(Sizez))
		except ValueError:
			pass	
	def peCreateObjEx(self,objType):
		try:
			self.e.peCreateObjEx(c_int(objType))
		except ValueError:
			pass	
		
		