# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# handle complex objects
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# ADD 2017-08-03  \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#
# -------------------------------------------------------------------------------------------------
# host interfaces
# -------------------------------------------------------------------------------------------------

export APICLIobjecttype=host-interfaces
export APICLIobjectstype=hosts

# -------------------------------------------------------------------------------------------------
# SetupGetHostInterfaces proceedure
# -------------------------------------------------------------------------------------------------

#
# SetupGetHostInterfaces

SetupGetHostInterfaces () {

    #
    # APICLICSVsortparms can change due to the nature of the object
    #
    export APICLICSVsortparms='-f -t , -k 1,1'
    
    export CSVFileHeader='"name","interfaces.add.name"'
    #export CSVFileHeader=$CSVFileHeader',"interfaces.add.subnet4","interfaces.add.mask-length4","interfaces.add.subnet-mask"'
    export CSVFileHeader=$CSVFileHeader',"interfaces.add.subnet4","interfaces.add.mask-length4"'
    export CSVFileHeader=$CSVFileHeader',"interfaces.add.subnet6","interfaces.add.mask-length6"'
    export CSVFileHeader=$CSVFileHeader',"interfaces.add.color","interfaces.add.comments"'
    
    export CSVJQparms='.["name"], .["interfaces"]['$COUNTER']["name"]'
    #export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["subnet4"], .["interfaces"]['$COUNTER']["mask-length4"], .["interfaces"]['$COUNTER']["subnet-mask"]'
    export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["subnet4"], .["interfaces"]['$COUNTER']["mask-length4"]'
    export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["subnet6"], .["interfaces"]['$COUNTER']["mask-length6"]'
    export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["color"], .["interfaces"]['$COUNTER']["comments"]'

    SetupExportObjectsToCSVviaJQ
    
    return 0
}
    
# -------------------------------------------------------------------------------------------------
# FinalizeGetHostInterfaces proceedure
# -------------------------------------------------------------------------------------------------

#
# FinalizeGetHostInterfaces

FinalizeGetHostInterfaces () {

    FinalizeExportObjectsToCSVviaJQ
    errorreturn=$?
    if [ $errorreturn != 0 ] ; then
        # Something went wrong, terminate
        exit $errorreturn
    fi
    
    return 0
}
    
# -------------------------------------------------------------------------------------------------
# PopulateArrayOfHostInterfaces proceedure
# -------------------------------------------------------------------------------------------------

#
# PopulateArrayOfHostInterfaces populates array of host objects for further processing.

