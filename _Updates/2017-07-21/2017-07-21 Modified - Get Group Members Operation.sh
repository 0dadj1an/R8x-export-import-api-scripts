# -------------------------------------------------------------------------------------------------
# group members
# -------------------------------------------------------------------------------------------------

export APICLIobjecttype=group-members

# MODIFIED 2017-07-21 \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
#

# -------------------------------------------------------------------------------------------------
# SetupGetGroupMembers proceedure
# -------------------------------------------------------------------------------------------------

#
# SetupGetGroupMembers

SetupGetGroupMembers () {

    #
    # APICLICSVsortparms can change due to the nature of the object
    #
    export APICLICSVsortparms='-f -t , -k 1,2'
    
    export CSVFileHeader='"name","members.add"'
    
    SetupExportObjectsToCSVviaJQ
    
    return 0
}
    
# -------------------------------------------------------------------------------------------------
# FinalizeGetGroupMembers proceedure
# -------------------------------------------------------------------------------------------------

#
# FinalizeGetGroupMembers

FinalizeGetGroupMembers () {

    FinalizeExportObjectsToCSVviaJQ
    errorreturn=$?
    if [ $errorreturn != 0 ] ; then
        # Something went wrong, terminate
        exit $errorreturn
    fi
    
    return 0
}
    
# -------------------------------------------------------------------------------------------------
# GetArrayOfGroupObjects proceedure
# -------------------------------------------------------------------------------------------------

#
# GetArrayOfGroupObjects generates an array of group objects for further processing.

GetArrayOfGroupObjects () {
    
    #
    # APICLICSVsortparms can change due to the nature of the object
    #
    export APICLIobjecttype=groups
    
    echo
    echo 'Generate array of groups'
    echo
    
    currentoffset=0

    # MGMT_CLI_GROUPS_STRING is a string with multiple lines. Each line contains a name of a group members.
    # in this example the output of mgmt_cli is not sent to a file, instead it is passed to jq directly using a pipe.
    
    MGMT_CLI_GROUPS_STRING="`mgmt_cli show groups limit $APICLIObjectLimit offset $currentoffset details-level full -s $APICLIsessionfile --format json | $JQ ".objects[].name | @sh" -r`"
    
    # break the string into an array - each element of the array is a line in the original string
    # there are simpler ways, but this way allows the names to contain spaces. Gaia's bash version is 3.x so readarray is not available
    
    ARR=()
    while read -r line; do
        ARR+=("$line")
        echo -n '.'
    done <<< "$MGMT_CLI_GROUPS_STRING"
    echo
    
    return 0
}


# -------------------------------------------------------------------------------------------------
# DumpArrayOfGroupObjects proceedure
# -------------------------------------------------------------------------------------------------

#
# DumpArrayOfGroupObjects outputs the array of group objects.

DumpArrayOfGroupObjects () {
    
    # print the elements in the array
    echo
    echo Groups
    echo
#    echo >> $APICLIlogfilepath
#    echo Groups >> $APICLIlogfilepath
#    echo >> $APICLIlogfilepath
    
    for i in "${ARR[@]}"
    do
        echo "$i, ${i//\'/}"
#        echo "$i, ${i//\'/}" >> $APICLIlogfilepath
    done
    
    return 0
}


# -------------------------------------------------------------------------------------------------
# CollectMembersInGroupObjects proceedure
# -------------------------------------------------------------------------------------------------

#
# CollectMembersInGroupObjects outputs the number of group members in a group in the array of group objects and collects them into the csv file.

CollectMembersInGroupObjects () {
    
    #
    # using bash variables in a jq expression
    #
    
    echo
    echo 'Use array of groups to generate group members CSV'
    echo
#    echo >> $APICLIlogfilepath
#    echo 'Use array of groups to count group members in each group' >> $APICLIlogfilepath
#    echo >> $APICLIlogfilepath
    
    for i in "${ARR[@]}"
    do
        echo
        echo Group "${i//\'/}"
    
        MEMBERS_COUNT=$(mgmt_cli show group name "${i//\'/}" -s $APICLIsessionfile --format json | $JQ ".members | length")
    
        echo Group "${i//\'/}"' number of members = '"$MEMBERS_COUNT"
#        echo Group "${i//\'/}"' number of members = '"$MEMBERS_COUNT" >> $APICLIlogfilepath
   
        COUNTER=0
        
        while [ $COUNTER -lt $MEMBERS_COUNT ]; do
    
            MEMBER_NAME=$(mgmt_cli show group name ${i//\'/} -s $APICLIsessionfile --format json | $JQ ".members[$COUNTER].name")
            
            echo -n '.'
            echo ${i//\'/},$MEMBER_NAME >> $APICLICSVfiledata
#            echo ${i//\'/},$MEMBER_NAME >> $APICLIlogfilepath
    
            let COUNTER=COUNTER+1
    
        done
    
    done
    
    
    return 0
}


# -------------------------------------------------------------------------------------------------
# GetGroupMembers proceedure
# -------------------------------------------------------------------------------------------------

#
# GetGroupMembers generate output of group members from existing group objects

GetGroupMembers () {

    SetupGetGroupMembers

    GetArrayOfGroupObjects

    DumpArrayOfGroupObjects

    CollectMembersInGroupObjects

    FinalizeGetGroupMembers

}
    
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

objectstotal_groups=$(mgmt_cli show $APICLIobjectstype limit 1 offset 0 details-level "standard" --format json -s $APICLIsessionfile | $JQ ".total")
export number_groups="$objectstotal_groups"

if [ $number_groups -le 0 ] ; then
    # No groups found
    echo
    echo 'No groups to generate members from!'
    echo
    echo >> $APICLIlogfilepath
    echo 'No groups to generate members from!' >> $APICLIlogfilepath
    echo >> $APICLIlogfilepath
else
    GetGroupMembers
fi

#
# /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ MODIFIED 2017-07-21


