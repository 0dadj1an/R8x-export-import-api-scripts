
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# ADDED 2018-05-04 -

# ADDED 2018-05-04 -\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#


#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/- ADDED 2018-05-04

# MODIFIED 2018-05-04 -

# MODIFIED 2018-05-04 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#


#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-05-04

# REMOVED 2018-05-04 -

# REMOVED 2018-05-04 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ REMOVED 2018-05-04


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# =================================================================================================
# START:  Setup Login Parameters and Login to Mgmt_CLI
# =================================================================================================


if [ ! -z $CLIparm_domain ] ; then
    # Handle domain parameter for login string
    export domaintarget=$CLIparm_domain
else
    export domaintarget=
fi

SetupLogin2MgmtCLI

Login2MgmtCLI


# =================================================================================================
# END:  Setup Login Parameters and Login to Mgmt_CLI
# =================================================================================================

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# -------------------------------------------------------------------------------------------------
# HandleMgmtCLILogin - Login to the API via mgmt_cli login
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-05-02-2 -\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

#
# Login to the API via mgmt_cli login
#

HandleMgmtCLILogin () {
    #
    # Login to the API via mgmt_cli login
    #

    export loginstring=
    export loginparmstring=
    
# MODIFIED 2018-05-03 -
    if [ ! -z $CLIparm_sessionidfile ] ; then
        # CLIparm_sessionidfile value is set so use it
        export APICLIsessionfile=$CLIparm_sessionidfile
    else
        # Updated to make session id file unique in case of multiple admins running script from same folder
        export APICLIsessionfile=id.`date +%Y%m%d-%H%M%S%Z`.txt
    fi

# MODIFIED 2018-05-03 -
    export domainnamenospace=
    if [ ! -z $domaintarget ] ; then
        # Handle domain name that might include space if the value is set
        #export domainnamenospace="$(echo -e "${domaintarget}" | tr -d '[:space:]')"
        #export domainnamenospace=$(echo -e ${domaintarget} | tr -d '[:space:]')
        export domainnamenospace=$(echo -e ${domaintarget} | tr ' ' '_')
    else
        export domainnamenospace=
    fi
    
    if [ ! -z $domainnamenospace ] ; then
        # Handle domain name that might include space
        if [ ! -z $CLIparm_sessionidfile ] ; then
            # adjust if CLIparm_sessionidfile was set, since that might be a complete path, append the path to it 
            export APICLIsessionfile=$APICLIsessionfile.$domainnamenospace
        else
            # assume the session file is set to a local file and prefix the domain to it
            export APICLIsessionfile=$domainnamenospace.$APICLIsessionfile
        fi
    fi
    
    if [ x"$CLIparm_rootuser" = x"true" ] ; then
        # Handle if ROOT User -r true parameter
        
        #
        # Testing - Dump aquired values
        #
        echo 'APICLIsessionfile :  '$APICLIsessionfile | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
        
        echo | tee -a -i $APICLIlogfilepath
        echo 'mgmt_cli Login!' | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
        echo 'Login to mgmt_cli as root user -r true and save to session file :  '$APICLIsessionfile | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
        
        # Handle management server parameter error if combined with ROOT User
        if [ x"$CLIparm_mgmt" != x"" ] ; then
            echo | tee -a -i $APICLIlogfilepath
            echo 'mgmt_cli parameter error!!!!' | tee -a -i $APICLIlogfilepath
            echo 'ROOT User (-r true) parameter can not be combined with -m <Management_Server>!!!' | tee -a -i $APICLIlogfilepath
            echo | tee -a -i $APICLIlogfilepath
            return 254
        fi
    
    	export loginparmstring=' -r true'
    
        if [ x"$domaintarget" != x"" ] ; then
            # Handle domain parameter for login string
            export loginparmstring=$loginparmstring" domain \"$domaintarget\""
    
            #
            # Testing - Dump login string built from parameters
            #
            if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                echo 'Execute login with loginparmstring '\"$loginparmstring\"' As Root with Domain' | tee -a -i $APICLIlogfilepath
                echo | tee -a -i $APICLIlogfilepath
            fi
            
            mgmt_cli login -r true domain "$domaintarget" --port $APICLIwebsslport > $APICLIsessionfile
            EXITCODE=$?
        else
            #
            # Testing - Dump login string built from parameters
            #
            if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                echo 'Execute login with loginparmstring '\"$loginparmstring\"' As Root'
                echo
            fi
            
            mgmt_cli login -r true --port $APICLIwebsslport | tee -a -i $APICLIlogfilepath > $APICLIsessionfile
            EXITCODE=$?
        fi
    else
        # Handle User
    
        #
        # Testing - Dump aquired values
        #
        echo 'APICLIadmin       :  '$APICLIadmin | tee -a -i $APICLIlogfilepath
        echo 'APICLIsessionfile :  '$APICLIsessionfile | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
        
        echo | tee -a -i $APICLIlogfilepath
        echo 'mgmt_cli Login!' | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
        echo 'Login to mgmt_cli as '$APICLIadmin' and save to session file :  '$APICLIsessionfile | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
        
        if [ x"$APICLIadmin" != x"" ] ; then
            export loginparmstring=$loginparmstring" user $APICLIadmin"
        else
            echo | tee -a -i $APICLIlogfilepath
            echo 'mgmt_cli parameter error!!!!' | tee -a -i $APICLIlogfilepath
            echo 'Admin User variable not set!!!' | tee -a -i $APICLIlogfilepath
            echo | tee -a -i $APICLIlogfilepath
            return 254
        fi
    
        if [ x"$CLIparm_password" != x"" ] ; then
            # Handle password parameter
            export loginparmstring=$loginparmstring" password \"$CLIparm_password\""
    
            if [ x"$domaintarget" != x"" ] ; then
                # Handle domain parameter for login string
                export loginparmstring=$loginparmstring" domain \"$domaintarget\""
          
                # Handle management server parameter for mgmt_cli parms
                if [ x"$CLIparm_mgmt" != x"" ] ; then
                    export mgmttarget="-m \"$CLIparm_mgmt\""
      
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Domain and Management' | tee -a -i $APICLIlogfilepath
                        echo 'Execute operations with mgmttarget '\"$mgmttarget\" | tee -a -i $APICLIlogfilepath
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" domain "$domaintarget" -m "$CLIparm_mgmt" --port $APICLIwebsslport | tee -a -i $APICLIlogfilepath > $APICLIsessionfile
                    EXITCODE=$?
                else
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Domain' | tee -a -i $APICLIlogfilepath
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" domain "$domaintarget" --port $APICLIwebsslport | tee -a -i $APICLIlogfilepath > $APICLIsessionfile
                    EXITCODE=$?
                fi
            else
                # Handle management server parameter for mgmt_cli parms
                if [ x"$CLIparm_mgmt" != x"" ] ; then
                    export mgmttarget='-m \"$CLIparm_mgmt\"'
      
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Management' | tee -a -i $APICLIlogfilepath
                        echo 'Execute operations with mgmttarget '\"$mgmttarget\" | tee -a -i $APICLIlogfilepath
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" -m "$CLIparm_mgmt" --port $APICLIwebsslport | tee -a -i $APICLIlogfilepath > $APICLIsessionfile
                    EXITCODE=$?
                else
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password' | tee -a -i $APICLIlogfilepath
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" --port $APICLIwebsslport | tee -a -i $APICLIlogfilepath > $APICLIsessionfile
                    EXITCODE=$?
                fi
            fi
        else
            # Handle NO password parameter
    
            if [ x"$domaintarget" != x"" ] ; then
                # Handle domain parameter for login string
                export loginparmstring=$loginparmstring" domain \"$domaintarget\""
          
                # Handle management server parameter for mgmt_cli parms
                if [ x"$CLIparm_mgmt" != x"" ] ; then
                    export mgmttarget="-m \"$CLIparm_mgmt\""
      
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Domain and Management' | tee -a -i $APICLIlogfilepath
                        echo 'Execute operations with mgmttarget '\"$mgmttarget\" | tee -a -i $APICLIlogfilepath
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin domain "$domaintarget" -m "$CLIparm_mgmt" --port $APICLIwebsslport | tee -a -i $APICLIlogfilepath > $APICLIsessionfile
                    EXITCODE=$?
                else
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Domain | tee -a -i $APICLIlogfilepath'
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin domain "$domaintarget" --port $APICLIwebsslport | tee -a -i $APICLIlogfilepath > $APICLIsessionfile
                    EXITCODE=$?
                fi
            else
                # Handle management server parameter for mgmt_cli parms
                if [ x"$CLIparm_mgmt" != x"" ] ; then
                    export mgmttarget='-m \"$CLIparm_mgmt\"'
      
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Management' | tee -a -i $APICLIlogfilepath
                        echo 'Execute operations with mgmttarget '\"$mgmttarget\" | tee -a -i $APICLIlogfilepath
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin -m "$CLIparm_mgmt" --port $APICLIwebsslport | tee -a -i $APICLIlogfilepath > $APICLIsessionfile
                    EXITCODE=$?
                else
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User' | tee -a -i $APICLIlogfilepath
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin --port $APICLIwebsslport | tee -a -i $APICLIlogfilepath > $APICLIsessionfile
                    EXITCODE=$?
                fi
            fi
        fi
    fi
    
    if [ "$EXITCODE" != "0" ] ; then
        
        echo | tee -a -i $APICLIlogfilepath
        echo "mgmt_cli login error!" | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
        cat $APICLIsessionfile | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
        return 255
    
    else
        
        echo "mgmt_cli login success!" | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
        cat $APICLIsessionfile | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
        
    fi

    return 0
}

