local S = {}
local color = require("color-lib.color")
local defui= require "defui.defui"
local defrx= require "defrx.defrx"
local box = require "defui.module.node"
local COLOR = {
	"#7dff01",
	"#02ff00",
	"#02ff7d",
	"#02ffff",
	"#00c8ff",
	"#007dff",
	"#0000ff",
	"#7d00ff",
	"#b900ff",
	"#ff00ff",
	"#ff007c",
	"#ff0000",
	"#fe4a01",
	"#fe7d00",
	"#feb900",
	"#ffffff",
	"#afafaf",
	"#5a5a5a",
	"#000000",
	"#7d7d00",
	"#649500",
	"#4aaf00",
	"#009500",
	"#02af4b",
	"#009564",
	"#007d7d",
	"#006496",
	"#004aaf",
	"#000095",
	"#4b00af",
	"#640096",
	"#7d007c",
	"#960063",
	"#af004a",
	"#960000",
	"#953200",
	"#af4b00",
	"#956400",
	"#fe7d7c",
	"#7dffaf",
	"#7d7dff",
}
local TRAIL = {
	"particle_blob",
	"circle_01",
	"circle_02",
	"circle_05",
	"fire_01",
	"magic_01",
	"magic_02",
	"magic_03",
	"magic_04",
	"magic_05",
	"scorch_01",
	"spark_02",
	"star_01",
	"star_02",
	"star_03",
	"star_04",
	"star_05",
	"star_06",
	"star_07",
	"star_08",
	"star_09",
	"symbol_01",
	"symbol_02",
	"window_04"
}
local TRAIL_PROP={
	"#trail1",
	"#trail2",
	"#trail3",
	"#trail4",
	"#trail5",
	"#trail6",
	"#trail7",
	"#trail8",
	"#trail9",
	"#trail10",
	"#trail11",
	"#trail12",
	"#trail13",
	"#trail14",
	"#trail15",
	"#trail16",
	"#trail17",
	"#trail18",
	"#trail19",
	"#trail20",
	"#trail21",
	"#trail22",
	"#trail23",
	"#trail24"
}


local function button_pressed(self,action_id,action,button)
	self.pressed_button=button
	self.pressed_button_scale=button:get_scale()
	button:set_scale(button:get_scale()*0.8)
end

local function color_pick(self,action_id,action,button)
	if self.node["store/clip"]:pick_node(action.x,action.y,0) and self.pressed_button==button then
		self.trail_color=button.child[1]:get_color()
		self.node["store/color_picker"]:set_parent(button)
		self.node["title/flag_icon"]:set_color(self.trail_color)
		self.node["ingame/flag_icon"]:set_color(self.trail_color)
		self.node["game_over/flag_icon"]:set_color(self.trail_color)
		self.node["store/flag_icon"]:set_color(self.trail_color)
		defrx.notify("trail_color",{color=self.trail_color,i=button.i,j=button.j})
		sound.play("#equip")
	end
end


local function trail_pick(self,action_id,action,button)
	--self.color_picked = button
	if self.node["store/clip1"]:pick_node(action.x,action.y,0) and self.pressed_button==button then
		self.trail_shape=button.prop
		self.node["store/trail_picker"]:set_parent(button)
		defrx.notify("trail_shape",{shape=self.trail_shape,i=button.i,j=button.j})
		sound.play("#equip")
	end
end


