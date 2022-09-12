local S = {}
local color = require("color-lib.color")
local defui= require "defui.defui"
local defrx= require "defrx.defrx"
local box = require "defui.module.node"

local function button_pressed(self,action_id,action,button)
	self.pressed_button=button
	self.pressed_button_scale=button:get_scale()
	button:set_scale(button:get_scale()*0.8)
end

function store_init(self)
	
	self.skin_cursor=1
	self.equiped=1
	defrx.create_stream("skin_data")
	defrx.observe(self, "skin_data", function(self, message_id, message, sender)
		self.skin_data=message
		skin_apply(self)
	end)
	defrx.create_stream("set_skin_cursor")
	defrx.observe(self, "set_skin_cursor", function(self, message_id, message, sender)
		self.skin_cursor=message.num
	end)

	
end

function skin_apply(self)
	self.skin={}
	if self.skin_cursor ==0 then
		self.skin_cursor=#self.skin_data
	end
	if self.skin_cursor >#self.skin_data then
		self.skin_cursor =1
	end
	self.skin[1]=self.skin_data[self.skin_cursor].name
	
	if self.skin_cursor+1 == #self.skin_data+1 then
		self.skin[2]=self.skin_data[1].name
	else
		self.skin[2]=self.skin_data[self.skin_cursor+1].name
	end
	
	if self.skin_cursor+2 == #self.skin_data+1 then
		self.skin[3]=self.skin_data[1].name
	elseif self.skin_cursor+2 == #self.skin_data+2 then
		self.skin[3]=self.skin_data[2].name
	else
		self.skin[3]=self.skin_data[self.skin_cursor+2].name
	end
	
	if self.skin_cursor-2 == 0 then
		self.skin[4]=self.skin_data[#self.skin_data].name
	elseif self.skin_cursor-2 == -1 then
		self.skin[4]=self.skin_data[#self.skin_data-1].name
	else
		self.skin[4]=self.skin_data[self.skin_cursor-2].name
	end
	
	if self.skin_cursor-1 == 0 then
		self.skin[5]=self.skin_data[#self.skin_data].name
	else
		self.skin[5]=self.skin_data[self.skin_cursor-1].name
	end
	if self.skin_data[self.skin_cursor].own then
		self.node["store/price"]:set_text("OWN")
		if  self.skin_data[self.skin_cursor].equip then
			self.node["store/tap_to_buy"]:set_text("EQUIPED")
			self.node["store/tap_to_buy"]:set_color(vmath.vector3(1,1,0,1))
		else
			self.node["store/tap_to_buy"]:set_text("TAP TO EQUIP")
			self.node["store/tap_to_buy"]:set_color(vmath.vector3(0,0,0,1))
		end
	else
		self.node["store/price"]:set_text(self.skin_data[self.skin_cursor].price)
		self.node["store/tap_to_buy"]:set_text("TAP TO BUY")
	end
	for i = 1, 5 do
		self.node["store/player"..i]:change_texture(self.skin[i])
	end
end

return S