#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/-  MODIFIED 2018-05-02-2

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# MODIFIED 2018-03-04 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# dumprawcliparms
# -------------------------------------------------------------------------------------------------

dumprawcliparms () {
    #
    echo | tee -a -i $APICLIlogfilepath
    echo "Command line parameters before" | tee -a -i $APICLIlogfilepath
    echo number parms $# | tee -a -i $APICLIlogfilepath
    echo parms raw : \> $@ \< | tee -a -i $APICLIlogfilepath
    for k ; do echo $k $'\t' "${k}" | tee -a -i $APICLIlogfilepath ; done
    echo | tee -a -i $APICLIlogfilepath
}


#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-03-04


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# -------------------------------------------------------------------------------------------------
# dumpcliparmparseresults
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-05-03-2 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

dumpcliparmparseresults () {

	#
	# Testing - Dump aquired values
	#
    #
    # Screen width template for sizing, default width of 80 characters assumed
    #
    #                                    1111111111222222222233333333334444444444555555555566666666667777777777888888888899999999990
    #                          01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
    export outstring=
    #export outstring=$outstring"After: \n "
    export outstring=$outstring"CLIparm_rootuser        ='$CLIparm_rootuser' \n "
    export outstring=$outstring"CLIparm_user            ='$CLIparm_user' \n "
    export outstring=$outstring"CLIparm_password        ='$CLIparm_password' \n "
    
    export outstring=$outstring"CLIparm_websslport      ='$CLIparm_websslport' \n "
    export outstring=$outstring"CLIparm_mgmt            ='$CLIparm_mgmt' \n "
    export outstring=$outstring"CLIparm_domain          ='$CLIparm_domain' \n "
    export outstring=$outstring"CLIparm_sessionidfile   ='$CLIparm_sessionidfile' \n "
    export outstring=$outstring"CLIparm_logpath         ='$CLIparm_logpath' \n "
    export outstring=$outstring"CLIparm_outputpath      ='$CLIparm_outputpath' \n "
    
    if [ x"$script_use_export" = x"true" ] ; then
        export outstring=$outstring"CLIparm_exportpath      ='$CLIparm_exportpath' \n "
    fi
    if [ x"$script_use_import" = x"true" ] ; then
        export outstring=$outstring"CLIparm_importpath      ='$CLIparm_importpath' \n "
    fi
    if [ x"$script_use_delete" = x"true" ] ; then
        export outstring=$outstring"CLIparm_deletepath      ='$CLIparm_deletepath' \n "
    fi
    if [ x"$script_use_csvfile" = x"true" ] ; then
        export outstring=$outstring"CLIparm_csvpath         ='$CLIparm_csvpath' \n "
    fi
    
    export outstring=$outstring"CLIparm_NoSystemObjects ='$CLIparm_NoSystemObjects' \n "
	
    export outstring=$outstring"SHOWHELP                ='$SHOWHELP' \n "
    export outstring=$outstring" \n "
    export outstring=$outstring"APISCRIPTVERBOSE        ='$APISCRIPTVERBOSE' \n "
    export outstring=$outstring"NOWAIT                  ='$NOWAIT' \n "
    export outstring=$outstring"CLEANUPWIP              ='$CLEANUPWIP' \n "
    export outstring=$outstring"NODOMAINFOLDERS         ='$NODOMAINFOLDERS' \n "
    export outstring=$outstring"ADDERRIGNORECSVEXPORT   ='$ADDERRIGNORECSVEXPORT' \n "
    export outstring=$outstring" \n "
    export outstring=$outstring"CLIparm_NOWAIT          ='$CLIparm_NOWAIT' \n "
    export outstring=$outstring"CLIparm_CLEANUPWIP      ='$CLIparm_CLEANUPWIP' \n "
    export outstring=$outstring"CLIparm_NODOMAINFOLDERS ='$CLIparm_NODOMAINFOLDERS' \n "
    export outstring=$outstring"C_ADDERRIGNORECSVEXPORT ='$CLIparm_ADDERRIGNORECSVEXPORT' \n "
    export outstring=$outstring" \n "
    export outstring=$outstring"remains                 ='$REMAINS' \n "
    
	if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
	    # Verbose mode ON
	    
	    echo | tee -a -i $APICLIlogfilepath
	    echo -e $outstring | tee -a -i $APICLIlogfilepath
	    echo | tee -a -i $APICLIlogfilepath
	    for i ; do echo - $i | tee -a -i $APICLIlogfilepath ; done
	    echo CLI parms - number $# parms $@ | tee -a -i $APICLIlogfilepath
	    echo | tee -a -i $APICLIlogfilepath
        
    else
	    # Verbose mode ON
	    
	    echo >> $APICLIlogfilepath
	    echo -e $outstring >> $APICLIlogfilepath
	    echo >> $APICLIlogfilepath
	    for i ; do echo - $i >> $APICLIlogfilepath ; done
	    echo CLI parms - number $# parms $@ >> $APICLIlogfilepath
	    echo >> $APICLIlogfilepath
        
	fi

}


