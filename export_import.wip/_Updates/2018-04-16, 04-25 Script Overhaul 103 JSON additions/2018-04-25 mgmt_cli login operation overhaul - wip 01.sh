# MODIFIED 2018-04-25-2 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
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

if [ x"$CLIparm_rootuser" = x"true" ] ; then
    #export loginparmstring='mgmt_cli login'

	export loginparmstring=' -r true'

    if [ x"$CLIparm_domain" != x"" ] ; then
    # Handle domain parameter for login string
        export loginparmstring=$loginparmstring" domain \"$CLIparm_domain\""

        if [ x"$CLIparm_websslport" != x"" ] ; then
            # Handle web ssl port parameter for login string
            export loginparmstring=$loginparmstring" --port $CLIparm_websslport"

            # Handle management server parameter for mgmt_cli parms
            if [ x"$CLIparm_mgmt" != x"" ] ; then
                export mgmttarget="-m \"$CLIparm_mgmt\""
 
                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"
                    echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                    echo
                fi
                
                mgmt_cli login -r true domain \"$CLIparm_domain\" -m \"$CLIparm_mgmt\" --port $CLIparm_websslport > $APICLIsessionfile
                EXITCODE=$?

            else

                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"
                    echo
                fi
                
                mgmt_cli login -r true domain \"$CLIparm_domain\" --port $CLIparm_websslport > $APICLIsessionfile
                EXITCODE=$?

            fi
        else
            # Handle management server parameter for mgmt_cli parms
            if [ x"$CLIparm_mgmt" != x"" ] ; then
                export mgmttarget="-m \"$CLIparm_mgmt\""

                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"
                    echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                    echo
                fi
                
                mgmt_cli login -r true domain \"$CLIparm_domain\" -m \"$CLIparm_mgmt\" > $APICLIsessionfile
                EXITCODE=$?

            else

                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"
                    echo
                fi
                
                mgmt_cli login -r true domain \"$CLIparm_domain\" > $APICLIsessionfile
                EXITCODE=$?

            fi
        fi
    else
        if [ x"$CLIparm_websslport" != x"" ] ; then
            # Handle web ssl port parameter for login string
            export loginparmstring=$loginparmstring" --port $CLIparm_websslport"

            # Handle management server parameter for mgmt_cli parms
            if [ x"$CLIparm_mgmt" != x"" ] ; then
                export mgmttarget="-m \"$CLIparm_mgmt\""

                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"
                    echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                    echo
                fi
                
                mgmt_cli login -r true --port $CLIparm_websslport -m \"$CLIparm_mgmt\" > $APICLIsessionfile
                EXITCODE=$?

            else

                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"
                    echo
                fi
                
                mgmt_cli login -r true --port $CLIparm_websslport > $APICLIsessionfile
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
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"
                    echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                    echo
                fi
                
                mgmt_cli login -r true -m \"$CLIparm_mgmt\" > $APICLIsessionfile
                EXITCODE=$?

            else

                #
                # Testing - Dump login string bullt from parameters
                #
                if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                    echo 'Execute login with loginparmstring '\"$loginparmstring\"
                    echo
                fi
                
                mgmt_cli login -r true > $APICLIsessionfile
                EXITCODE=$?

            fi
        fi
    fi


else
    export loginparmstring=

    if [ x"$CLIparm_websslport" != x"" ] ; then
        # Handle web ssl port parameter for login string
        export loginparmstring=$loginparmstring" --port $CLIparm_websslport"
    fi
    
    # Handle admin user parameter
    if [ x"$APICLIadmin" != x"" ] ; then
        export loginparmstring=$loginparmstring" user $APICLIadmin"
    fi
    
    # Handle password parameter
    if [ x"$CLIparm_password" != x"" ] ; then
        export loginparmstring=$loginparmstring" password \"$CLIparm_password\""
    fi

    if [ x"$CLIparm_domain" != x"" ] ; then
    # Handle domain parameter for login string
        export loginparmstring=$loginparmstring" domain \"$CLIparm_domain\""
    fi

    # Handle management server parameter for mgmt_cli parms
    if [ x"$CLIparm_mgmt" != x"" ] ; then
        export mgmttarget="-m \"$CLIparm_mgmt\""
    fi
    
    #
    # Testing - Dump login string bullt from parameters
    #
    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
        echo 'Execute login with loginparmstring '\"$loginparmstring\"
        if [ x"$mgmttarget" != x"" ] ; then
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
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-04-25-2
