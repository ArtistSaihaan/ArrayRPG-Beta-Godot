extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dialogues = []
var satisfied_dialogues = []


onready var collider
var area_collider : String
var player : String
onready var inventory
var PlayerInventory : String

export var current_dialogue = 0

onready var dialoguesbox
var DialogueBox : String

var thing_needed : String
var Quantity : int

export var Define = ["dialogues", "satisfied_dialogues", "area_collider", "player", "player_inventory", "DialogueBox", "thing_needed", "Quantity"]
var satisfied = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(pause_mode)
	yield(get_tree().create_timer(0.1), "timeout")
	collider = get_parent().get_node(area_collider)
	dialoguesbox = get_parent().get_node(DialogueBox)
	inventory = get_parent().get_node(PlayerInventory)
	yield(get_tree().create_timer(0.1), "timeout")
	collider.connect("area_entered", self, "playercomes")
	pass # Replace with function body.

func playercomes(body):
		if body.get_parent() == get_parent().get_node(player):
			startspeaking()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_processing_input():
		if Input.is_action_just_pressed("next"):
			changedialogue()
	pass

func startspeaking():
	set_process_input(!pause_mode)
	dialoguesbox.visible = true
	current_dialogue = -1
	
	changedialogue()
	pass
	
func changedialogue():
	current_dialogue += 1
	
	if inventory.playerinventory.has(thing_needed) and inventory.playerinventory.count(thing_needed) >= Quantity or satisfied:
		if current_dialogue >= len(satisfied_dialogues):
			dialoguesbox.visible = false
			current_dialogue = 0
			satisfied = true
			var removeit = inventory.playerinventory.find(thing_needed)
			for x in Quantity:
				if removeit != null:
					inventory.playerinventory.remove(removeit)
					inventory.playerinventory.append(null)
			set_process_input(pause_mode)
		else:
			dialoguesbox.get_node("Dialogue").text = satisfied_dialogues[current_dialogue]
	
	else:
		if current_dialogue >= len(dialogues):
			dialoguesbox.visible = false
			current_dialogue = 0
			set_process_input(pause_mode)
		
		elif not satisfied:
			dialoguesbox.get_node("Dialogue").text = dialogues[current_dialogue]
	pass
