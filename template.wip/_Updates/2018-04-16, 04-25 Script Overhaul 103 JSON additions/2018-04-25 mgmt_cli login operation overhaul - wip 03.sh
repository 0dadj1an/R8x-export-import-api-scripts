    if [ x"$CLIparm_password" != x"" ] ; then
        # Handle password parameter
        export loginparmstring=$loginparmstring" password \"$CLIparm_password\""

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
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Domain and Management and Port'
                        echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" domain "$CLIparm_domain" -m "$CLIparm_mgmt" --port $CLIparm_websslport > $APICLIsessionfile
                    EXITCODE=$?
      
                else
      
                    #
                    # Testing - Dump login string bullt from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Domain and Port'
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" domain "$CLIparm_domain" --port $CLIparm_websslport > $APICLIsessionfile
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
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Domain and Management'
                        echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" domain "$CLIparm_domain" -m "$CLIparm_mgmt" > $APICLIsessionfile
                    EXITCODE=$?
      
                else
      
                    #
                    # Testing - Dump login string bullt from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Domain'
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" domain "$CLIparm_domain" > $APICLIsessionfile
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
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Management and Port'
                        echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" --port $CLIparm_websslport -m "$CLIparm_mgmt" > $APICLIsessionfile
                    EXITCODE=$?
      
                else
      
                    #
                    # Testing - Dump login string bullt from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password and Port'
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" --port $CLIparm_websslport > $APICLIsessionfile
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
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" -m "$CLIparm_mgmt" > $APICLIsessionfile
                    EXITCODE=$?
      
                else
      
                    #
                    # Testing - Dump login string bullt from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Password'
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin password "$CLIparm_password" > $APICLIsessionfile
                    EXITCODE=$?
      
                fi
            fi
        fi
    else
        # Handle NO password parameter

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
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Domain and Management and Port'
                        echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin domain "$CLIparm_domain" -m "$CLIparm_mgmt" --port $CLIparm_websslport > $APICLIsessionfile
                    EXITCODE=$?
      
                else
      
                    #
                    # Testing - Dump login string bullt from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Domain and Port'
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin domain "$CLIparm_domain" --port $CLIparm_websslport > $APICLIsessionfile
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
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Domain and Management'
                        echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin domain "$CLIparm_domain" -m "$CLIparm_mgmt" > $APICLIsessionfile
                    EXITCODE=$?
      
                else
      
                    #
                    # Testing - Dump login string bullt from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Domain'
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin domain "$CLIparm_domain" > $APICLIsessionfile
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
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Management and Port'
                        echo 'Execute operations with mgmttarget '\"$mgmttarget\"
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin --port $CLIparm_websslport -m "$CLIparm_mgmt" > $APICLIsessionfile
                    EXITCODE=$?
      
                else
      
                    #
                    # Testing - Dump login string bullt from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User with Port'
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin --port $CLIparm_websslport > $APICLIsessionfile
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
                    
                    mgmt_cli login user $APICLIadmin -m "$CLIparm_mgmt" > $APICLIsessionfile
                    EXITCODE=$?
      
                else
      
                    #
                    # Testing - Dump login string bullt from parameters
                    #
                    if [ x"$APISCRIPTVERBOSE" = x"true" ] ; then
                        echo 'Execute login with loginparmstring '\"$loginparmstring\"' As User'
                        echo
                    fi
                    
                    mgmt_cli login user $APICLIadmin > $APICLIsessionfile
                    EXITCODE=$?
      
                fi
            fi
        fi
    fi
