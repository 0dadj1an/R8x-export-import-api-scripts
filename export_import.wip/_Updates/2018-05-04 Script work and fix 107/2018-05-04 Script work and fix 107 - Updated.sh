
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

 > $APICLIsessionfile 2>> $APICLIlogfilepath


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

 > $APICLIsessionfile 2>> $APICLIlogfilepath

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

    export loginstring=
    export loginparmstring=
    
# MODIFIED 2018-05-04 -
    export APICLIsessionerrorfile=id.`date +%Y%m%d-%H%M%S%Z`.err

# MODIFIED 2018-05-03 -
    if [ ! -z "$CLIparm_sessionidfile" ] ; then

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

HandleMgmtCLILogout () {
    #
    # HandleMgmtCLILogout - Logout from mgmt_cli, also cleanup session file
    #

    echo | tee -a -i $APICLIlogfilepath
    echo 'Logout of mgmt_cli!  Then remove session file : '$APICLIsessionfile | tee -a -i $APICLIlogfilepath
    echo | tee -a -i $APICLIlogfilepath
    mgmt_cli logout -s $APICLIsessionfile | tee -a -i $APICLIlogfilepath
    
    rm $APICLIsessionfile | tee -a -i $APICLIlogfilepath
    rm $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath
    
    return 0
}

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

 > $APICLIsessionfile 2>> $APICLIsessionerrorfile
            EXITCODE=$?
            cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

 > $APICLIsessionfile 2>> $APICLIsessionerrorfile
                    EXITCODE=$?
                    cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

 > $APICLIsessionfile 2>> $APICLIlogfilepath
                    EXITCODE=$?
                    cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# -------------------------------------------------------------------------------------------------
# HandleMgmtCLILogin - Login to the API via mgmt_cli login
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-05-04-3 -\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
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
    
# MODIFIED 2018-05-04 -
    export APICLIsessionerrorfile=id.`date +%Y%m%d-%H%M%S%Z`.err

# MODIFIED 2018-05-03 -
    if [ ! -z "$CLIparm_sessionidfile" ] ; then
        # CLIparm_sessionidfile value is set so use it
        export APICLIsessionfile=$CLIparm_sessionidfile
    else
        # Updated to make session id file unique in case of multiple admins running script from same folder
        export APICLIsessionfile=id.`date +%Y%m%d-%H%M%S%Z`.txt
    fi

