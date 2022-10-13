#!/bin/bash



###########################
# $HOME/.config/profanity #
###########################

DotConfigFolder="$HOME/.config/profanity/"

ConfigFile="$DotConfigFolder/profrc"
CustomThemeFolder="$DotConfigFolder/themes"



################################
# $HOME/.local/share/profanity #
################################
DotLocalFolder="$HOME/.local/share/profanity/"


MainLogFile="$DotLocalFolder/logs/profanity.log"
ChatLogFolder="$DotLocalFolder/chatlogs"


PluginFolder="$DotLocalFolder/plugins"
OmemoDB="$DotLocalFolder/omemo"
OtrDB="$DotLocalFolder/otr"
PgpDB="$DotLocalFolder/pgp"
ScriptsFolder="$DotLocalFolder/scripts"

AccountsFile="$DotLocalFolder/accounts"
PluginSettingsFile="$DotLocalFolder/plugin_settings"
PluginThemesFile="$DotLocalFolder/plugin_themes"
ProfidentFile="$DotLocalFolder/profident"




# To call function below, use "CopyLocalShareProfanityFolders {PathToWehereYouWantToCopy}"
function CopyLocalShareProfanityFolders() {
    echo "Copying local share profiles..."
    Path2Copy=$1
    echo "DEBUG2MERDE : $Path2Copy"
    cp -r "$DotLocalFolder" "$Path2Copy"
    echo "Copied local share profiles !"
}

# To call function below, use "CopyConfigProfanityFolders {PathToWehereYouWantToCopy}"
function CopyConfigProfanityFolders() {
    echo "Copying config folders..."
    Path2Copy=$1
    echo "DEBUG2MERDE : $Path2Copy"
    cp -r "$DotConfigFolder" "$Path2Copy"
    echo "Copied config folders !"
}

# To call function below, use "ClearMainLogs"
function ClearMainLogs() {
    rm "$MainLogFile"
    if [ $? -eq 1 ]; 
    then
        echo "Error while clearing logs! Check if log file exists and if you have right to acess it"
    fi
}

# To call function below, use "ClearChatLogs"
function ClearChatLogs() {
    ls "$ChatLogFolder"
    echo "Enter the account you want the chatlogs to be erased (to delete the logs from all the accounts, enter : ALL)"
    read -r Account2Clear


    if [ "$Account2Clear" = "ALL" ]; 
    then
        echo "yeet"
        if [ -d "$ChatLogFolder"  ];
        then
            echo "Deleting the logs from all the accounts..."
            rm -rf "$ChatLogFolder" 
            echo "Done deleting the logs !"

        else
            echo "Chat log folder not found, or other error..."
        fi

    else

        if [ -d "$ChatLogFolder/$Account2Clear" ];
        then
            echo "Deleting the logs for the account $Account2Clear..."
            Account2Clear="$ChatLogFolder/$Account2Clear"
            rm -rf "$Account2Clear"
            echo "Delted the logs for the account $Account2Clear !"
        else
            echo "Error while deleting account logs"
        fi

    fi






    # if [ -f "$ChatLogFolder/$Account2Clear" ]; 
    # then
    #     echo "Clearing chatlogs from $"
    #     rm -f "$ChatLogFolder"


    # else
    #     rm -f "$ChatLogFolder/$Account2Clear"
    # fi
}

# To call function below, use "CopyConfigFile {PathToWehereYouWantToCopy}"
function CopyConfigFile() {
    echo "Copying config file..."
    Path2Copy=$1
    echo "DEBUG2MERDE : $Path2Copy"
    cp -r "$ConfigFile" "$Path2Copy"
    echo "Copied config file !"
}

# To call function below, use "CopyCutomThemeFolder {PathToWehereYouWantToCopy}"
function CopyCutomThemeFolder() {
    echo "Copying theme foler..."
    Path2Copy=$1
    echo "DEBUG2MERDE : $Path2Copy"
    cp -r "$CustomThemeFolder" "$Path2Copy"
    echo "Copied theme foler !"
}

# To call function below, use "CopyPluginFolder {PathToWehereYouWantToCopy}"
function CopyPluginFolder() {
    echo "Copying Plugin folder..."
    Path2Copy=$1
    cp -r "$PluginFolder" "$Path2Copy"
    echo "Copied Plugin folder !"
}

# To call function below, use "CopyOmemoDB {PathToWehereYouWantToCopy}"
function CopyOmemoDB() {
    echo "Copying omemo folder..."
    Path2Copy=$1
    cp -r "$OmemoDB" "$Path2Copy"
    echo "Copied omemo folder !"
}

# To call function below, use "CopyOtrDB {PathToWehereYouWantToCopy}"
function CopyOtrDB() {
    echo "Copying otr folder..."
    Path2Copy=$1
    cp -r "$OtrDB" "$Path2Copy"
    echo "Copied otr folder !"
}

# To call function below, use "CopyPgpDB {PathToWehereYouWantToCopy}"
function CopyPgpDB() {
    echo "Copying pgp folder..."
    Path2Copy=$1
    cp -r "$PgpDB" "$Path2Copy"
    echo "Copied pgp folder !"
}

# To call function below, use "CopyScripts {PathToWehereYouWantToCopy}"
function CopyScripts() {
    echo "Copying scripts folder..."
    Path2Copy=$1
    cp -r "$ScriptsFolder" "$Path2Copy"
    echo "Copied scripts folder !"
}




