extends StaticBody2D

@export var active := false

@onready var start_active = not active

var player_in_area := false

var player_stuck := false

var awaiting_exit := false

@export var hurtbox: CollisionShape2D = null

func vanilla_3918401540_on_switch_hit() -> void:
	player_stuck = false
	active = not active
	if player_in_area:
		player_stuck = true
		return
	update()

func vanilla_3918401540_update() -> void:
	if active:
		$Sprite.play("On")
	else:
		$Sprite.play("Off")
	$Collision.set_deferred("disabled", not active)
	if hurtbox != null:
		hurtbox.set_deferred("disabled", not active)

func vanilla_3918401540_damage_player(player: Player) -> void:
	player.damage()

func vanilla_3918401540_on_player_entered(_player: Player) -> void:
	player_in_area = true


func vanilla_3918401540_on_player_exited(_player: Player) -> void:
	player_in_area = false
	if player_stuck and active:
		player_stuck = false
		update()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func on_switch_hit():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3918401540_on_switch_hit, [], 244421718)
	else:
		vanilla_3918401540_on_switch_hit()


func update():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3918401540_update, [], 1288818407)
	else:
		vanilla_3918401540_update()


func damage_player(player: Player):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3918401540_damage_player, [player], 12293743)
	else:
		vanilla_3918401540_damage_player(player)


func on_player_entered(_player: Player):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3918401540_on_player_entered, [_player], 496258803)
	else:
		vanilla_3918401540_on_player_entered(_player)


func on_player_exited(_player: Player):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3918401540_on_player_exited, [_player], 547120047)
	else:
		vanilla_3918401540_on_player_exited(_player)
