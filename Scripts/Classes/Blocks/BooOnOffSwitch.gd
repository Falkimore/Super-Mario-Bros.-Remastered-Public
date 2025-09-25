extends Block

var active := false

static var has_hit := false

func vanilla_1472206251__ready() -> void:
	can_hit = true
	has_hit = false

func vanilla_1472206251_on_block_hit() -> void:
	if can_hit == false or has_hit:
		return
	has_hit = true
	AudioManager.play_sfx("switch", global_position)
	can_hit = false
	get_tree().call_group("BooBlocks", "on_switch_hit")
	await get_tree().create_timer(0.25, false).timeout
	can_hit = true
	has_hit = false

func vanilla_1472206251_on_switch_hit() -> void:
	active = not active
	if active:
		$Sprite.play("On")
	else:
		$Sprite.play("Off")

func vanilla_1472206251_on_boo_hit() -> void:
	if active:
		return
	AudioManager.play_global_sfx("switch")
	get_tree().call_group("BooBlocks", "on_switch_hit")


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1472206251__ready, [], 4291064671)
	else:
		vanilla_1472206251__ready()


func on_block_hit():
	if _ModLoaderHooks.any_mod_hooked:
		await _ModLoaderHooks.call_hooks_async(vanilla_1472206251_on_block_hit, [], 1642620406)
	else:
		await vanilla_1472206251_on_block_hit()


func on_switch_hit():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1472206251_on_switch_hit, [], 1711886685)
	else:
		vanilla_1472206251_on_switch_hit()


func on_boo_hit():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1472206251_on_boo_hit, [], 3033350827)
	else:
		vanilla_1472206251_on_boo_hit()