#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-05-03-2

# MODIFIED 2018-05-03 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# Call command line parameter handler action script
# -------------------------------------------------------------------------------------------------


# MODIFIED 2018-05-02 -
export cli_api_cmdlineparm_handler=cmd_line_parameters_handler.action.common.005.v00.29.00.sh

echo | tee -a -i $APICLIlogfilepath
echo '--------------------------------------------------------------------------' | tee -a -i $APICLIlogfilepath
echo | tee -a -i $APICLIlogfilepath
echo "Calling external Command Line Paramenter Handling Script" | tee -a -i $APICLIlogfilepath
echo | tee -a -i $APICLIlogfilepath

. ./$cli_api_cmdlineparm_handler "$@"

echo | tee -a -i $APICLIlogfilepath
echo "Returned from external Command Line Paramenter Handling Script" | tee -a -i $APICLIlogfilepath
echo | tee -a -i $APICLIlogfilepath

dumpcliparmparseresults "$@"

if [ "$APISCRIPTVERBOSE" = "true" ] && [ "$NOWAIT" != "true" ] ; then
    echo
    read -t $WAITTIME -n 1 -p "Any key to continue.  Automatic continue after $WAITTIME seconds : " anykey
fi

echo | tee -a -i $APICLIlogfilepath
echo "Starting local execution" | tee -a -i $APICLIlogfilepath
echo | tee -a -i $APICLIlogfilepath
echo '--------------------------------------------------------------------------' | tee -a -i $APICLIlogfilepath
echo | tee -a -i $APICLIlogfilepath


