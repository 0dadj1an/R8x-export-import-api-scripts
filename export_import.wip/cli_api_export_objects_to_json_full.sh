#!/bin/bash
#
# SCRIPT Object export to JSON (full details) file for API CLI Operations
#
ScriptVersion=00.28.00
ScriptDate=2018-04-25

#

export APIScriptVersion=v00x28x00
ScriptName=cli_api_export_objects_to_json_full

# =================================================================================================
# =================================================================================================
# START script
# =================================================================================================
# =================================================================================================


# MODIFIED 2018-03-05 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# =================================================================================================
# -------------------------------------------------------------------------------------------------
# START Initial Script Setup
# -------------------------------------------------------------------------------------------------


echo
echo 'Script:  '$ScriptName'  Script Version: '$APIScriptVersion

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-05

# MODIFIED 2018-03-05 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# Handle important basics
# -------------------------------------------------------------------------------------------------

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-05

# MODIFIED 2018-03-05 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

#points to where jq is installed
#Apparently MDM, MDS, and Domains don't agree on who sets CPDIR, so better to check!
#export JQ=${CPDIR}/jq/jq
if [ -r ${CPDIR}/jq/jq ] 
then
    export JQ=${CPDIR}/jq/jq
elif [ -r /opt/CPshrd-R80/jq/jq ]
then
    export JQ=/opt/CPshrd-R80/jq/jq
else
    echo "Missing jq, not found in ${CPDIR}/jq/jq or /opt/CPshrd-R80/jq/jq"
    exit 1
fi

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-05

# MODIFIED 2018-03-05 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

export currentapisslport=$(clish -c "show web ssl-port" | cut -d " " -f 2)

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-05

# MODIFIED 2018-03-05 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

export minapiversionrequired=1.0

getapiversion=$(mgmt_cli show api-versions --format json -r true --port $currentapisslport | $JQ '.["current-version"]' -r)
export checkapiversion=$getapiversion
if [ $checkapiversion = null ] ; then
    # show api-versions does not exist in version 1.0, so it fails and returns null
    currentapiversion=1.0
else
    currentapiversion=$checkapiversion
fi

echo 'API version = '$currentapiversion

if [ $(expr $minapiversionrequired '<=' $currentapiversion) ] ; then
    # API is sufficient version
    echo
else
    # API is not of a sufficient version to operate
    echo
    echo 'Current API Version ('$currentapiversion') does not meet minimum API version requirement ('$minapiversionrequired')'
    echo
    echo '! termination execution !'
    echo
    exit 250
fi

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-05

# MODIFIED 2018-03-05 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

if [ -z $APISCRIPTVERBOSE ] ; then
    # Verbose mode not set from shell level
    echo "!! Verbose mode not set from shell level"
    export APISCRIPTVERBOSE=false
    echo
elif [ x"`echo "$APISCRIPTVERBOSE" | tr '[:upper:]' '[:lower:]'`" = x"false" ] ; then
    # Verbose mode set OFF from shell level
    echo "!! Verbose mode set OFF from shell level"
    export APISCRIPTVERBOSE=false
    echo
elif [ x"`echo "$APISCRIPTVERBOSE" | tr '[:upper:]' '[:lower:]'`" = x"true" ] ; then
    # Verbose mode set ON from shell level
    echo "!! Verbose mode set ON from shell level"
    export APISCRIPTVERBOSE=true
    echo
    echo 'Script :  '$0
    echo 'Verbose mode enabled'
    echo
else
    # Verbose mode set to wrong value from shell level
    echo "!! Verbose mode set to wrong value from shell level >"$APISCRIPTVERBOSE"<"
    echo "!! Settting Verbose mode OFF, pending command line parameter checking!"
    export APISCRIPTVERBOSE=false
    echo
fi

export APISCRIPTVERBOSECHECK=true

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-05

# MODIFIED 2018-03-05 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# END Initial Script Setup
# -------------------------------------------------------------------------------------------------
# =================================================================================================

#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/-  MODIFIED 2017-08-28


# -------------------------------------------------------------------------------------------------
# Root script declarations
# -------------------------------------------------------------------------------------------------

# ADDED 2017-07-21 -\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

export script_use_publish="false"

export script_use_export="true"
export script_use_import="false"
export script_use_delete="false"

export script_dump_standard="false"
export script_dump_full="true"
export script_dump_csv="false"

