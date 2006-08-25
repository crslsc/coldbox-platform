<cfcomponent name="ehGeneral" extends="coldbox.system.eventhandler">	<!--- ************************************************************* --->	<cffunction name="init" access="public" returntype="Any" output="false">		<cfset super.init()>		<cfreturn this>	</cffunction>	<!--- ************************************************************* --->	<!--- ************************************************************* --->	<cffunction name="dspHome" access="public" returntype="void" output="false">		<cfscript>		rc.xehGetNews = "ehGeneral.doGetNews";		rc.xehGetNewsClient = "ehGeneral.doGetNewsClientVersion";		rc.xehDeleteNews = "ehGeneral.doClearClientStorageNews";		// Set the View To Display, after Logic		setView("vwHome");		</cfscript>	</cffunction>	<!--- ************************************************************* --->	<!--- ************************************************************* --->	<cffunction name="doGetNews" access="public" returntype="void" output="false">		<cfscript>		var wsObj = getPlugin("webservices").getWsobj("newsfeed");		try{			//call model			rc.newsfeed = wsObj.giveMe_EN(news_number=10);		}		catch(Any e){			//Log Error using logger plugin			getPlugin("logger").logError("Error retrieveing news",e);			//Set message			getPlugin("messagebox").setMessage("error","Error retrieveing news feed. <br><br>Diagnostics:<br>#e.message#<br>#e.detail#");			//Set view and exit			setView("vwHome");			return;		}		//Set a Messagebox for display purposes.		getPlugin("messagebox").setMessage("info","News retrieved and placed in request collection.");		//set the view		setView("vwHome");		</cfscript>	</cffunction>	<!--- ************************************************************* --->	<!--- ************************************************************* --->	<cffunction name="doGetNewsClientVersion" access="public" returntype="void" output="false">		<cfscript>		//Model Call		var wsObj = getPlugin("webservices").getWsobj("newsfeed");		var newsfeed = wsObj.giveMe_EN(news_number=20);		//Using clientStorage plugin to save variables permanently		getPlugin("clientStorage").setVar("newsfeed", newsfeed);		//Set the Messagebox		getPlugin("messagebox").setMessage("info","News retrieved using the clientstorage plugin.");		//Relocate to next Event, we can do this, since the data is in a storage.		setNextEvent("ehGeneral.dspHome");		</cfscript>	</cffunction>	<!--- ************************************************************* --->	<!--- ************************************************************* --->	<cffunction name="doClearClientStorageNews" access="public" returntype="void" output="false">		<cfscript>		//Clear ClientStorage News		getPlugin("clientStorage").deleteVar("newsfeed");		//Set the Messagebox		getPlugin("messagebox").setMessage("info","News deleted from client storage.");		//Relocate to next Event, we can do this, since the data is in a storage.		setNextEvent("ehGeneral.dspHome");		</cfscript>	</cffunction>	<!--- ************************************************************* --->	</cfcomponent>