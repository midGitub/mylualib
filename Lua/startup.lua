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
CombatD:fight(player, enemy)

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