export script_use_csvfile="false"

#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/- ADDED 2017-07-21
# ADDED 2018-04-25 -\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

export script_dump_json="true"

export script_uses_wip="true"

#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/- ADDED 2018-04-25
# ADDED 2017-08-03 -\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# Wait time in seconds
export WAITTIME=15

#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/- ADDED 2017-08-03

export APIScriptSubFilePrefix=cli_api_export_objects
#export APIScriptSubFile=$APIScriptSubFilePrefix'_actions_'$APIScriptVersion.sh
#export APIScriptCSVSubFile=$APIScriptSubFilePrefix'_actions_to_csv_'$APIScriptVersion.sh
export APIScriptSubFile=$APIScriptSubFilePrefix'_actions'.sh
export APIScriptCSVSubFile=$APIScriptSubFilePrefix'_actions_to_csv'.sh


# MODIFIED 2018-03-04 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# =================================================================================================
# =================================================================================================
# START:  Command Line Parameter Handling and Help
# =================================================================================================


# Code template for parsing command line parameters using only portable shell
# code, while handling both long and short params, handling '-f file' and
# '-f=file' style param data and also capturing non-parameters to be inserted
# back into the shell positional parameters.
#
# Standard Command Line Parameters
#
# -? | --help
# -v | --verbose
# -P <web-ssl-port> | --port <web-ssl-port> | -P=<web-ssl-port> | --port=<web-ssl-port>
# -r | --root
# -u <admin_name> | --user <admin_name> | -u=<admin_name> | --user=<admin_name>
# -p <password> | --password <password> | -p=<password> | --password=<password>
# -m <server_IP> | --management <server_IP> | -m=<server_IP> | --management=<server_IP>
# -d <domain> | --domain <domain> | -d=<domain> | --domain=<domain>
# -s <session_file_filepath> | --session-file <session_file_filepath> | -s=<session_file_filepath> | --session-file=<session_file_filepath>
# -l <log_path> | --log-path <log_path> | -l=<log_path> | --log-path=<log_path>'
#
# -x <export_path> | --export <export_path> | -x=<export_path> | --export=<export_path> 
# -i <import_path> | --import-path <import_path> | -i=<import_path> | --import-path=<import_path>'
# -k <delete_path> | --delete-path <delete_path> | -k=<delete_path> | --delete-path=<delete_path>'
#
# -c <csv_path> | --csv <csv_path> | -c=<csv_path> | --csv=<csv_path>'
#
# --NSO | --no-system-objects
# --SO | --system-objects
#

export SHOWHELP=false
export CLIparm_websslport=443
export CLIparm_rootuser=false
export CLIparm_user=
export CLIparm_password=
export CLIparm_mgmt=
export CLIparm_domain=
export CLIparm_sessionidfile=
export CLIparm_logpath=

export CLIparm_exportpath=
export CLIparm_importpath=
export CLIparm_deletepath=

export CLIparm_csvpath=

export CLIparm_NoSystemObjects=false

export REMAINS=

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-04

# MODIFIED 2018-03-04 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# dumpcliparmparseresults
# -------------------------------------------------------------------------------------------------

dumpcliparmparseresults () {

	#
	# Testing - Dump aquired values
	#
	if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
	    # Verbose mode ON
	    
	    export outstring=
	    export outstring=$outstring"After: \n "
	    export outstring=$outstring"CLIparm_rootuser='$CLIparm_rootuser' \n "
	    export outstring=$outstring"CLIparm_user='$CLIparm_user' \n "
	    export outstring=$outstring"CLIparm_password='$CLIparm_password' \n "
	
	    export outstring=$outstring"CLIparm_websslport='$CLIparm_websslport' \n "
	    export outstring=$outstring"CLIparm_mgmt='$CLIparm_mgmt' \n "
	    export outstring=$outstring"CLIparm_domain='$CLIparm_domain' \n "
	    export outstring=$outstring"CLIparm_sessionidfile='$CLIparm_sessionidfile' \n "
	    export outstring=$outstring"CLIparm_logpath='$CLIparm_logpath' \n "
	
	    export outstring=$outstring"CLIparm_NoSystemObjects='$CLIparm_NoSystemObjects' \n "
	
	    if [ x"$script_use_export" = x"true" ] ; then
	        export outstring=$outstring"CLIparm_exportpath='$CLIparm_exportpath' \n "
	    fi
	    if [ x"$script_use_import" = x"true" ] ; then
	        export outstring=$outstring"CLIparm_importpath='$CLIparm_importpath' \n "
	    fi
	    if [ x"$script_use_delete" = x"true" ] ; then
	        export outstring=$outstring"CLIparm_deletepath='$CLIparm_deletepath' \n "
	    fi
	    if [ x"$script_use_csvfile" = x"true" ] ; then
	        export outstring=$outstring"CLIparm_csvpath='$CLIparm_csvpath' \n "
	    fi
	    
	    export outstring=$outstring"SHOWHELP='$SHOWHELP' \n "
	    export outstring=$outstring"APISCRIPTVERBOSE='$APISCRIPTVERBOSE' \n "
	    export outstring=$outstring"remains='$REMAINS'"
	    
	    echo
	    echo -e $outstring
	    echo
	    for i ; do echo - $i ; done
	    echo CLI parms - number $# parms $@
	    echo
	    
	fi

}


