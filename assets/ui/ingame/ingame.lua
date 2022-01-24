local G={}
local box_node = require "DefUtil.DefUI.module.box_node"
local text_node = require "DefUtil.DefUI.module.text_node"
function G.init(self)
	self.node={}
	self.box_node={}
	self.text_node={}
	self.node["tap_to_start"]=text_node.create(gui.get_node("tap_to_start"),nil)
	self.node["title"]=text_node.create(gui.get_node("title"),nil)
	self.node["option_btn"]=box_node.create(gui.get_node("option_btn"),nil)
	self.node["developers_btn"]=box_node.create(gui.get_node("developers_btn"),nil)
	self.node["pause_btn"]=box_node.create(gui.get_node("pause_btn"),nil)
	self.node["pause_menu_window"]=box_node.create(gui.get_node("pause_menu_window"),nil)
	self.node["menu_title"]=text_node.create(gui.get_node("menu_title"),self.node["pause_menu_window"])
	self.node["pause_menu_window_exit_btn"]=box_node.create(gui.get_node("pause_menu_window_exit_btn"),self.node["pause_menu_window"])
	self.node["continue_text"]=text_node.create(gui.get_node("continue_text"),nil)
	self.node["home_text"]=text_node.create(gui.get_node("home_text"),nil)
	self.node["game_over_text"]=text_node.create(gui.get_node("game_over_text"),nil)
	self.node["option_window"]=box_node.create(gui.get_node("option_window"),nil)
	self.node["bgm_gauge"]=box_node.create(gui.get_node("bgm_gauge"),self.node["option_window"])
	self.node["bgm_text"]=text_node.create(gui.get_node("bgm_text"),self.node["bgm_gauge"])
	self.node["bgm_btn"]=box_node.create(gui.get_node("bgm_btn"),self.node["bgm_gauge"])
	self.node["sfx_gauge"]=box_node.create(gui.get_node("sfx_gauge"),self.node["option_window"])
	self.node["sfx_text"]=text_node.create(gui.get_node("sfx_text"),self.node["sfx_gauge"])
	self.node["sfx_btn"]=box_node.create(gui.get_node("sfx_btn"),self.node["sfx_gauge"])
	self.node["setting"]=text_node.create(gui.get_node("setting"),self.node["option_window"])
	self.node["option_window_exit_btn"]=box_node.create(gui.get_node("option_window_exit_btn"),self.node["option_window"])
	self.node["credits_window"]=box_node.create(gui.get_node("credits_window"),nil)
	self.node["credits"]=text_node.create(gui.get_node("credits"),self.node["credits_window"])
	self.node["credits_window_exit_btn"]=box_node.create(gui.get_node("credits_window_exit_btn"),self.node["credits_window"])
	self.node["members"]=text_node.create(gui.get_node("members"),self.node["credits_window"])
	self.node["score"]=text_node.create(gui.get_node("score"),nil)
	self.node["combo"]=text_node.create(gui.get_node("combo"),nil)
end
return G