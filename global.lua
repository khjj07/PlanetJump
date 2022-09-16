local M={}
local global = {speed=1,target_planet=nil,color=vmath.vector4(1,1,1,1)}
function M.set(name,value)
	global[name]=value
end
function M.get(name)
	return global[name]
end
function M.reset()
	global={speed=1,target_planet=nil,color=vmath.vector4(1,1,1,1)}
end
return M