extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Movement = Vector3()
export var Speed = 1

var ItemDetector : String
onready var detector : Area

var DetectionTimer : String
onready var tickratetimer : Timer

var LostScreen : String
onready var lostdisplay

var DamageRateTimer : String
onready var damagerate : Timer


var ScenePath : String

var EnemyList = []

export var Define = ["ItemDetector", "DetectionTimer", "EnemyList", "ReloadTimer", "LostScreen", "ScenePath", "DamagedRateTimer"]

export var health : float
var is_attacking = false
var vulnerable = true


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(0.1), "timeout")
	tickratetimer = get_parent().get_node(DetectionTimer)
	detector = get_parent().get_node(ItemDetector)
	lostdisplay = get_parent().get_node(LostScreen)
	damagerate = get_parent().get_node(DamageRateTimer)
	lostdisplay.get_node("Respawn").connect("pressed", self, "respawn")
	tickratetimer.connect("timeout", self, "timer_finish")
	damagerate.connect("timeout", self, "startdamage")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Movement.x = 0
	Movement.z = 0
	is_attacking = false
	
	if (Input.is_action_pressed("ui_right")):
		Movement.x = Speed
	if (Input.is_action_pressed("ui_left")):
		Movement.x = -Speed
	if (Input.is_action_pressed("ui_up")):
		Movement.z = Speed
	if (Input.is_action_pressed("ui_down")):
		Movement.z = -Speed
		
	if Input.is_action_just_pressed("Attack"):
		is_attacking = true
		
	if health <= 0:
		lostdisplay.visible = true
		for bodies in EnemyList:
			if get_parent().get_node(bodies) != null:
				get_parent().get_node(bodies).queue_free()
	move_and_slide(Movement)
	pass
	
func timer_finish():
	for bodies in detector.get_overlapping_bodies():
		if EnemyList.has(bodies.name):
			if is_attacking:
				bodies.health -= 10
			elif not is_attacking and vulnerable:
				health -= 10
				vulnerable = false
				damagerate.start()
	pass

func respawn():
	get_tree().change_scene(ScenePath)
	pass
	
func startdamage():
	vulnerable = true
	pass
