using UnityEngine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

[System.Serializable]
public class Daemon
{
	public virtual int Init(){
		return 0;
	}
	public virtual void UnInit() {}
	public virtual int Update()
	{
		return 1;
	}
	public virtual int FixedUpdate()
	{
		return 1;
	}
}

[System.Serializable]
public class ScriptDaemon : Daemon
{
    public static XLua.LuaEnv L = Logic.L;

	public string daemonName;
	public ScriptDaemon(string daemonName)
	{
		this.daemonName = daemonName;
	}
	public override int Init()
	{
		Logic.L.DoString(string.Format("CallDaemonInit('{0}')", daemonName));
		// todo: get return
		return 1;
	}
	public override void UnInit()
	{
		Logic.L.DoString(string.Format("CallDaemonUnInit('{0}')", daemonName));
	}
	public override int FixedUpdate()
	{
		//Debug.Log (string.Format ("CallDaemonFixedUpdate('{0}')", daemonName));
		Logic.L.DoString(string.Format("CallDaemonFixedUpdate('{0}')", daemonName));
		// todo: get return
		return 1;
	}
}