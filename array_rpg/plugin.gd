tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("Inventory", "Node", preload("res://addons/array_rpg/inventory.gd"), preload("res://addons/array_rpg/backpack15.png"))
	add_custom_type("PlayerCharacter3D", "KinematicBody", preload("res://addons/array_rpg/player3dmovement.gd"), preload("res://addons/array_rpg/running.png"))
	add_custom_type("InventoryItem3D", "StaticBody", preload("res://addons/array_rpg/inventoryitem3d.gd"), preload("res://addons/array_rpg/item.png"))
	add_custom_type("ItemDetector3D", "Area", preload("res://addons/array_rpg/inventorydetection3d.gd"), preload("res://addons/array_rpg/area.png"))
	add_custom_type("NPC", "StaticBody", preload("res://addons/array_rpg/NPCScript.gd"), preload("res://addons/array_rpg/user-talking-with-speech-bubble.png"))
	add_custom_type("Enemy", "KinematicBody", preload("res://addons/array_rpg/EnemyAI.gd"), preload("res://addons/array_rpg/ghost64.png"))
	pass


func _exit_tree():
	remove_custom_type("Inventory")
	remove_custom_type("PlayerCharacter3D")
	remove_custom_type(("InventoryItem3D"))
	remove_custom_type("ItemDetector3D")
	remove_custom_type("NPC")
	remove_custom_type("Enemy")
	pass
