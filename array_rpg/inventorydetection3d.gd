extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var PlayerInventory : String

onready var Inventory = null

export var define = ["PlayerInventory"]


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(0.1), "timeout")
	connect("body_entered", self, "oncollide")
	Inventory = get_parent().get_parent().get_node(PlayerInventory)
	pass # Replace with function body.

func oncollide(body):
	if body is Item:
		for x in body.Quantity:
			if (Inventory.playerinventory[0] == null):
				Inventory.playerinventory.insert(0, body.ItemName)
				Inventory.playerinventory.remove(10)
			elif (Inventory.playerinventory[0] != null and Inventory.playerinventory[1] == null):
				Inventory.playerinventory.insert(1, body.ItemName)
				Inventory.playerinventory.remove(10)
			elif (Inventory.playerinventory[1] != null and Inventory.playerinventory[2] == null):
				Inventory.playerinventory.insert(2, body.ItemName)
				Inventory.playerinventory.remove(10)
			elif Inventory.playerinventory[2] != null and Inventory.playerinventory[3] == null:
				Inventory.playerinventory.insert(3, body.ItemName)
				Inventory.playerinventory.remove(10)
			elif Inventory.playerinventory[3] != null and Inventory.playerinventory[4] == null:
				Inventory.playerinventory.insert(4, body.ItemName)
				Inventory.playerinventory.remove(10)
			elif Inventory.playerinventory[4] != null and Inventory.playerinventory[5] == null:
				Inventory.playerinventory.insert(5, body.ItemName)
				Inventory.playerinventory.remove(10)
			elif Inventory.playerinventory[5] != null and Inventory.playerinventory[6] == null:
				Inventory.playerinventory.insert(6, body.ItemName)
				Inventory.playerinventory.remove(10)
			elif Inventory.playerinventory[6] != null and Inventory.playerinventory[7] == null:
				Inventory.playerinventory.insert(7, body.ItemName)
				Inventory.playerinventory.remove(10)
			elif Inventory.playerinventory[7] != null and Inventory.playerinventory[8] == null:
				Inventory.playerinventory.insert(8, body.ItemName)
				Inventory.playerinventory.remove(10)
			elif Inventory.playerinventory[8] != null and Inventory.playerinventory[9] == null:
				Inventory.playerinventory.insert(9, body.ItemName)
				Inventory.playerinventory.remove(10)
			elif Inventory.playerinventory[9] != null:
				print("No space left in the Inventory")
			

pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

