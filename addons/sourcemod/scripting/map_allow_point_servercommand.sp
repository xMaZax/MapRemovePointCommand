#define MY_VERSION "1.0"

bool g_bAllowPointServerCommand;

public Plugin myinfo =  {
	name = "[MAP] - Remove (point_servercommand)", 
	description = "Return Cvar \"sv_allow_point_servercommand\"", 
	version = MY_VERSION, 
	author = "MaZa", 
	url = "vk.com/id156040107 & STEAM_1:0:84111 & hotstar-project.net"
};

public void OnPluginStart()
{
	ConVar hCvar;
	hCvar = CreateConVar("sv_allow_point_servercommand", "0", "Разрешать карте использовать point_servercommand");
	hCvar.AddChangeHook(view_as<ConVarChanged>(ChangeHookPointServerCommand)); g_bAllowPointServerCommand = hCvar.BoolValue;
}

public void OnEntityCreated(int iEntity, const char[] sClassname)
{
	if (!g_bAllowPointServerCommand && strcmp(sClassname, "point_servercommand") == 0)
	{
		if (iEntity && IsValidEntity(iEntity))
		{
			RemoveEntity(iEntity);
		}
	}
}

void ChangeHookPointServerCommand(ConVar hCvar)
{
	g_bAllowPointServerCommand = hCvar.BoolValue;
} 