local G={}
local node = require "defui.module.node"
function G.init(self)
	self.node={}
	self.node["box"]=node.create(gui.get_node("box"),nil)
	self.node["left_hand"]=node.create(gui.get_node("left_hand"),self.node["box"])
	self.node["right_hand"]=node.create(gui.get_node("right_hand"),self.node["box"])
	self.node["uni"]=node.create(gui.get_node("uni"),self.node["box"])
	self.node["games"]=node.create(gui.get_node("games"),self.node["box"])
end
return G