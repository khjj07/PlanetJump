local M={}
local global = {speed=1,target_planet=nil}
function M.set(name,value)
	global[name]=value
end
function M.get(name)
	return global[name]
end
return M