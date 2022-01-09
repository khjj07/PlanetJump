local G={}
local box_node = require "DefUtil.DefUI.module.box_node"
local text_node = require "DefUtil.DefUI.module.text_node"
function G.init(self)
	self.node={}
	self.box_node={}
	self.text_node={}
	self.node["tap_to_start"]=text_node.create(gui.get_node("tap_to_start"),nil)
	self.text_node=self.node["tap_to_start"]
end
return G