# MODIFIED 2018-05-03 -
    export domainnamenospace=
    if [ ! -z "$domaintarget" ] ; then
        # Handle domain name that might include space if the value is set
        #export domainnamenospace="$(echo -e "${domaintarget}" | tr -d '[:space:]')"
        #export domainnamenospace=$(echo -e ${domaintarget} | tr -d '[:space:]')
        export domainnamenospace=$(echo -e ${domaintarget} | tr ' ' '_')
    else
        export domainnamenospace=
    fi
    
    if [ ! -z "$domainnamenospace" ] ; then
        # Handle domain name that might include space
        if [ ! -z "$CLIparm_sessionidfile" ] ; then
            # adjust if CLIparm_sessionidfile was set, since that might be a complete path, append the path to it 
            export APICLIsessionfile=$APICLIsessionfile.$domainnamenospace
        else
            # assume the session file is set to a local file and prefix the domain to it
            export APICLIsessionfile=$domainnamenospace.$APICLIsessionfile
        fi
    fi
    
    echo | tee -a -i $APICLIlogfilepath
    echo 'APICLIwebsslport  :  '$APICLIwebsslport | tee -a -i $APICLIlogfilepath
    echo 'Domain Target     :  '$domaintarget | tee -a -i $APICLIlogfilepath
    echo 'Domain no space   :  '$domainnamenospace | tee -a -i $APICLIlogfilepath
    echo 'APICLIsessionfile :  '$APICLIsessionfile | tee -a -i $APICLIlogfilepath
    
    echo | tee -a -i $APICLIlogfilepath
    echo 'mgmt_cli Login!' | tee -a -i $APICLIlogfilepath
    echo | tee -a -i $APICLIlogfilepath

    if [ x"$CLIparm_rootuser" = x"true" ] ; then
        # Handle if ROOT User -r true parameter
        
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
            
            mgmt_cli login -r true domain "$domaintarget" --port $APICLIwebsslport > $APICLIsessionfile 2>> $APICLIsessionerrorfile
            EXITCODE=$?
            cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath
        else
            #
            # Testing - Dump login string built from parameters
            #
            if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                echo 'Execute login with loginparmstring '\"$loginparmstring\"' As Root'
                echo
            fi
            
            mgmt_cli login -r true --port $APICLIwebsslport > $APICLIsessionfile 2>> $APICLIsessionerrorfile
            EXITCODE=$?
            cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath
        fi
    else
        # Handle User
    
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
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" domain "$domaintarget" -m "$CLIparm_mgmt" --port $APICLIwebsslport > $APICLIsessionfile 2>> $APICLIsessionerrorfile
                    EXITCODE=$?
                    cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath
                else
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Domain' | tee -a -i $APICLIlogfilepath
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" domain "$domaintarget" --port $APICLIwebsslport > $APICLIsessionfile 2>> $APICLIsessionerrorfile
                    EXITCODE=$?
                    cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath
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
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" -m "$CLIparm_mgmt" --port $APICLIwebsslport > $APICLIsessionfile 2>> $APICLIsessionerrorfile
                    EXITCODE=$?
                    cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath
                else
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password' | tee -a -i $APICLIlogfilepath
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" --port $APICLIwebsslport > $APICLIsessionfile 2>> $APICLIsessionerrorfile
                    EXITCODE=$?
                    cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath
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
                    
                    mgmt_cli login user $APICLIadmin domain "$domaintarget" -m "$CLIparm_mgmt" --port $APICLIwebsslport > $APICLIsessionfile 2>> $APICLIsessionerrorfile
                    EXITCODE=$?
                    cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath
                else
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Domain | tee -a -i $APICLIlogfilepath'
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin domain "$domaintarget" --port $APICLIwebsslport > $APICLIsessionfile 2>> $APICLIsessionerrorfile
                    EXITCODE=$?
                    cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath
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
                    
                    mgmt_cli login user $APICLIadmin -m "$CLIparm_mgmt" --port $APICLIwebsslport > $APICLIsessionfile 2>> $APICLIsessionerrorfile
                    EXITCODE=$?
                    cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath
                else
                    #
                    # Testing - Dump login string built from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User' | tee -a -i $APICLIlogfilepath
                        echo | tee -a -i $APICLIlogfilepath
                    fi
                    
                    mgmt_cli login user $APICLIadmin --port $APICLIwebsslport > $APICLIsessionfile 2>> $APICLIsessionerrorfile
                    EXITCODE=$?
                    cat $APICLIsessionerrorfile | tee -a -i $APICLIlogfilepath
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
# \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/-  MODIFIED 2018-05-04-3

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# -------------------------------------------------------------------------------------------------
# Start executing Main operations
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-05-04-2 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

if [ ! -z "$domainnamenospace" ] && [ "$CLIparm_NODOMAINFOLDERS" != "true" ] ; then
    # Handle adding domain name to path for MDM operations
    export APICLIpathexport=$APICLICSVExportpathbase/$domainnamenospace

    if [ ! -r $APICLIpathexport ] ; then
        mkdir $APICLIpathexport
    fi
else
    # NOT adding domain name to path for MDM operations
    export APICLIpathexport=$APICLICSVExportpathbase

    if [ ! -r $APICLIpathexport ] ; then
        mkdir $APICLIpathexport
    fi
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

    export APICLIJSONpathexportwip=
    if [ x"$script_uses_wip_json" = x"true" ] ; then
        # script uses work-in-progress (wip) folder for json
    
        export APICLIJSONpathexportwip=$APICLIpathexport/wip
        
        if [ ! -r $APICLIJSONpathexportwip ] ; then
            mkdir $APICLIJSONpathexportwip
        fi
    fi
else    
    export APICLIJSONpathexportwip=
fi

if [ x"$primarytargetoutputformat" = x"$FileExtCSV" ] ; then
    # for CSV handle specifics, like wip

    export APICLICSVpathexportwip=
    if [ x"$script_uses_wip" = x"true" ] ; then
        # script uses work-in-progress (wip) folder for csv
    
        export APICLICSVpathexportwip=$APICLIpathexport/wip
        
        if [ ! -r $APICLICSVpathexportwip ] ; then
            mkdir $APICLICSVpathexportwip
        fi
    fi
else
    export APICLICSVpathexportwip=
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
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-05-04-2

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# -------------------------------------------------------------------------------------------------
# Configure working paths for export and dump
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-05-04-2 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