#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-04

# MODIFIED 2018-03-04 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# Call command line parameter handler action script
# -------------------------------------------------------------------------------------------------


# MODIFIED 2018-04-16 -
export cli_api_cmdlineparm_handler=cmd_line_parameters_handler.action.common.004.v00.28.00.sh

echo
echo '--------------------------------------------------------------------------'
echo
echo "Calling external Command Line Paramenter Handling Script"
echo

. ./$cli_api_cmdlineparm_handler "$@"

echo
echo "Returned from external Command Line Paramenter Handling Script"
echo

dumpcliparmparseresults "$@"

if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
    echo
    read -t $WAITTIME -n 1 -p "Any key to continue : " anykey
fi

echo
echo "Starting local execution"
echo
echo '--------------------------------------------------------------------------'
echo


#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-04

# MODIFIED 2018-03-04 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# Handle request for help and exit
# -------------------------------------------------------------------------------------------------

#
# Was help requested, if so show it and exit
#
if [ x"$SHOWHELP" = x"true" ] ; then
    # Show Help
    # Done in external Script now
    #doshowhelp
    exit
fi

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-04

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-03-04 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#


# =================================================================================================
# END:  Command Line Parameter Handling and Help
# =================================================================================================
# =================================================================================================

#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ MODIFIED 2018-03-03


# =================================================================================================
# =================================================================================================
# START:  Setup Standard Parameters
# =================================================================================================

# MODIFIED 2017-08-28 -\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

export gaiaversion=$(clish -c "show version product" | cut -d " " -f 6)

if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
    echo 'Gaia Version : $gaiaversion = '$gaiaversion
    echo
fi


export DATE=`date +%Y-%m-%d-%H%M%Z`

if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
    echo 'Date Time Group   :  '$DATE
    echo
fi

#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/-  MODIFIED 2017-08-28


# =================================================================================================
# END:  Setup Standard Parameters
# =================================================================================================
# =================================================================================================


# MODIFIED 2018-04-25-5 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# =================================================================================================
# =================================================================================================
# START:  Setup Login Parameters and Login to Mgmt_CLI
# =================================================================================================


export APICLIwebsslport=443
if [ x"$CLIparm_websslport" != x"" ] ; then
    export APICLIwebsslport=$CLIparm_websslport
else
    export APICLIwebsslport=443
fi

# ================================================================================================
# NOTE:  APICLIadmin value must be set to operate this script, removing this varaiable will lead
#        to logon failure with mgmt_cli logon.  Root User (-r) parameter is handled differently,
#        so DO NOT REMOVE OR CLEAR this variable.
# ================================================================================================
if [ x"$CLIparm_user" != x"" ] ; then
    export APICLIadmin=$CLIparm_user
else
    #export APICLIadmin=admin
    export APICLIadmin=administrator
fi

if [ x"$CLIparm_sessionidfile" != x"" ] ; then
    export APICLIsessionfile=$CLIparm_sessionidfile
else
    export APICLIsessionfile=id.txt
fi


#
# Testing - Dump aquired values
#
echo 'APICLIadmin       :  '$APICLIadmin
echo 'APICLIsessionfile :  '$APICLIsessionfile
echo

echo
echo 'mgmt_cli Login!'
echo
echo 'Login to mgmt_cli as '$APICLIadmin' and save to session file :  '$APICLIsessionfile
echo