#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-05-03

# -------------------------------------------------------------------------------------------------
# Handle request for help and exit
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-05-02 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

#
# Was help requested, if so show it and exit
#
if [ x"$SHOWHELP" = x"true" ] ; then
    # Show Help
    # Done in external Script now
    #doshowhelp
    exit 255 
fi

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-05-02

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

export APICLIlogfilepath=/var/tmp/$ScriptName'_'$APIScriptVersion'_'$DATEDTGS.log

# -------------------------------------------------------------------------------------------------
# Root script declarations
# -------------------------------------------------------------------------------------------------

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# -------------------------------------------------------------------------------------------------
# Call command line parameter handler action script
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-05-03-3 -
export cli_api_cmdlineparm_handler_root=.
export cli_api_cmdlineparm_handler_folder=common
export cli_api_cmdlineparm_handler_file=cmd_line_parameters_handler.action.common.005.v00.29.00.sh

export cli_api_cmdlineparm_handler_path=$cli_api_cmdlineparm_handler_root/$cli_api_cmdlineparm_handler_folder

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

    echo 'Critical Error - Exiting Script !!!!' | tee -a -i $APICLIlogfilepath
    echo 'Critical Error - Exiting Script !!!!' | tee -a -i $APICLIlogfilepath
    echo | tee -a -i $APICLIlogfilepath
    exit 251

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

    else
        echo "Missing jq, not found in ${CPDIR}/jq/jq or /opt/CPshrd-R80/jq/jq" | tee -a -i $APICLIlogfilepath
        exit 1
    fi

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# =================================================================================================
# Validate Actions Script version is correct for caller
# =================================================================================================