if [ ! -z "$domainnamenospace" ] && [ "$CLIparm_NODOMAINFOLDERS" != "true" ] ; then
    # Handle adding domain name to path for MDM operations
    export APICLIpathexport=$APICLICSVExportpathbase/$domainnamenospace

    if [ ! -r $APICLIpathexport ] ; then
        mkdir $APICLIpathexport
    fi
else
    # NOT adding domain name to path for MDM operations
    export APICLIpathexport=$APICLICSVExportpathbase

    if [ ! -r $APICLIpathexport ] ; then
        mkdir $APICLIpathexport
    fi
fi

if [ x"$script_use_delete" = x"true" ] ; then
    # primary operation is delete

    export APICLIpathexport=$APICLIpathexport/delete

    echo | tee -a -i $APICLIlogfilepath
    echo 'Delete using '$primarytargetoutputformat' Starting!' | tee -a -i $APICLIlogfilepath
    
elif [ x"$script_use_import" = x"true" ] ; then
    # primary operation is import

    export APICLIpathexport=$APICLIpathexport/import

    echo | tee -a -i $APICLIlogfilepath
    echo 'Import using '$primarytargetoutputformat' Starting!' | tee -a -i $APICLIlogfilepath
    
elif [ x"$script_use_export" = x"true" ] ; then
    # primary operation is export

    # primary operation is export to primarytargetoutputformat
    export APICLIpathexport=$APICLIpathexport/$primarytargetoutputformat

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

    export APICLIJSONpathexportwip=
    if [ x"$script_uses_wip_json" = x"true" ] ; then
        # script uses work-in-progress (wip) folder for json
    
        export APICLIJSONpathexportwip=$APICLIpathexport/wip
        
        if [ ! -r $APICLIJSONpathexportwip ] ; then
            mkdir $APICLIJSONpathexportwip
        fi
    fi
else    
    export APICLIJSONpathexportwip=
fi

if [ x"$primarytargetoutputformat" = x"$FileExtCSV" ] ; then
    # for CSV handle specifics, like wip

    export APICLICSVpathexportwip=
    if [ x"$script_uses_wip" = x"true" ] ; then
        # script uses work-in-progress (wip) folder for csv
    
        export APICLICSVpathexportwip=$APICLIpathexport/wip
        
        if [ ! -r $APICLICSVpathexportwip ] ; then
            mkdir $APICLICSVpathexportwip
        fi
    fi
else
    export APICLICSVpathexportwip=
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
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-05-04-2

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

if [ ! -z "$domainnamenospace" ] && [ "$CLIparm_NODOMAINFOLDERS" != "true" ] ; then
    # Handle adding domain name to path for MDM operations
    export APICLIpathexport=$APICLICSVExportpathbase/$domainnamenospace

    if [ ! -r $APICLIpathexport ] ; then
        mkdir $APICLIpathexport
    fi
else
    # NOT adding domain name to path for MDM operations
    export APICLIpathexport=$APICLICSVExportpathbase

    if [ ! -r $APICLIpathexport ] ; then
        mkdir $APICLIpathexport
    fi
fi

# primary operation is export to primarytargetoutputformat
export APICLIpathexport=$APICLIpathexport/$primarytargetoutputformat

if [ ! -r $APICLIpathexport ] ; then
    mkdir $APICLIpathexport
fi


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# MODIFIED 2018-05-04-3 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# ------------------------------------------------------------------------
# Set and clear temporary log file
# ------------------------------------------------------------------------

export templogfilepath=/var/tmp/templog_$ScriptName.`date +%Y%m%d-%H%M%S%Z`.log
echo > $templogfilepath

echo 'Configure working paths for export and dump' >> $templogfilepath
echo >> $templogfilepath

echo "domainnamenospace = '$domainnamenospace' " >> $templogfilepath
echo "CLIparm_NODOMAINFOLDERS = '$CLIparm_NODOMAINFOLDERS' " >> $templogfilepath
echo "primarytargetoutputformat = '$primarytargetoutputformat' " >> $templogfilepath
echo "APICLICSVExportpathbase = '$APICLICSVExportpathbase' " >> $templogfilepath
echo "APICLIpathexport = '$APICLIpathexport' " >> $templogfilepath

# ------------------------------------------------------------------------