function store_init(self)
	for i = 1, #COLOR, 4 do
		local clone = gui.clone_tree(self.node["store/line"].id)
		local line = box.create(clone["store/line"], self.node["store/color_content"])
		local slot1 =box.create(clone["store/slot1"], line)
		local slot2 =box.create(clone["store/slot2"], line)
		local slot3 =box.create(clone["store/slot3"], line)
		local slot4 =box.create(clone["store/slot4"], line)
		local color1 =box.create(clone["store/color1"], slot1)
		local color2 =box.create(clone["store/color2"], slot2)
		local color3 =box.create(clone["store/color3"], slot3)
		local color4 =box.create(clone["store/color4"], slot4)
		defui.create_button(self, "slot"..i.."_1", slot1, {pressed=button_pressed,released=color_pick})
		self.button["slot"..i.."_1"].i=i
		self.button["slot"..i.."_1"].j=1
		defui.create_button(self, "slot"..i.."_2", slot2, {pressed=button_pressed,released=color_pick})
		self.button["slot"..i.."_2"].i=i
		self.button["slot"..i.."_2"].j=2
		defui.create_button(self, "slot"..i.."_3", slot3, {pressed=button_pressed,released=color_pick})
		self.button["slot"..i.."_3"].i=i
		self.button["slot"..i.."_3"].j=3
		defui.create_button(self, "slot"..i.."_4", slot4, {pressed=button_pressed,released=color_pick})
		self.button["slot"..i.."_4"].i=i
		self.button["slot"..i.."_4"].j=4

		
		if COLOR[i] then
			color1:set_color(color.set(COLOR[i].."ff"))
		end
		if COLOR[i+1] then
			color2:set_color(color.set(COLOR[i+1].."ff"))
		end
		if COLOR[i+2] then
			color3:set_color(color.set(COLOR[i+2].."ff"))
		end
		if COLOR[i+3] then
			color4:set_color(color.set(COLOR[i+3].."ff"))
		end
		line:set_position(self.node["store/line"]:get_position()+vmath.vector3(0,-100*math.floor(i/4),0))
	end
	self.node["store/line"]:set_position(vmath.vector3(0,1000,0))

	
	for i = 1, #TRAIL, 4 do
		local clone = gui.clone_tree(self.node["store/line_trail"].id)
		local line = box.create(clone["store/line_trail"], self.node["store/trail_content"])
		local slot1 =box.create(clone["store/slot1_trail"], line)
		local slot2 =box.create(clone["store/slot2_trail"], line)
		local slot3 =box.create(clone["store/slot3_trail"], line)
		local slot4 =box.create(clone["store/slot4_trail"], line)
		local trail1 =box.create(clone["store/trail1"], slot1)
		local trail2 =box.create(clone["store/trail2"], slot2)
		local trail3 =box.create(clone["store/trail3"], slot3)
		local trail4 =box.create(clone["store/trail4"], slot4)
		defui.create_button(self, "trail_slot"..i.."_1", slot1, {pressed=button_pressed,released=trail_pick})
		self.button["trail_slot"..i.."_1"].i=i
		self.button["trail_slot"..i.."_1"].j=1
		defui.create_button(self, "trail_slot"..i.."_2", slot2, {pressed=button_pressed,released=trail_pick})
		self.button["trail_slot"..i.."_2"].i=i
		self.button["trail_slot"..i.."_2"].j=2
		defui.create_button(self, "trail_slot"..i.."_3", slot3, {pressed=button_pressed,released=trail_pick})
		self.button["trail_slot"..i.."_3"].i=i
		self.button["trail_slot"..i.."_3"].j=3
		defui.create_button(self, "trail_slot"..i.."_4", slot4, {pressed=button_pressed,released=trail_pick})
		self.button["trail_slot"..i.."_4"].i=i
		self.button["trail_slot"..i.."_4"].j=4
		if TRAIL[i] then
			trail1:change_texture(TRAIL[i])
			self.button["trail_slot"..i.."_1"].prop=TRAIL_PROP[i]
		end
		if TRAIL[i+1] then
			trail2:change_texture(TRAIL[i+1])
			self.button["trail_slot"..i.."_2"].prop=TRAIL_PROP[1+i]
			
		end
		if TRAIL[i+2] then
			trail3:change_texture(TRAIL[i+2])
			self.button["trail_slot"..i.."_3"].prop=TRAIL_PROP[2+i]
			
		end
		if TRAIL[i+3] then
			trail4:change_texture(TRAIL[i+3])
			self.button["trail_slot"..i.."_4"].prop=TRAIL_PROP[3+i]
		end
		line:set_position(self.node["store/line_trail"]:get_position()+vmath.vector3(0,-100*math.floor(i/4),0))
	end
	self.node["store/line_trail"]:set_position(vmath.vector3(0,1000,0))
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
	defrx.create_stream("trail_initialize")
	defrx.observe(self, "trail_initialize", function(self, message_id, message, sender)
		local color = "slot"..message.color.i.."_"..message.color.j
		local shape = "trail_slot"..message.shape.i.."_"..message.shape.j
		self.node["store/color_picker"]:set_parent(self.button[color])
		self.node["store/trail_picker"]:set_parent(self.button[shape])
		self.trail_color=self.button[color].child[1]:get_color()
		self.node["title/flag_icon"]:set_color(self.trail_color)
		self.node["ingame/flag_icon"]:set_color(self.trail_color)
		self.node["game_over/flag_icon"]:set_color(self.trail_color)
		self.node["store/flag_icon"]:set_color(self.trail_color)
		self.trail_shape=self.button[shape].prop
		defrx.notify("trail_color",{color=self.trail_color,i=message.color.i,j=message.color.j})
		defrx.notify("trail_shape",{shape=self.trail_shape,i=message.shape.i,j=message.shape.j})
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