if [ x"$APIScriptVersion" = x"$APIActionsScriptVersion" ] ; then
    # Script and Actions Script versions match, go ahead
    echo | tee -a -i $APICLIlogfilepath
    echo 'Verify Actions Scripts Version - OK' | tee -a -i $APICLIlogfilepath
    echo | tee -a -i $APICLIlogfilepath
else
    # Script and Actions Script versions don't match, ALL STOP!
    echo | tee -a -i $APICLIlogfilepath
    echo 'Verify Actions Scripts Version - Missmatch' | tee -a -i $APICLIlogfilepath
    echo 'Calling Script version : '$APIScriptVersion | tee -a -i $APICLIlogfilepath
    echo 'Actions Script version : '$APIActionsScriptVersion | tee -a -i $APICLIlogfilepath
    echo | tee -a -i $APICLIlogfilepath
    exit 255
fi



\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

    if [ "$SUBEXITCODE" != "0" ] ; then
    
        echo | tee -a -i $APICLIlogfilepath
        echo "Terminating script..." | tee -a -i $APICLIlogfilepath
        echo "Exitcode $SUBEXITCODE" | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
        exit $SUBEXITCODE
    
    else
        echo | tee -a -i $APICLIlogfilepath
    fi

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# -------------------------------------------------------------------------------------------------
# End of procedures block
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# variable JQ points to where jq is installed
export JQ=${CPDIR}/jq/jq

