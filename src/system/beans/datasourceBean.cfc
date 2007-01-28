<!-----------------------------------------------------------------------
Copyright 2005 - 2006 ColdBox Framework by Luis Majano
www.coldboxframework.com | www.coldboxframework.org
-------------------------------------------------------------------------
Author 	 :	Luis Majano
Date     :	June 30, 2006
Description :
	I model a coldfusion datasource connection setting.

Modification History:
01/28/2007 - Added the alias property and solved the java contract with correct arg.
----------------------------------------------------------------------->
<cfcomponent name="datasourceBean" hint="I model a datasource connection setting." output="false">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->
	<cfscript>
		variables.instance = structnew();
		variables.instance.name = "";
		variables.instance.alias = "";
		variables.instance.dbtype = "";
		variables.instance.username = "";
	    variables.instance.password = "" ;
	</cfscript>
	
<!------------------------------------------- PUBLIC ------------------------------------------->

	<!--- ************************************************************* --->
	
	<cffunction name="init" access="public" output="false" hint="I build a new datasource bean." returntype="any">
	    <!--- ************************************************************* --->
	    <cfargument name="datasourceStruct" 	type="struct" required="false" default="#structnew()#" hint="The structure holding the name,dbtype,username,and password variables." >
	    <!--- ************************************************************* --->
	    <cfif not structisEmpty(arguments.datasourceStruct)>
		    <cfset setInstance(arguments.datasourceStruct)>
	    </cfif>
	    <cfreturn this >
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="getInstance" access="public" returntype="any" output="false">
		<cfreturn variables.instance >
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="setInstance" access="public" returntype="void" output="false">
		<cfargument name="instance" type="struct" required="true">
		<cfset variables.instance = arguments.instance>
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="setname" access="public" return="void" output="false" hint="Set name of the datasource, this maps to the Coldfusion datasource name">
	  <cfargument name="name" type="string" required="true">
	  <cfset variables.instance.name=arguments.name >
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="getname" access="public" return="string" output="false" hint="Get the name">
	  <cfreturn variables.instance.name >
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="setalias" access="public" return="void" output="false" hint="Set alias of the datasource, this is used for reference to the structure.">
	  <cfargument name="alias" type="string" required="true">
	  <cfset variables.instance.alias=arguments.alias >
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="getalias" access="public" return="string" output="false" hint="Get the alias">
	  <cfreturn variables.instance.name >
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="setDBType" access="public" return="void" output="false" hint="Set DBType">
	  <cfargument name="dbtype" type="string" required="true">
	  <cfset variables.instance.dbtype=arguments.dbtype >
	</cffunction>
	
	<!--- ************************************************************* --->

	<cffunction name="getDBType" access="public" return="string" output="false" hint="Get DBType">
	  <cfreturn variables.instance.dbtype >
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="setUsername" access="public" return="void" output="false" hint="Set Username">
	  <cfargument name="Username" type="string" required="true">
	  <cfset variables.instance.Username=arguments.Username >
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="getUsername" access="public" return="string" output="false" hint="Get Username">
	  <cfreturn variables.instance.Username >
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="setPassword" access="public" return="void" output="false" hint="Set Password">
	  <cfargument name="Password" type="string" required="true" >
	  <cfset variables.instance.Password=arguments.Password >
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="getPassword" access="public" return="string" output="false" hint="Get Password">
	  <cfreturn variables.instance.Password >
	</cffunction>
	
	<!--- ************************************************************* --->

</cfcomponent>