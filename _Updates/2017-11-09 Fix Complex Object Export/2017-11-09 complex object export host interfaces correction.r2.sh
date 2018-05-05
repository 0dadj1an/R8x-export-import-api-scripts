# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# handle complex objects
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# ADDED 2017-11-09  \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# SetupExportComplexObjectsToCSVviaJQ
# -------------------------------------------------------------------------------------------------

# The SetupExportComplexObjectsToCSVviaJQ is the setup actions for the script's repeated actions.
#

SetupExportComplexObjectsToCSVviaJQ () {
    #
    # Screen width template for sizing, default width of 80 characters assumed
    #
    #              1111111111222222222233333333334444444444555555555566666666667777777777888888888899999999990
    #    01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
    
    echo
    
    export APICLICSVfilename=$APICLIcomplexobjectstype'_'$APICLIdetaillvl'_csv'$APICLICSVfileexportsufix
    export APICLICSVfile=$APICLIpathexport/$APICLICSVfilename
    export APICLICSVfilewip=$APICLIpathexportwip/$APICLICSVfilename
    export APICLICSVfileheader=$APICLICSVfilewip.$APICLICSVheaderfilesuffix
    export APICLICSVfiledata=$APICLICSVfilewip.data
    export APICLICSVfilesort=$APICLICSVfilewip.sort
    export APICLICSVfileoriginal=$APICLICSVfilewip.original

    
    if [ ! -r $APICLIpathexportwip ] ; then
        mkdir $APICLIpathexportwip
    fi

    if [ -r $APICLICSVfile ] ; then
        rm $APICLICSVfile
    fi
    if [ -r $APICLICSVfileheader ] ; then
        rm $APICLICSVfileheader
    fi
    if [ -r $APICLICSVfiledata ] ; then
        rm $APICLICSVfiledata
    fi
    if [ -r $APICLICSVfilesort ] ; then
        rm $APICLICSVfilesort
    fi
    if [ -r $APICLICSVfileoriginal ] ; then
        rm $APICLICSVfileoriginal
    fi
    
    echo
    echo "Creat $APICLIcomplexobjectstype CSV File : $APICLICSVfile"
    echo
    
    #
    # Troubleshooting output
    #
    if [ x"$APISCRIPTVERBOSE" = x"TRUE" ] ; then
        # Verbose mode ON
        echo
        echo '$CSVFileHeader' - $CSVFileHeader
        echo
    
    fi
    
    echo $CSVFileHeader > $APICLICSVfileheader
    echo
    
    echo
    return 0
    
    #
}


# -------------------------------------------------------------------------------------------------

# The FinalizeExportComplexObjectsToCSVviaJQ is the finaling actions for the script's repeated actions.
#

FinalizeExportComplexObjectsToCSVviaJQ () {
    #
    # Screen width template for sizing, default width of 80 characters assumed
    #
    #              1111111111222222222233333333334444444444555555555566666666667777777777888888888899999999990
    #    01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

    if [ ! -r $APICLICSVfileheader ] ; then
        # Uh, Oh, something went wrong, no header file
        echo
        echo '!!!! Error header file missing : '$APICLICSVfileheader
        echo 'Terminating!'
        echo
        exit 254
        
    elif [ ! -r $APICLICSVfiledata ] ; then
        # Uh, Oh, something went wrong, no data file
        echo
        echo '!!!! Error data file missing : '$APICLICSVfiledata
        echo 'Terminating!'
        echo
        exit 253
        
    fi

    echo
    echo "Sort data and build CSV export file"
    echo
    
    cat $APICLICSVfileheader > $APICLICSVfileoriginal
    cat $APICLICSVfiledata >> $APICLICSVfileoriginal
    
    sort $APICLICSVsortparms $APICLICSVfiledata > $APICLICSVfilesort
    
    cat $APICLICSVfileheader > $APICLICSVfile
    cat $APICLICSVfilesort >> $APICLICSVfile
    
    echo
    echo "Done creating $APICLIcomplexobjectstype CSV File : $APICLICSVfile"
    echo
    
    head $APICLICSVfile
    echo
    echo
   
    
    #              1111111111222222222233333333334444444444555555555566666666667777777777888888888899999999990
    #    01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

    echo
    return 0
    
    #
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\  ADDED 2017-11-09


# MODIFIED 2017-11-09 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# host interfaces
# -------------------------------------------------------------------------------------------------

export APICLIobjecttype=host
export APICLIobjectstype=hosts
export APICLIcomplexobjecttype=host-interface
export APICLIcomplexobjectstype=host-interfaces

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

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

    SetupExportComplexObjectsToCSVviaJQ
    
    return 0
}
    