export loginstring=
export loginparmstring=
export mgmttarget=
export domaintarget=

if [ x"$CLIparm_rootuser" = x"true" ] ; then
    # Handle if ROOT User -r true parameter

    # Handle management server parameter error if combined with ROOT User
    if [ x"$CLIparm_mgmt" != x"" ] ; then
        echo
        echo "mgmt_cli parameter error!!!!"
        echo "ROOT User (-r true) parameter can not be combined with -m <Management_Server>!!!"
        echo
        echo "Terminating script..."
        echo
        exit 255
    fi

	export loginparmstring=' -r true'

    if [ x"$CLIparm_domain" != x"" ] ; then
        # Handle domain parameter for login string
        export loginparmstring=$loginparmstring" domain \"$CLIparm_domain\""

        #
        # Testing - Dump login string bullt from parameters
        #
        if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
            echo 'Execute login with loginparmstring '\"$loginparmstring\"' As Root with Domain'
            echo
        fi
        
        mgmt_cli login -r true domain "$CLIparm_domain" --port $APICLIwebsslport > $APICLIsessionfile
        EXITCODE=$?
    else
        #
        # Testing - Dump login string bullt from parameters
        #
        if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
            echo 'Execute login with loginparmstring '\"$loginparmstring\"' As Root'
            echo
        fi
        
        mgmt_cli login -r true --port $APICLIwebsslport > $APICLIsessionfile
        EXITCODE=$?
    fi
else
    # Handle User

    export loginparmstring=

    if [ x"$APICLIadmin" != x"" ] ; then
        export loginparmstring=$loginparmstring" user $APICLIadmin"
    else
        echo
        echo "mgmt_cli parameter error!!!!"
        echo "Admin User variable not set!!!"
        echo
        echo "Terminating script..."
        echo
        exit 255
    fi

    if [ x"$CLIparm_password" != x"" ] ; then
        # Handle password parameter
        export loginparmstring=$loginparmstring" password \"$CLIparm_password\""

        if [ x"$CLIparm_domain" != x"" ] ; then
            # Handle domain parameter for login string
            export loginparmstring=$loginparmstring" domain \"$CLIparm_domain\""
      
            # Handle management server parameter for mgmt_cli parms
            if [ x"$CLIparm_mgmt" != x"" ] ; then
                export mgmttarget="-m \"$CLIparm_mgmt\""
  
                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Domain and Management'
                    echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                    echo
                fi
                
                mgmt_cli login user $APICLIadmin password "$CLIparm_password" domain "$CLIparm_domain" -m "$CLIparm_mgmt" --port $APICLIwebsslport > $APICLIsessionfile
                EXITCODE=$?
            else
                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Domain'
                    echo
                fi
                
                mgmt_cli login user $APICLIadmin password "$CLIparm_password" domain "$CLIparm_domain" --port $APICLIwebsslport > $APICLIsessionfile
                EXITCODE=$?
            fi
        else
            # Handle management server parameter for mgmt_cli parms
            if [ x"$CLIparm_mgmt" != x"" ] ; then
                export mgmttarget='-m \"$CLIparm_mgmt\"'
  
                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Management'
                    echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                    echo
                fi
                
                mgmt_cli login user $APICLIadmin password "$CLIparm_password" -m "$CLIparm_mgmt" --port $APICLIwebsslport > $APICLIsessionfile
                EXITCODE=$?
            else
                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password'
                    echo
                fi
                
                mgmt_cli login user $APICLIadmin password "$CLIparm_password" --port $APICLIwebsslport > $APICLIsessionfile
                EXITCODE=$?
            fi
        fi
    else
        # Handle NO password parameter

        if [ x"$CLIparm_domain" != x"" ] ; then
            # Handle domain parameter for login string
            export loginparmstring=$loginparmstring" domain \"$CLIparm_domain\""
      
            # Handle management server parameter for mgmt_cli parms
            if [ x"$CLIparm_mgmt" != x"" ] ; then
                export mgmttarget="-m \"$CLIparm_mgmt\""
  
                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Domain and Management'
                    echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                    echo
                fi
                
                mgmt_cli login user $APICLIadmin domain "$CLIparm_domain" -m "$CLIparm_mgmt" --port $APICLIwebsslport > $APICLIsessionfile
                EXITCODE=$?
            else
                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Domain'
                    echo
                fi
                
                mgmt_cli login user $APICLIadmin domain "$CLIparm_domain" --port $APICLIwebsslport > $APICLIsessionfile
                EXITCODE=$?
            fi
        else
            # Handle management server parameter for mgmt_cli parms
            if [ x"$CLIparm_mgmt" != x"" ] ; then
                export mgmttarget='-m \"$CLIparm_mgmt\"'
  
                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Management'
                    echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                    echo
                fi
                
                mgmt_cli login user $APICLIadmin -m "$CLIparm_mgmt" --port $APICLIwebsslport > $APICLIsessionfile
                EXITCODE=$?
            else
                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User'
                    echo
                fi
                
                mgmt_cli login user $APICLIadmin --port $APICLIwebsslport > $APICLIsessionfile
                EXITCODE=$?
            fi
        fi
    fi
