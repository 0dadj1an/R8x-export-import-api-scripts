# MODIFIED 2018-04-25 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# =================================================================================================
# =================================================================================================
# START:  Setup Login Parameters and Login to Mgmt_CLI
# =================================================================================================


if [ x"$CLIparm_user" != x"" ] ; then
    export APICLIadmin=$CLIparm_user
else
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

if [ x"$CLIparm_websslport" != x"" ] ; then
    # Handle web ssl port parameter for login string
    if [ x"$loginparmstring" != x"" ] ; then
        export loginparmstring=$loginparmstring" --port $CLIparm_websslport"
    else
        export loginparmstring="--port $CLIparm_websslport"
    fi
else
    export loginparmstring=$loginparmstring
fi

if [ x"$CLIparm_rootuser" = x"true" ] ; then

    # Handle Root User
    if [ x"$loginparmstring" != x"" ] ; then
        export loginparmstring=$loginparmstring" -r true"
    else
        export loginparmstring="-r true"
    fi

    if [ x"$CLIparm_domain" != x"" ] ; then
    # Handle domain parameter for login string
        if [ x"$loginparmstring" != x"" ] ; then
            export loginparmstring=$loginparmstring" domain \"$CLIparm_domain\""
        else
            export loginparmstring="domain \"$CLIparm_domain\""
        fi
    fi

else

    # Handle admin user parameter
    if [ x"$APICLIadmin" != x"" ] ; then
        if [ x"$loginparmstring" != x"" ] ; then
            export loginparmstring=$loginparmstring" user $APICLIadmin"
        else
            export loginparmstring="user $APICLIadmin"
        fi
    fi
    
    # Handle password parameter
    if [ x"$CLIparm_password" != x"" ] ; then
        if [ x"$loginparmstring" != x"" ] ; then
            export loginparmstring=$loginparmstring" password \"$CLIparm_password\""
        else
            export loginparmstring="password \"$CLIparm_password\""
        fi
    fi

    if [ x"$CLIparm_domain" != x"" ] ; then
    # Handle domain parameter for login string
        if [ x"$loginparmstring" != x"" ] ; then
            export loginparmstring=$loginparmstring" domain \"$CLIparm_domain\""
        else
            export loginparmstring="domain \"$CLIparm_domain\""
        fi
    fi

fi

# Handle management server parameter for mgmt_cli parms
if [ x"$CLIparm_mgmt" != x"" ] ; then
    export  mgmttarget="-m \"$CLIparm_mgmt\""
fi

#   Handle domain parameter for mgmt_cli parms
if [ x"$CLIparm_domain" != x"" ] ; then
    export domaintarget="domain \"$CLIparm_domain\""
fi

#
# Testing - Dump login string bullt from parameters
#
if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
    echo 'Execute login with loginparmstring '\"$loginparmstring\"
    if [ x"$CLIparm_domain" != x"" ] ; then
        echo 'Execute operations with domaintarget '\"$domaintarget\"
    fi
    if [ x"$mgmttarget" = x"" ] ; then
        echo 'Execute operations with mgmttarget '\"$mgmttarget\"
    fi
    echo
fi

if [ x"$mgmttarget" = x"" ] ; then
    mgmt_cli login $loginparmstring > $APICLIsessionfile
    EXITCODE=$?
else
    mgmt_cli login $loginparmstring $mgmttarget > $APICLIsessionfile
    EXITCODE=$?
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
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-04-25