# -------------------------------------------------------------------------------------------------
# FinalizeGetHostInterfaces proceedure
# -------------------------------------------------------------------------------------------------

#
# FinalizeGetHostInterfaces

FinalizeGetHostInterfaces () {

    FinalizeExportComplexObjectsToCSVviaJQ
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

    echo "  $APICLIobjectstype - Populate up to next $APICLIObjectLimit $APICLIobjecttype objects starting with object $currenthostoffset of $objectslefttoshow remaining!"
    #echo "  $APICLIobjectstype - Populate up to next $APICLIObjectLimit $APICLIobjecttype objects starting with object $currenthostoffset of $objectslefttoshow remaining!" >> $APICLIlogfilepath

    # MGMT_CLI_HOSTS_STRING is a string with multiple lines. Each line contains a name of a host.
    # in this example the output of mgmt_cli is not sent to a file, instead it is passed to jq directly using a pipe.
    
    MGMT_CLI_HOSTS_STRING="`mgmt_cli show $APICLIobjectstype limit $APICLIObjectLimit offset $currenthostoffset details-level "standard" -s $APICLIsessionfile --format json | $JQ ".objects[].name | @sh" -r`"
    
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

        #INTERFACES_COUNT=$(mgmt_cli show $APICLIobjecttype name "$(eval echo ${ALLHOSTARR[${arrayelement}]})" details-level "full" -s $APICLIsessionfile --format json | $JQ ".interfaces | length")
        INTERFACES_COUNT=$(mgmt_cli show $APICLIobjecttype name "$(eval echo $line)" details-level "full" -s $APICLIsessionfile --format json | $JQ ".interfaces | length")

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
            #echo >> $APICLIlogfilepath
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
    #echo >> $APICLIlogfilepath
    #echo 'Generate array of hosts' >> $APICLIlogfilepath
    #echo >> $APICLIlogfilepath
    
    HOSTSARR=()
    ALLHOSTSARR=()

    export MgmtCLI_Base_OpParms="--format json -s $APICLIsessionfile"
    export MgmtCLI_IgnoreErr_OpParms="ignore-warnings true ignore-errors true --ignore-errors true"
    
    export MgmtCLI_Show_OpParms="details-level \"$APICLIdetaillvl\" $MgmtCLI_Base_OpParms"
    
    objectstotal=$(mgmt_cli show $APICLIobjectstype limit 1 offset 0 details-level "standard" $MgmtCLI_Base_OpParms | $JQ ".total")

    objectstoshow=$objectstotal

    echo "Processing $objectstoshow $APICLIobjecttype objects in $APICLIObjectLimit object chunks:"
    #echo "Processing $objectstoshow $APICLIobjecttype objects in $APICLIObjectLimit object chunks:" >> $APICLIlogfilepath

    objectslefttoshow=$objectstoshow

    currenthostoffset=0

    while [ $objectslefttoshow -ge 1 ] ; do
        # we have objects to process
        echo "  Now processing up to next $APICLIObjectLimit $APICLIobjecttype objects starting with object $currenthostoffset of $objectslefttoshow remaining!"
        #echo "  Now processing up to next $APICLIObjectLimit $APICLIobjecttype objects starting with object $currenthostoffset of $objectslefttoshow remaining!" >> $APICLIlogfilepath

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
    #echo >> $APICLIlogfilepath
    
    return 0
}


# -------------------------------------------------------------------------------------------------
# DumpArrayOfHostsObjects proceedure
# -------------------------------------------------------------------------------------------------

#
# DumpArrayOfHostsObjects outputs the array of host objects.

