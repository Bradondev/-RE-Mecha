extends Resource
class_name UnitPart


signal PartDestroyed
var Durability: int=1 # Health of the part
var Destroyed: bool = false
enum Rartiy{Common,Rare,Epic}
@export_category("Properties")
@export var RartiyType: Rartiy
@export var NameOfPart: String
@export var PartTexture: Texture2D
@export var Passives:Array[Resource] 


func  Damaged(Dealer: BattleUnit, Amount: int, Part:String)->void:
	if Part != get_class(): return
	
	Durability =-1
	
	if Durability < 0:
		Destroyed = true
		emit_signal("PartDestroyed")
		
