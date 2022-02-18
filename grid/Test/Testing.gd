extends Node

var cursor = Sprite3D.new()



func _init():
	cursor.texture = preload("res://icon.png")
	cursor.pixel_size = 0.03
	cursor.axis = 1
	cursor.translate(Vector3(0,0.01,0))
	add_child(cursor, true)
	var Grid = preload("res://grid/grid.gd")
	var _g = Grid.new(12, 8, 2, self)
	
func _on_Area_mouse_entered(sender):
	cursor.transform = sender.transform
	cursor.translate(Vector3(0,0.01,0))
	
func _on_Area_mouse_exited(sender):
	#cursor.transform = sender.transform
	pass
	
func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			var dummy = RigidBody.new()
			var cs = CollisionShape.new()
			cs.shape = BoxShape.new()
			var m = MeshInstance.new()
			m.mesh = CubeMesh.new()
			dummy.add_child(cs)
			dummy.add_child(m)
			dummy.translate(cursor.transform.origin + Vector3(0,4,0))
			add_child(dummy)
			
