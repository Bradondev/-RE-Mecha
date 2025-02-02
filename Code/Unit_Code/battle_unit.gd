extends Node2D
class_name BattleUnit

signal Damaged(Dealer: BattleUnit, Amount: int, Part:UnitPart)
var DicOfPart : Dictionary = {
	0:"Core",
	1:"UnitBottom",
	2: "Head",
	3: "Weapon"
}

@export_category("Unit Parts Resource")
@export var CORE:  Core
@export var BOTTOM: UnitBottom
@export var HEAD: Head
@export var WEAPON: Weapon


@export_category("Node Reference")
@export var core: AnimatedSprite2D 
@export  var head: AnimatedSprite2D 
@export  var weapon: AnimatedSprite2D 
@export  var bottom: AnimatedSprite2D 

@export_category("StateMechine Reference")
@export var state_mechine: UnitStateMachine 
@export var unit_attack_state: UnitAttackState 
@export var unit_move_state: UnitMoveState 

func _ready() -> void:
	pass # Replace with function body.

func  ConnectPart()->void:
	Damaged.connect(CORE.Damaged)
	Damaged.connect(BOTTOM.Damaged)
	Damaged.connect(WEAPON.Damaged)
	Damaged.connect(HEAD.Damaged)
	
func  EnterBattle()->void:
	pass

func Damage(Dealer: BattleUnit, Amount: int, Part:String)->void:
	emit_signal("Damaged", Dealer, Amount, Part)