PopulateArrayOfHostInterfaces () {
    
    #
    # APICLICSVsortparms can change due to the nature of the object
    #

    # MGMT_CLI_HOSTS_STRING is a string with multiple lines. Each line contains a name of a host.
    # in this example the output of mgmt_cli is not sent to a file, instead it is passed to jq directly using a pipe.
    
    MGMT_CLI_HOSTS_STRING="`mgmt_cli show hosts limit $APICLIObjectLimit offset $currenthostoffset details-level "standard" -s $APICLIsessionfile --format json | $JQ ".objects[].name | @sh" -r`"
    
    # break the string into an array - each element of the array is a line in the original string
    # there are simpler ways, but this way allows the names to contain spaces. Gaia's bash version is 3.x so readarray is not available
    
    while read -r line; do

        ALLHOSTSARR+=("$line")

        echo -n '.'

        arraylength=${#ALLHOSTSARR[@]}
        arrayelement=$((arraylength-1))
        

        if [ x"$APISCRIPTVERBOSE" = x"TRUE" ] ; then
            # Verbose mode ON
            # Output list of all hosts found
            echo -n "$line"' '
            echo -n "$(eval echo $line)"' '
            echo -n "$arraylength"' '
            echo -n "$arrayelement"' '
            #echo -n "$(eval echo ${ALLHOSTARR[${arrayelement}]})"' '
        fi

        #INTERFACES_COUNT=$(mgmt_cli show host name "$(eval echo ${ALLHOSTARR[${arrayelement}]})" details-level "full" -s $APICLIsessionfile --format json | $JQ ".interfaces | length")
        INTERFACES_COUNT=$(mgmt_cli show host name "$(eval echo $line)" details-level "full" -s $APICLIsessionfile --format json | $JQ ".interfaces | length")

        NUM_HOST_INTERFACES=$INTERFACES_COUNT

        if [ x"$APISCRIPTVERBOSE" = x"TRUE" ] ; then
            # Verbose mode ON
            echo -n $NUM_HOST_INTERFACES' '
        fi

        if [ $NUM_HOST_INTERFACES -gt 0 ]; then
            HOSTSARR+=("$line")
            if [ x"$APISCRIPTVERBOSE" != x"TRUE" ] ; then
                echo -n $NUM_HOST_INTERFACES
            fi
            echo -n '!'
        fi

         if [ x"$APISCRIPTVERBOSE" = x"TRUE" ] ; then
            # Verbose mode ON
            echo
        fi

    done <<< "$MGMT_CLI_HOSTS_STRING"
    
    return 0
}


# -------------------------------------------------------------------------------------------------
# GetArrayOfHostInterfaces proceedure
# -------------------------------------------------------------------------------------------------

#
# GetArrayOfHostInterfaces generates an array of host objects for further processing.

GetArrayOfHostInterfaces () {
    
    echo
    echo 'Generate array of hosts'
    echo
    
    HOSTSARR=()
    ALLHOSTSARR=()

    export MgmtCLI_Base_OpParms="--format json -s $APICLIsessionfile"
    export MgmtCLI_IgnoreErr_OpParms="ignore-warnings true ignore-errors true --ignore-errors true"
    
    export MgmtCLI_Show_OpParms="details-level \"$APICLIdetaillvl\" $MgmtCLI_Base_OpParms"
    
    objectstotal=$(mgmt_cli show $APICLIobjectstype limit 1 offset 0 details-level "standard" $MgmtCLI_Base_OpParms | $JQ ".total")

    objectstoshow=$objectstotal

    echo "Processing $objectstoshow $APICLIobjectstype objects in $APICLIObjectLimit object chunks:"

    objectslefttoshow=$objectstoshow

    currenthostoffset=0

    while [ $objectslefttoshow -ge 1 ] ; do
        # we have objects to process
        echo "  Now processing up to next $APICLIObjectLimit $APICLIobjecttype objects starting with object $currenthostoffset of $objectslefttoshow remaining!"

        PopulateArrayOfHostInterfaces
        errorreturn=$?
        if [ $errorreturn != 0 ] ; then
            # Something went wrong, terminate
            exit $errorreturn
        fi

        objectslefttoshow=`expr $objectslefttoshow - $APICLIObjectLimit`
        currenthostoffset=`expr $currenthostoffset + $APICLIObjectLimit`
    done

    echo
    
    return 0
}


# -------------------------------------------------------------------------------------------------
# DumpArrayOfHostsObjects proceedure
# -------------------------------------------------------------------------------------------------

#
# DumpArrayOfHostsObjects outputs the array of host objects.

DumpArrayOfHostsObjects () {
    
    # print the elements in the array
    echo
    echo All hosts
    echo
    #echo >> $APICLIlogfilepath
    #echo All hosts >> $APICLIlogfilepath
    #echo >> $APICLIlogfilepath
    
    for i in "${ALLHOSTSARR[@]}"
    do
        if [ x"$APISCRIPTVERBOSE" = x"TRUE" ] ; then
            # Verbose mode ON
            # Output list of all hosts found
            echo "$i, ${i//\'/}"
        fi
        #echo "$i, ${i//\'/}" >> $APICLIlogfilepath
    done
    
    echo
    echo hosts with interfaces defined
    echo
    #echo >> $APICLIlogfilepath
    #echo hosts with interfaces defined >> $APICLIlogfilepath
    #echo >> $APICLIlogfilepath
    
    for j in "${HOSTSARR[@]}"
    do
        echo "$j, ${j//\'/}"
        #echo "$j, ${j//\'/}" >> $APICLIlogfilepath
    done
    
    echo
    echo Done dumping hosts
    echo
    #echo >> $APICLIlogfilepath
    #echo Done dumping hosts >> $APICLIlogfilepath
    #echo >> $APICLIlogfilepath
    
    return 0
}


# -------------------------------------------------------------------------------------------------
# CollectInterfacesInHostObjects proceedure
# -------------------------------------------------------------------------------------------------

#
# CollectInterfacesInHostObjects outputs the host interfaces in a host in the array of host objects and collects them into the csv file.

CollectInterfacesInHostObjects () {
    
    #
    # using bash variables in a jq expression
    #
    
    echo
    echo 'Use array of hosts to generate host interfaces CSV'
    echo
    #echo >> $APICLIlogfilepath
    #echo 'Use array of hosts to export interfaces in each host' >> $APICLIlogfilepath
    #echo >> $APICLIlogfilepath
    
    for i in "${HOSTSARR[@]}"
    do
        echo
        echo Host with interfaces "${i//\'/}"
    
        INTERFACES_COUNT=$(mgmt_cli show host name "${i//\'/}" -s $APICLIsessionfile --format json | $JQ ".interfaces | length")

        NUM_HOST_INTERFACES=$INTERFACES_COUNT
    
        if [ $NUM_HOST_INTERFACES -gt 0 ]; then
            # More than zero (0) interfaces, something to process
            echo host "${i//\'/}"' number of interfaces = '"$NUM_HOST_INTERFACES"
            #echo host "${i//\'/}"' number of interfaces = '"$NUM_HOST_INTERFACES" >> $APICLIlogfilepath
       
            COUNTER=0
            echo $CSVFileHeader
            
            while [ $COUNTER -lt $NUM_HOST_INTERFACES ]; do
        
                #echo -n '.'
    
                #export CSVJQparms='.["name"], .["interfaces"]['$COUNTER']["name"]'
                ##export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["subnet4"], .["interfaces"]['$COUNTER']["mask-length4"], .["interfaces"]['$COUNTER']["subnet-mask"]'
                #export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["subnet4"], .["interfaces"]['$COUNTER']["mask-length4"],
                #export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["subnet6"], .["interfaces"]['$COUNTER']["mask-length6"]'
                #export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["color"], .["interfaces"]['$COUNTER']["comments"]'

                #mgmt_cli show host name BeasleyQNAP-01 details-level "full" --format json -r true | $CPDIR/jq/jq '.["interfaces"][0]["mask-length4"]'

                INTERFACE_NAME=$(mgmt_cli show host name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["name"]')
                INTERFACE_subnet4=$(mgmt_cli show host name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["subnet4"]')
                INTERFACE_masklength4=$(mgmt_cli show host name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["mask-length4"]')
                INTERFACE_subnetmask=$(mgmt_cli show host name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["subnet-mask"]')
                INTERFACE_subnet6=$(mgmt_cli show host name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["subnet6"]')
                INTERFACE_masklength6=$(mgmt_cli show host name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["mask-length6"]')
                INTERFACE_COLOR=$(mgmt_cli show host name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["color"]')
                INTERFACE_COMMENT=$(mgmt_cli show host name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["comments"]')
                
                export CSVoutputline="${i//\'/}","$INTERFACE_NAME"
                #export CSVoutputline=$CSVoutputline,"$INTERFACE_subnet4","$INTERFACE_masklength4","$INTERFACE_subnetmask"
                export CSVoutputline=$CSVoutputline,"$INTERFACE_subnet4","$INTERFACE_masklength4"
                export CSVoutputline=$CSVoutputline,"$INTERFACE_subnet6","$INTERFACE_masklength6"
                export CSVoutputline=$CSVoutputline,"$INTERFACE_COLOR","$INTERFACE_COMMENT"
                
                echo $CSVoutputline
                echo $CSVoutputline >> $APICLICSVfiledata
                #echo $CSVoutputline >> $APICLIlogfilepath
        
                let COUNTER=COUNTER+1
        
            done
        else
            echo
        fi
    
    done
    
    
    return 0
}


# -------------------------------------------------------------------------------------------------
# GetHostInterfaces proceedure
# -------------------------------------------------------------------------------------------------

#
# GetHostInterfaces generate output of host's interfaces from existing hosts with interface objects

GetHostInterfaces () {

    SetupGetHostInterfaces

    GetArrayOfHostInterfaces

    DumpArrayOfHostsObjects

    CollectInterfacesInHostObjects

    FinalizeGetHostInterfaces

}
    
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

objectstotal_hosts=$(mgmt_cli show hosts limit 1 offset 0 details-level "standard" --format json -s $APICLIsessionfile | $JQ ".total")
export number_hosts="$objectstotal_hosts"

if [ $number_hosts -le 0 ] ; then
    # No hosts found
    echo
    echo 'No hosts to generate interfaces from!'
    echo
    echo >> $APICLIlogfilepath
    echo 'No hosts to generate interfaces from!' >> $APICLIlogfilepath
    echo >> $APICLIlogfilepath
else
    GetHostInterfaces
fi

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\  ADD 2017-08-03


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# no more complex objects
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

