extends StaticBody
class_name Item

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ItemName : String
var Quantity : int
var ThisItemCollider : String
onready var collider = null
export var define = ["ItemName", "Quantity", "ThisItemCollider"]

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	collider = get_parent().get_node(ThisItemCollider)
	yield(get_tree().create_timer(0.1), "timeout")
	if collider.get_class() == "Area":
		collider.connect("area_entered", self, "destroy")
	pass # Replace with function body.
	
func destroy(area):
	yield(get_tree().create_timer(0.1), "timeout")
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