if [ ! -z "$domainnamenospace" ] && [ "$CLIparm_NODOMAINFOLDERS" != "true" ] ; then
    # Handle adding domain name to path for MDM operations
    export APICLIpathexport=$APICLICSVExportpathbase/$domainnamenospace

    echo 'Handle adding domain name to path for MDM operations' >> $templogfilepath
    echo "APICLIpathexport = '$APICLIpathexport' " >> $templogfilepath

    if [ ! -r $APICLIpathexport ] ; then
        mkdir $APICLIpathexport
    fi
else
    # NOT adding domain name to path for MDM operations
    export APICLIpathexport=$APICLICSVExportpathbase

    echo 'NOT adding domain name to path for MDM operations' >> $templogfilepath
    echo "APICLIpathexport = '$APICLIpathexport' " >> $templogfilepath

    if [ ! -r $APICLIpathexport ] ; then
        mkdir $APICLIpathexport
    fi
fi

# ------------------------------------------------------------------------

if [ x"$script_use_delete" = x"true" ] ; then
    # primary operation is delete

    export APICLIpathexport=$APICLIpathexport/delete

    echo | tee -a -i $APICLIlogfilepath $templogfilepath
    echo 'Delete using '$primarytargetoutputformat' Starting!' | tee -a -i $APICLIlogfilepath $templogfilepath
    
elif [ x"$script_use_import" = x"true" ] ; then
    # primary operation is import

    export APICLIpathexport=$APICLIpathexport/import

    echo | tee -a -i $APICLIlogfilepath $templogfilepath
    echo 'Import using '$primarytargetoutputformat' Starting!' | tee -a -i $APICLIlogfilepath $templogfilepath
    
elif [ x"$script_use_export" = x"true" ] ; then
    # primary operation is export

    # primary operation is export to primarytargetoutputformat
    export APICLIpathexport=$APICLIpathexport/$primarytargetoutputformat

    echo | tee -a -i $APICLIlogfilepath $templogfilepath
    echo 'Export to '$primarytargetoutputformat' Starting!' | tee -a -i $APICLIlogfilepath $templogfilepath
    
else
    # primary operation is something else

    export APICLIpathexport=$APICLIpathbase

fi

if [ ! -r $APICLIpathexport ] ; then
    mkdir $APICLIpathexport
fi

echo >> $templogfilepath
echo 'After Evaluation of script type' >> $templogfilepath
echo "APICLIpathexport = '$APICLIpathexport' " >> $templogfilepath
echo " = '$' " >> $templogfilepath

# ------------------------------------------------------------------------

if [ x"$primarytargetoutputformat" = x"$FileExtJSON" ] ; then
    # for JSON provide the detail level

    export APICLIpathexport=$APICLIpathexport/$APICLIdetaillvl

    if [ ! -r $APICLIpathexport ] ; then
        mkdir $APICLIpathexport
    fi

    export APICLIJSONpathexportwip=
    if [ x"$script_uses_wip_json" = x"true" ] ; then
        # script uses work-in-progress (wip) folder for json
    
        export APICLIJSONpathexportwip=$APICLIpathexport/wip
        
        if [ ! -r $APICLIJSONpathexportwip ] ; then
            mkdir $APICLIJSONpathexportwip
        fi
    fi
else    
    export APICLIJSONpathexportwip=
fi

echo >> $templogfilepath
echo 'After handling json target' >> $templogfilepath
echo "APICLIpathexport = '$APICLIpathexport' " >> $templogfilepath
echo "APICLIJSONpathexportwip = '$APICLIJSONpathexportwip' " >> $templogfilepath

# ------------------------------------------------------------------------

if [ x"$primarytargetoutputformat" = x"$FileExtCSV" ] ; then
    # for CSV handle specifics, like wip

    export APICLICSVpathexportwip=
    if [ x"$script_uses_wip" = x"true" ] ; then
        # script uses work-in-progress (wip) folder for csv
    
        export APICLICSVpathexportwip=$APICLIpathexport/wip
        
        if [ ! -r $APICLICSVpathexportwip ] ; then
            mkdir $APICLICSVpathexportwip
        fi
    fi
else
    export APICLICSVpathexportwip=
fi

echo >> $templogfilepath
echo 'After handling csv target' >> $templogfilepath
echo "APICLIpathexport = '$APICLIpathexport' " >> $templogfilepath
echo "APICLICSVpathexportwip = '$APICLICSVpathexportwip' " >> $templogfilepath

