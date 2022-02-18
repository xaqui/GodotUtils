extends Node

var width
var height
var cellSize
var gridArray = []

func _init(p_width, p_height, p_cellSize, parent):
	width = p_width
	height = p_height
	cellSize = p_cellSize
	for z in range(height):
		gridArray.append([])
		gridArray[z].resize(width)
		for x in range(width):
			gridArray[z][x] = null
			#createWorldMesh(parent, gridArray[z][x], cellSize, GetWorldPosition(x,z))
			#print_debug("(", z, ", ", x, "): ", gridArray[z][x])
	PopulateGrid(parent)

func GetWorldPosition(x, z):
	return Vector3(x, 0.0, z) * cellSize

func PopulateGrid(parent):
	var Tile = load("res://grid/tile.gd")
	for z in range(height):
		for x in range(width):
				var t = Tile.new(parent, GetWorldPosition(x,z))
				parent.add_child(t)
				gridArray[z][x] = t
				#print_debug(gridArray[z][x].values())
