print("girl1")
require "Lua.std.char"
print("girl2")
local girl = Char("美女");
print("girl3")

function girl:setup()
	self.name = "美女";
	self:setHouse("xiangyang.xiangyang_city");
end

function girl:onTalk()
	print("girl对话");
end

return girl;
