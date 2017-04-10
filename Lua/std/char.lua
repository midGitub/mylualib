require "Lua.std.actor"

Char = class(Actor, {
	name = "Char",
	desc = "this is a Char",
	_ctor = function (self, name)
		self.name = name;
		print("Char:_ctor")
		Actor._ctor(self);
		self.dbase = self:AddComponent("dbase");
		self.skill_list = self:AddComponent("skill_list");
		self.action = self:AddComponent("action");
		self:AddComponent("moveable");
		self:AddComponent("interactive")
	end,
})

function Char:dead()
	if self.dbase.hp <= 0 then return 1 end
end

function Char:look()
	return self:lookRoom()
end

function Char:lookRoom()
	local room = self:getCurrentRoom();
	local msg = room:onLook(self)
	print(msg);
end

function Char:link()
	return link(self.name, format("Char_onTalk(%d)", self.id))
end

function Char:onTalk()
	print("基本对话");
end
function Char_onTalk(id)
	local char = ActorMgr:Get(id)
	char:onTalk();
end
