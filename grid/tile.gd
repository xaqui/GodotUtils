extends Node

var TileRoot = Spatial.new()
var SB = StaticBody.new() 
var CS2 = CollisionShape.new()
var AR = Area.new()
var CS = CollisionShape.new()
var M = MeshInstance.new()
var tile = {}

func _init(parent, WorldPosition):
	TileRoot.translate(WorldPosition)
	AR.connect("mouse_entered", parent, "_on_Area_mouse_entered",[TileRoot])
	AR.connect("mouse_exited", parent, "_on_Area_mouse_exited",[TileRoot])
	AR.connect("input_event", parent, "_on_Area_input_event")
	CS.shape = BoxShape.new()
	CS.translate(Vector3(0,-1,0))
	M.mesh = QuadMesh.new()
	M.scale = Vector3(2,2,1)
	M.rotate(Vector3(1,0,0), -1.571)

	AR.add_child(CS)
	TileRoot.add_child(AR)
	TileRoot.add_child(M)
	
	TileRoot.add_child(SB)
	CS2.shape = BoxShape.new()
	CS2.translate(Vector3(0,-1.01,0))
	
	SB.add_child(CS2)
	
	parent.add_child(TileRoot, true)
	
	tile["CoordinatesXZ"] = Vector2(WorldPosition.x,WorldPosition.z)
	tile["CoordinatesXYZ"] = WorldPosition
	tile["Active"] = true
	tile["Area"] = AR
	tile["Mesh"] = M
	
	#print_debug(WorldPosition)
	
func getCoordinatesXZ():
	return tile.get("CoordinatesXZ")
	
func getCoordinatesXYZ():
	return tile.get("CoordinatesXYZ")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
