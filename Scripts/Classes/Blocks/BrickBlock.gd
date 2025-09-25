class_name BrickBlock
extends Block

var ticking_down := false

func vanilla_1465005495__ready() -> void:
	if item_amount == 10 and item.resource_path == "res://Scenes/Prefabs/Entities/Items/SpinningCoin.tscn" and is_instance_valid(Global.level_editor) == false:
		Global.log_warning("Coin Brick Block is wrong! please report!: " + name)

func vanilla_1465005495_check_brick_empty() -> void:
	$PSwitcher.enabled = item == null

func vanilla_1465005495_on_block_hit(player: Player) -> void:
	if player.power_state.hitbox_size == "Big":
		if item == null:
			await get_tree().physics_frame
			destroy()
			Global.score += 50
	if item != null:
		if mushroom_if_small:
			item = player_mushroom_check(player)
		dispense_item()

func vanilla_1465005495_on_shell_block_hit(_shell: Shell) -> void:
	if item == null:
		await get_tree().physics_frame
		destroy()
		Global.score += 50
	else:
		dispense_item()

func vanilla_1465005495_set_coin_count() -> void:
	item_amount = 2


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1465005495__ready, [], 3358157931)
	else:
		vanilla_1465005495__ready()


func check_brick_empty():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1465005495_check_brick_empty, [], 1755365165)
	else:
		vanilla_1465005495_check_brick_empty()


func on_block_hit(player: Player):
	if _ModLoaderHooks.any_mod_hooked:
		await _ModLoaderHooks.call_hooks_async(vanilla_1465005495_on_block_hit, [player], 3860789250)
	else:
		await vanilla_1465005495_on_block_hit(player)


func on_shell_block_hit(_shell: Shell):
	if _ModLoaderHooks.any_mod_hooked:
		await _ModLoaderHooks.call_hooks_async(vanilla_1465005495_on_shell_block_hit, [_shell], 269218009)
	else:
		await vanilla_1465005495_on_shell_block_hit(_shell)


func set_coin_count():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1465005495_set_coin_count, [], 3423246003)
	else:
		vanilla_1465005495_set_coin_count()
