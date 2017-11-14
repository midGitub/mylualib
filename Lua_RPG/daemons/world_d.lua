local world_d = daemon_base("地图精灵")

function world_d:Init( )
	print("world Init ")
	daemon_base.Init(self);
	self:loadAllRooms()
	self.rooms = {}
end
function world_d:loadAllRooms()
	local room_templates = {}
	ff_GetTabFileTableEx("settings\\rooms.csv", 2, {
		tonumber,-- id	
		nil,-- path	
		nil,-- name	
		nil,-- desc	
		nil,-- exits	
		nil,-- objects	
		nil,-- actions
	}, function (tLine)
		if tLine.name ~= "" then
			room_templates[tLine.path] = tLine;
		end
	end, ',')
	ppt(room_templates)
	self.room_templates = room_templates;
end

function world_d:move(actor, room)
	if type(room) == 'string' then
		room = self:loadRoom(room);
	end
	print("move to ", Val2Str(room))
	local place = actor:GetComponent("place");
	if place.env then
		place.env:removeActor(actor)
	end
	place:leaveEnv();
	local env = room:GetComponent("room_env");
	ppt(getmetatable(env))
	place:enterEnv(env);
	env:addActor(actor)
	self:look(actor)
end

function world_d:loadRoom(roomPath)
	if self.rooms[roomPath] then
		return self.rooms[roomPath]
	end
	local template = self.room_templates[roomPath];
	local room = PERFAB_D:spawnPerfab("std_room")

	self:setup(room, template)
	self.rooms[roomPath] = room;
	return room;
end

function world_d:setup(room, template)
	room.name = template.name;
end

function world_d:look(actor)
	local place = actor:GetComponent("place");
	local env = place.env;
	ppt(env);
	if not env.actor then
		return print("你周围雾蒙蒙的,什么也看不清!");
	end
	local room = env.actor;
	ppt(room);

	local msg = "[" .. room.name .. ']';
	msg = msg .. "\n".. (room.desc or "");

	--msg = msg .. self.placement:onLook();
	msg = msg.."\n这里有:\n"
	for k, char in pairs(env.objects) do
		print(k, Val2Str(char))
		print(k, Val2Str(getmetatable(char)))
		msg = msg .. self:link(char).. ", "
	end

	--msg = msg .."\n" .. self:lookExits();
	if not self.exits then 
		msg = msg.. "这里没有明显的出口..." 
	else
		local msg = msg .. "这里的出口有:"
		for exit, path in pairs(self.exits) do
			msg = msg .. link(exit, format("placement_onExit('%s')", exit)) .. ","
		end
	end

	--msg = msg .. self:lookFacility();
	--msg = msg .. RoomSys:showAction(self);

	print(msg);
	cmd("移动", self.showmap)
	return msg;
end

function world_d:link(char)
	return link(char.name, format("Char_onTalk(%d)", char:getID()))
end

function world_d.showmap()
	print("showmap")
	local msg = require ("world.xiangyang")
	print(msg)
end

return world_d;