ConfigureJQLocation

export currentapisslport=$(clish -c "show web ssl-port" | cut -d " " -f 2)
echo 'Current Gaia web ssl-port : '$currentapisslport >> $APICLIlogfilepath

export minapiversionrequired=1.0
export checkapiversion=

ScriptAPIVersionCheck

export APISCRIPTVERBOSE=false
export APISCRIPTVERBOSECHECK=false

CheckAPIScriptVerboseOutput


# -------------------------------------------------------------------------------------------------
# END Initial Script Setup
# -------------------------------------------------------------------------------------------------
# =================================================================================================

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# Wait time in seconds
export WAITTIME=15

#
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/-  MODIFIED 2018-05-02


# =================================================================================================

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# Wait time in seconds
export WAITTIME=15

export APIScriptActionFilePrefix=cli_api_export_objects
#export APIScriptJSONActionFile=$APIScriptActionFilePrefix'_actions_'$APIScriptVersion.sh
#export APIScriptCSVActionFile=$APIScriptActionFilePrefix'_actions_to_csv_'$APIScriptVersion.sh
export APIScriptJSONActionFile=$APIScriptActionFilePrefix'_actions'.sh
export APIScriptCSVActionFile=$APIScriptActionFilePrefix'_actions_to_csv'.sh

# =================================================================================================

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# Wait time in seconds
export WAITTIME=15

#export APIScriptActionFilePrefix=cli_api_export_objects
#export APIScriptJSONActionFile=$APIScriptActionFilePrefix'_actions_'$APIScriptVersion.sh
#export APIScriptCSVActionFile=$APIScriptActionFilePrefix'_actions_to_csv_'$APIScriptVersion.sh


# =================================================================================================

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# =================================================================================================
# END:  Setup Login Parameters and Login to Mgmt_CLI
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

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# Wait time in seconds
export WAITTIME=15

export APIScriptActionFilePrefix=cli_api_export_objects

export APIScriptJSONActionFile=$APIScriptActionFilePrefix'_actions'.sh
#export APIScriptJSONActionFile=$APIScriptActionFilePrefix'_actions_'$APIScriptVersion.sh

export APIScriptCSVActionFile=$APIScriptActionFilePrefix'_actions_to_csv'.sh
#export APIScriptCSVActionFile=$APIScriptActionFilePrefix'_actions_to_csv_'$APIScriptVersion.sh


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

# -------------------------------------------------------------------------------------------------


# =================================================================================================
# END:  Setup Root Parameters
# =================================================================================================
# -------------------------------------------------------------------------------------------------

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# -------------------------------------------------------------------------------------------------
# Configure working paths for export and dump
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-05-02 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

if [ x"$script_use_delete" = x"true" ] ; then
    # primary operation is delete

    export APICLIpathexport=$APICLICSVExportpathbase/delete

    echo | tee -a -i $APICLIlogfilepath
    echo 'Delete using '$primarytargetoutputformat' Starting!' | tee -a -i $APICLIlogfilepath
    
elif [ x"$script_use_import" = x"true" ] ; then
    # primary operation is import

    export APICLIpathexport=$APICLICSVExportpathbase/import

    echo | tee -a -i $APICLIlogfilepath
    echo 'Import using '$primarytargetoutputformat' Starting!' | tee -a -i $APICLIlogfilepath
    
elif [ x"$script_use_export" = x"true" ] ; then
    # primary operation is export

    # primary operation is export to primarytargetoutputformat
    export APICLIpathexport=$APICLICSVExportpathbase/$primarytargetoutputformat

    echo | tee -a -i $APICLIlogfilepath
    echo 'Export to '$primarytargetoutputformat' Starting!' | tee -a -i $APICLIlogfilepath
    
else
    # primary operation is something else

    export APICLIpathexport=$APICLIpathbase

fi

if [ ! -r $APICLIpathexport ] ; then
    mkdir $APICLIpathexport