# ------------------------------------------------------------------------

export APICLIfileexportpost='_'$APICLIdetaillvl'_'$APICLIfileexportsuffix

export APICLICSVheaderfilesuffix=header

export APICLICSVfileexportpost='_'$APICLIdetaillvl'_'$APICLICSVfileexportsuffix

export APICLIJSONheaderfilesuffix=header
export APICLIJSONfooterfilesuffix=footer

export APICLIJSONfileexportpost='_'$APICLIdetaillvl'_'$APICLIJSONfileexportsuffix

echo >> $templogfilepath
echo 'Setup other file and path variables' >> $templogfilepath
echo "APICLIfileexportpost = '$APICLIfileexportpost' " >> $templogfilepath
echo "APICLICSVheaderfilesuffix = '$APICLICSVheaderfilesuffix' " >> $templogfilepath
echo "APICLICSVfileexportpost = '$APICLICSVfileexportpost' " >> $templogfilepath
echo "APICLIJSONheaderfilesuffix = '$APICLIJSONheaderfilesuffix' " >> $templogfilepath
echo "APICLIJSONfooterfilesuffix = '$APICLIJSONfooterfilesuffix' " >> $templogfilepath
echo "APICLIJSONfileexportpost = '$APICLIJSONfileexportpost' " >> $templogfilepath

# ------------------------------------------------------------------------

echo >> $templogfilepath

cat $templogfilepath >> $APICLIlogfilepath
rm -v $templogfilepath >> $APICLIlogfilepath

# ------------------------------------------------------------------------

echo 'Dump "'$APICLIdetaillvl'" details to path:  '$APICLIpathexport | tee -a -i $APICLIlogfilepath
echo | tee -a -i $APICLIlogfilepath

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-05-04-3

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# -------------------------------------------------------------------------------------------------
# dumprawcliparms
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-05-03 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

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
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-05-03


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
    dumprawcliparms $@
fi


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

# -------------------------------------------------------------------------------------------------
# Clean-up and exit
# -------------------------------------------------------------------------------------------------

# MODIFIED 2018-05-04 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

echo 'CLI Operations Completed' | tee -a -i $APICLIlogfilepath

if [ x"$CLIparm_CLEANUPWIP" = x"true" ] ; then
    # Remove Work-In-Progress folder and files

    if [ -r $APICLICSVpathexportwip ] ; then
        echo 'Remove CSV Work-In-Progress folder and files' | tee -a -i $APICLIlogfilepath
        echo '   CSV WIP Folder : '$APICLICSVpathexportwip | tee -a -i $APICLIlogfilepath
        rm -v -r $APICLICSVpathexportwip | tee -a -i $APICLIlogfilepath
    fi
    
    if [ -r $APICLIJSONpathexportwip ] ; then
        echo 'Remove JSON Work-In-Progress folder and files' | tee -a -i $APICLIlogfilepath
        echo '   JSON WIP Folder : '$APICLIJSONpathexportwip | tee -a -i $APICLIlogfilepath
        rm -v -r $APICLIJSONpathexportwip | tee -a -i $APICLIlogfilepath
    fi

fi


if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
    # Verbose mode ON

    echo | tee -a -i $APICLIlogfilepath
    #echo "Files in >$apiclipathroot<" | tee -a -i $APICLIlogfilepath
    #ls -alh $apiclipathroot | tee -a -i $APICLIlogfilepath
    #echo | tee -a -i $APICLIlogfilepath

    if [ "$APICLIlogpathbase" != "$APICLIpathbase" ] ; then
        echo "Files in >$APICLIlogpathbase<" | tee -a -i $APICLIlogfilepath
        ls -alhR $APICLIpathbase | tee -a -i $APICLIlogfilepath
        echo | tee -a -i $APICLIlogfilepath
    fi
    
    echo "Files in >$APICLIpathbase<" | tee -a -i $APICLIlogfilepath
    ls -alhR $APICLIpathbase | tee -a -i $APICLIlogfilepath
    echo | tee -a -i $APICLIlogfilepath
fi

echo | tee -a -i $APICLIlogfilepath
echo "Results in directory $APICLIpathbase" | tee -a -i $APICLIlogfilepath
echo "Log output in file $APICLIlogfilepath" | tee -a -i $APICLIlogfilepath
echo | tee -a -i $APICLIlogfilepath

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2018-05-04

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