DumpArrayOfHostsObjects () {
    
    if [ x"$APISCRIPTVERBOSE" = x"TRUE" ] ; then
        # Verbose mode ON
        # Output list of all hosts found
    
        # print the elements in the array
        echo
        echo Dump All hosts
        echo
        #echo >> $APICLIlogfilepath
        #echo All hosts >> $APICLIlogfilepath
        #echo >> $APICLIlogfilepath
        
        for i in "${ALLHOSTSARR[@]}"
        do
            echo "$i, ${i//\'/}"
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
        
    fi

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
    
        INTERFACES_COUNT=$(mgmt_cli show $APICLIobjecttype name "${i//\'/}" -s $APICLIsessionfile --format json | $JQ ".interfaces | length")

        NUM_HOST_INTERFACES=$INTERFACES_COUNT
    
        if [ $NUM_HOST_INTERFACES -gt 0 ]; then
            # More than zero (0) interfaces, something to process
            echo host "${i//\'/}"' number of interfaces = '"$NUM_HOST_INTERFACES"
            #echo host "${i//\'/}"' number of interfaces = '"$NUM_HOST_INTERFACES" >> $APICLIlogfilepath
       
            COUNTER=0
            if [ x"$APISCRIPTVERBOSE" = x"TRUE" ] ; then
                # Verbose mode ON
                echo $CSVFileHeader
                #echo $CSVFileHeader >> $APICLIlogfilepath
                fi

            while [ $COUNTER -lt $NUM_HOST_INTERFACES ]; do
        
                #echo -n '.'
    
                #export CSVJQparms='.["name"], .["interfaces"]['$COUNTER']["name"]'
                #export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["subnet4"], .["interfaces"]['$COUNTER']["mask-length4"], .["interfaces"]['$COUNTER']["subnet-mask"]'
                #export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["subnet4"], .["interfaces"]['$COUNTER']["mask-length4"],
                #export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["subnet6"], .["interfaces"]['$COUNTER']["mask-length6"]'
                #export CSVJQparms=$CSVJQparms', .["interfaces"]['$COUNTER']["color"], .["interfaces"]['$COUNTER']["comments"]'

                INTERFACE_NAME=$(mgmt_cli show $APICLIobjecttype name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["name"]')
                INTERFACE_subnet4=$(mgmt_cli show $APICLIobjecttype name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["subnet4"]')
                INTERFACE_masklength4=$(mgmt_cli show $APICLIobjecttype name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["mask-length4"]')
                INTERFACE_subnetmask=$(mgmt_cli show $APICLIobjecttype name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["subnet-mask"]')
                INTERFACE_subnet6=$(mgmt_cli show $APICLIobjecttype name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["subnet6"]')
                INTERFACE_masklength6=$(mgmt_cli show $APICLIobjecttype name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["mask-length6"]')
                INTERFACE_COLOR=$(mgmt_cli show $APICLIobjecttype name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["color"]')
                INTERFACE_COMMENT=$(mgmt_cli show $APICLIobjecttype name ${i//\'/} -s $APICLIsessionfile --format json | $JQ '.["interfaces"]['$COUNTER']["comments"]')
                
                export CSVoutputline="${i//\'/}","$INTERFACE_NAME"
                #export CSVoutputline=$CSVoutputline,"$INTERFACE_subnet4","$INTERFACE_masklength4","$INTERFACE_subnetmask"
                export CSVoutputline=$CSVoutputline,"$INTERFACE_subnet4","$INTERFACE_masklength4"
                export CSVoutputline=$CSVoutputline,"$INTERFACE_subnet6","$INTERFACE_masklength6"
                export CSVoutputline=$CSVoutputline,"$INTERFACE_COLOR","$INTERFACE_COMMENT"
                
                if [ x"$APISCRIPTVERBOSE" = x"TRUE" ] ; then
                    # Verbose mode ON
                    echo $CSVoutputline
                    #echo $CSVoutputline >> $APICLIlogfilepath
                    fi

                echo $CSVoutputline >> $APICLICSVfiledata
                #echo $CSVoutputline >> $APICLIlogfilepath
        
                let COUNTER=COUNTER+1
        
            done
        else
            echo host "${i//\'/}"' number of interfaces = NONE (0 zero)'
            #echo host "${i//\'/}"' number of interfaces = NONE (0 zero)' >> $APICLIlogfilepath
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

objectstotal_hosts=$(mgmt_cli show $APICLIobjectstype limit 1 offset 0 details-level "standard" --format json -s $APICLIsessionfile | $JQ ".total")
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
# -------------------------------------------------------------------------------------------------

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2017-11-09


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# no more complex objects
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

