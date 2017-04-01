require "Lua.VMInit"
require "Lua.config"
require "Lua.base.global"
require "Lua.base.class"
require "Lua.base.component"
require "Lua.system.system"
require "Lua.std.actor"
require "Lua.std.char"

require "Lua.asset"

player = Char("player");
enemy  = Char("enemy");

print("player=", Val2Str(player));
print("player.meta=", Val2Str(getmetatable(player)));

player.action.flag="balblalba";

print("player=", Val2Str(player));
print("player.meta=", Val2Str(getmetatable(player)));
print("enemy=", Val2Str(enemy));

print("Lua Main");
print(Val2Str(VM.Logic.cmdList))
print("Lua Main");
--CombatD:fight(player, enemy)
print("请立即装备<quad act=blalba a=[木剑] width=3 />  <quad img=xb_b size=250 width=1 />武器")
print("test Image <quad img=xb_b size=40 width=1 />test Imagetest Image <quad img=xb_a size=40 width=1 />test Imagetest Image <quad img=xb_b size=40 width=1 />test Imagetest Image <quad img=xb_a size=40 width=1 />test Imagetest Image <quad img=xb_b size=40 width=1 />test Imagetest Image <quad img=xb_a size=40 width=1 />test Image")
print("<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a111<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a<quad width=0><quad act=blalba a=[木剑] width=3 />a")

map = [[
紅魔館 ===================================================
■■■■■■■■■■■■■■■■■■■■■■■■■■■
■　　　　　　　　　　　　[6] 　　　　　　　　│ [5]■
■　　　　　　　　　　　　　　　　　　　　　　■■■■
■　　　　　　　　　　　　　　　　　　　　　　　　　■
■　　■■■■■■■■■■―■■■■■■■■■■　　■
■　　■　　　│　 [13]　　 ■■<[18] ■ [11] ■　　■
■　　■ [14] ■―■■■■■■■■■　■―■―■　　■
■　　■　　　■　l>　　 [17] 　　<l　■　　　■　　■
■　　■　　　│　￣￣￣】↑【￣￣￣　■　　　■　　■
■　　■■■■■　　　　　　　　　　　■　　　■　　■
■　　■[16]│　　　　　　[9] 　　　　│ [10] ■　　■
■　　■■■■―■■■■■―■■■■■■　　　■　　■
■　　　　■[15]■＿＿　　　　　  ＿＿■　　　■　　■
■　　　　■　　■　 ∥ 木　 木　∥　 ■―■―■　　■
■　　　　■　　■[8]∥ 木[2]木　∥[7]■ [12] ■　　■
■　　　　■■■■　 ∥ 木　 木　∥　 ■■■■■　　■
■　　　　　　　　￣￣　木　 木   ￣￣　　　　　　　■
■■■■　　　　　　　　木　 木 　　　　　　　■■■■
■ [3]│　　　　　　　　　　　 　　　　　　 　│[4] ■
■■■■■■■■■■■●  [1] ●■■■■■■■■■■■

]]
print(map)
map = gsub(map, "%[(%d+)%]", function(id) 
	local s = string.format("<quad act=onMap_%s a=[%s] width=%d />", id, id, #id)
	--print(s);
	return s;
end)
print(map);
function onNewGame()
	pl("<color=red>也暂未实装!!</color>");
	pl("");
	pl("");
	pl("");
	title();
end

function onLoadGame()
	pl("<color=blue>暂未实装!!</color>");
	wait();
	pl("");
	pl("");
	pl("");
	title();
	title();
end
function choice(n)
	pl(n);
	title();
end
function title()
	--cls();
	pl("UniEro");
	pl("Ver 0.000001");
	pl("");
	wait();
	pl("[balbalblablablalb]");
	pl("邪恶正在蔓延...");
	cmd("New Game", "onNewGame");
	cmd("choice 1", "choice");
	cmd("choice 2", choice, 2);
	cmd("Load Game", onLoadGame);
end

--start(title)
--debug.log(Val2Str(VM))