fi

if [ x"$primarytargetoutputformat" = x"$FileExtJSON" ] ; then
    # for JSON provide the detail level

    export APICLIpathexport=$APICLIpathexport/$APICLIdetaillvl

    if [ ! -r $APICLIpathexport ] ; then
        mkdir $APICLIpathexport
    fi
fi

export APICLICSVpathexportwip=
if [ x"$script_uses_wip" = x"true" ] ; then
    # script uses work-in-progress (wip) folder

    export APICLICSVpathexportwip=$APICLIpathexport/wip
    
    if [ ! -r $APICLICSVpathexportwip ] ; then
        mkdir $APICLICSVpathexportwip
    fi
fi

export APICLIJSONpathexportwip=
if [ x"$script_uses_wip_json" = x"true" ] ; then
    # script uses work-in-progress (wip) folder

    export APICLIJSONpathexportwip=$APICLIpathexport/wip
    
    if [ ! -r $APICLIJSONpathexportwip ] ; then
        mkdir $APICLIJSONpathexportwip
    fi
fi

export APICLIfileexportpost='_'$APICLIdetaillvl'_'$APICLIfileexportsuffix

export APICLICSVheaderfilesuffix=header

export APICLICSVfileexportpost='_'$APICLIdetaillvl'_'$APICLICSVfileexportsuffix

export APICLIJSONheaderfilesuffix=header
export APICLIJSONfooterfilesuffix=footer

export APICLIJSONfileexportpost='_'$APICLIdetaillvl'_'$APICLIJSONfileexportsuffix

echo 'Dump "'$APICLIdetaillvl'" details to path:  '$APICLIpathexport | tee -a -i $APICLIlogfilepath
echo | tee -a -i $APICLIlogfilepath

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-05-02

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# MODIFIED 2018-05-02 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

if [ ! -r $APICLICSVExportpathbase ] ; then
    mkdir $APICLICSVExportpathbase
fi

# primary operation is export to primarytargetoutputformat
export APICLIpathexport=$APICLICSVExportpathbase/$primarytargetoutputformat

if [ ! -r $APICLIpathexport ] ; then
    mkdir $APICLIpathexport
fi

if [ x"$primarytargetoutputformat" = x"$FileExtJSON" ] ; then
    # for JSON provide the detail level

    export APICLIpathexport=$APICLIpathexport/$APICLIdetaillvl

    if [ ! -r $APICLIpathexport ] ; then
        mkdir $APICLIpathexport
    fi
fi

export APICLICSVpathexportwip=
if [ x"$script_uses_wip" = x"true" ] ; then
    # script uses work-in-progress (wip) folder

    export APICLICSVpathexportwip=$APICLIpathexport/wip
    
    if [ ! -r $APICLICSVpathexportwip ] ; then
        mkdir $APICLICSVpathexportwip
    fi
fi

export APICLIJSONpathexportwip=
if [ x"$script_uses_wip_json" = x"true" ] ; then
    # script uses work-in-progress (wip) folder

    export APICLIJSONpathexportwip=$APICLIpathexport/wip
    
    if [ ! -r $APICLIJSONpathexportwip ] ; then
        mkdir $APICLIJSONpathexportwip
    fi
fi

export APICLIfileexportpost='_'$APICLIdetaillvl'_'$APICLIfileexportsuffix

export APICLICSVheaderfilesuffix=header

export APICLICSVfileexportpost='_'$APICLIdetaillvl'_'$APICLICSVfileexportsuffix

export APICLIJSONheaderfilesuffix=header
export APICLIJSONfooterfilesuffix=footer

export APICLIJSONfileexportpost='_'$APICLIdetaillvl'_'$APICLIJSONfileexportsuffix


echo
echo 'Dump to '$primarytargetoutputformat' Starting!'
echo 'Dump "'$APICLIdetaillvl'" details to path:  '$APICLIpathexport
echo

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-05-02

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

