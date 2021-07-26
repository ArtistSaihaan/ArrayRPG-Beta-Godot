extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed : float
var RaycastHit : String
onready var Eyes : RayCast
var PlayerName

var Player : String
onready var myenemy : KinematicBody


export var define = ["RaycastHit", "PlayerName"] 
var startdetecting = false
var triggered = false

export var health : float


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(0.1), "timeout")
	startdetecting = true
	Eyes = get_parent().get_node(RaycastHit)
	myenemy = get_parent().get_node(Player)
	pass # Replace with function body.

func _process(delta):
	if startdetecting:
		if Eyes.is_colliding():
			var collider = Eyes.get_collider()
			if collider.name == PlayerName:
				triggered = true
			else:
				triggered = false
		if triggered:
			look_at(myenemy.translation, translation)
			var velocity = translation.direction_to(myenemy.translation) * speed
			move_and_slide(velocity)
			Eyes.force_raycast_update()
			
		if health <= 0:
			queue_free()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