fi

if [ "$EXITCODE" != "0" ] ; then
    
    echo
    echo "mgmt_cli login error!"
    echo
    cat $APICLIsessionfile
    echo
    echo "Terminating script..."
    echo
    exit 255

else
    
    echo "mgmt_cli login success!"
    echo
    cat $APICLIsessionfile
    echo
    
fi


# =================================================================================================
# END:  Setup Login Parameters and Login to Mgmt_CLI
# =================================================================================================
# =================================================================================================

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-04-25-5
# MODIFIED 2018-04-16 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# =================================================================================================
# =================================================================================================
# START:  Setup CLI Parameters
# =================================================================================================


# -------------------------------------------------------------------------------------------------
# Set parameters for Main operations - CLI
# -------------------------------------------------------------------------------------------------

if [ x"$CLIparm_logpath" != x"" ] ; then
    export APICLIlogpathroot=$CLIparm_logpath
else
    export APICLIlogpathroot=./dump
fi

export APICLIlogpathbase=$APICLIlogpathroot/$DATE

if [ ! -r $APICLIlogpathroot ] ; then
    mkdir $APICLIlogpathroot
fi
if [ ! -r $APICLIlogpathbase ] ; then
    mkdir $APICLIlogpathbase
fi

export APICLIlogfilepath=$APICLIlogpathbase/$ScriptName'_'$APIScriptVersion'_'$DATE.log

if [ x"$script_use_export" = x"true" ] ; then
    if [ x"$CLIparm_exportpath" != x"" ] ; then
        export APICLIpathroot=$CLIparm_exportpath
    else
        export APICLIpathroot=./dump
    fi
  
    export APICLIpathbase=$APICLIpathroot/$DATE
    
    if [ ! -r $APICLIpathroot ] ; then
        mkdir $APICLIpathroot
    fi
    if [ ! -r $APICLIpathbase ] ; then
        mkdir $APICLIpathbase
    fi
fi

if [ x"$script_use_import" = x"true" ] ; then
    if [ x"$CLIparm_importpath" != x"" ] ; then
        export APICLICSVImportpathbase=$CLIparm_importpath
    else
        export APICLICSVImportpathbase=./import.csv
    fi
    
    if [ ! -r $APICLIpathbase/import ] ; then
        mkdir $APICLIpathbase/import
    fi
fi

if [ x"$script_use_delete" = x"true" ] ; then
    if [ x"$CLIparm_deletepath" != x"" ] ; then
        export APICLICSVDeletepathbase=$CLIparm_deletepath
    else
        export APICLICSVDeletepathbase=./delete.csv
    fi
    
    if [ ! -r $APICLIpathbase/delete ] ; then
        mkdir $APICLIpathbase/delete
    fi
fi

if [ x"$script_use_csvfile" = x"true" ] ; then
    if [ x"$CLIparm_csvpath" != x"" ] ; then
        export APICLICSVcsvpath=$CLIparm_csvpath
    else
        export APICLICSVcsvpath=./domains.csv
    fi
fi

if [ x"$script_dump_csv" = x"true" ] ; then
    if [ ! -r $APICLIpathbase/csv ] ; then
        mkdir $APICLIpathbase/csv
    fi
fi

if [ x"$script_dump_json" = x"true" ] ; then
    if [ ! -r $APICLIpathbase/json ] ; then
        mkdir $APICLIpathbase/json
    fi
fi

if [ x"$script_dump_full" = x"true" ] ; then
    if [ ! -r $APICLIpathbase/full ] ; then
        mkdir $APICLIpathbase/full
    fi
fi

