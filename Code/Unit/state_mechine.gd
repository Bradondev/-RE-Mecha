extends Node

class_name  UnitStateMachine
@export var initial_state : UnitState
var current_state :UnitState
var states : Dictionary ={}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child :
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
			
	if initial_state:
		initial_state.Enter()
		current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.Update(delta)
func  _physics_process(delta: float) -> void:
	if current_state:
		current_state.Physics_Update(delta)
func Action():
	if current_state:
		current_state.Action()



func on_child_transition(state, new_state_name):
	if state != current_state:
		return
		
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	current_state = new_state
