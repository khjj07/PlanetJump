local G={}
local box_node = require "DefUtil.DefUI.module.box_node"
local text_node = require "DefUtil.DefUI.module.text_node"
function G.init(self)
	self.node={}
	self.box_node={}
	self.text_node={}
	self.node["start"]=box_node.create(gui.get_node("start"),nil)
	self.box_node=self.node["start"]
end
return G