if [ x"$script_dump_standard" = x"true" ] ; then
    if [ ! -r $APICLIpathbase/standard ] ; then
        mkdir $APICLIpathbase/standard
    fi
fi

#export NoSystemObjects=`echo "$CLIparm_NoSystemObjects" | tr '[:upper:]' '[:lower:]'`
if [ x"`echo "$CLIparm_NoSystemObjects" | tr '[:upper:]' '[:lower:]'`" = x"false" ] ; then
    export NoSystemObjects=false
else
    export NoSystemObjects=true
fi
    
# =================================================================================================
# END:  Setup CLI Parameters
# =================================================================================================
# =================================================================================================

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-04-16

# =================================================================================================
# -------------------------------------------------------------------------------------------------
# =================================================================================================
# START:  Main operations - 
# =================================================================================================


# -------------------------------------------------------------------------------------------------
# Set parameters for Main operations
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-04-25 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

export FileExtJSON=json
export FileExtCSV=csv
export FileExtTXT=txt

export APICLIfileexportpre=dump_

export APICLIfileexportext=$FileExtJSON
export APICLIfileexportsuffix=$DATE'.'$APICLIfileexportext

export APICLICSVfileexportext=$FileExtCSV
export APICLICSVfileexportsuffix='.'$APICLICSVfileexportext

export APICLIJSONfileexportext=$FileExtJSON
export APICLIJSONfileexportsuffix='.'$APICLIJSONfileexportext

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-04-25

export APICLIObjectLimit=500

# =================================================================================================
# -------------------------------------------------------------------------------------------------
# =================================================================================================
# START:  Main operations
# =================================================================================================


# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ADDED 2018-03-03

# ADDED 2018-04-25 -
export primarytargetoutputformat=$FileExtJSON

# -------------------------------------------------------------------------------------------------
# Start executing Main operations
# -------------------------------------------------------------------------------------------------


# MODIFIED 2018-04-25 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-04-25


# MODIFIED 2018-04-25 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# Start executing Main Dump operations - json Standard, json Full, CSV
# -------------------------------------------------------------------------------------------------

export primarytargetoutputformat=$FileExtJSON
if [ x"$script_dump_full" = x"true" ] ; then
    export APICLIdetaillvl=full
    
    echo
    echo 'Now dumping "'$APICLIdetaillvl'" details to '$primarytargetoutputformat
    echo 'Calling Action File : '$APIScriptSubFile
    echo
    
    ./$APIScriptSubFile
fi

echo
echo 'Dumps Completed!'
echo

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-04-25

# =================================================================================================
# END:  Main operations - 
# =================================================================================================
# -------------------------------------------------------------------------------------------------
# =================================================================================================


# =================================================================================================
# =================================================================================================
# START:  Publish, Cleanup, and Dump output
# =================================================================================================


# MODIFIED 2017-07-21 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# Publish Changes
# -------------------------------------------------------------------------------------------------


if [ x"$script_use_publish" = x"true" ] ; then
    echo
    echo 'Publish changes!'
    echo
    mgmt_cli publish -s $APICLIsessionfile
    echo
else
    echo
    echo 'Nothing to Publish!'
    echo
fi

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2017-07-21

# -------------------------------------------------------------------------------------------------
# Logout from mgmt_cli, also cleanup session file
# -------------------------------------------------------------------------------------------------

echo
echo 'Logout of mgmt_cli!  Then remove session file.'
echo
mgmt_cli logout -s $APICLIsessionfile

rm $APICLIsessionfile

# MODIFIED 2018-03-04 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# Clean-up and exit
# -------------------------------------------------------------------------------------------------

echo 'CLI Operations Completed'

if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
    # Verbose mode ON

    echo
    #echo "Files in >$apiclipathroot<"
    #ls -alh $apiclipathroot
    #echo

    if [ "$APICLIlogpathbase" != "$APICLIpathbase" ] ; then
        echo "Files in >$APICLIlogpathbase<"
        ls -alhR $APICLIpathbase
        echo
    fi
    
    echo "Files in >$APICLIpathbase<"
    ls -alhR $APICLIpathbase
    echo
fi

echo
echo "Results in directory $APICLIpathbase"
echo "Log output in file $APICLIlogfilepath"
echo

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-04


# =================================================================================================
# END:  Publish, Cleanup, and Dump output
# =================================================================================================
# =================================================================================================


