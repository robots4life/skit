#! /usr/bin/env bash

# run this inside the Devilbox container
# ./shell.sh

# run this script
# chmod +x skit.sh
# ./kit.sh

# ask for dir to install to
clear
script_path="/shared/httpd/shell/skit/"
script_path_files="/shared/httpd/shell/skit/files/"

echo ""
echo ""
echo "Give your SvelteKit project a name."
echo ""
echo ""
read -r name

www_path="/shared/httpd"
project_path="$www_path/$name"

# echo $project_path

clear

echo ""
echo ""
echo " The SvelteKit project will be installed to.."
echo ""
echo ""
echo "$www_path/$name"
echo ""
echo "Ok to proceed? (y)"
echo ""
read -r option
clear

if [[ "$option" == "y" ]]; then
    # do something

    cd "$www_path" || exit 1

    mkdir "$name" || exit 1
    cd "$name" || exit 1

    npm init svelte@next .

    cd "$www_path/$name"

    npm install --verbose

    npm install --save-dev env-cmd --verbose

    # copy /shared/httpd/SHELL/skit/files/ to project folder, this includes the .vscode folder with the settings.json file
    rsync -a "$script_path_files" . || exit 1

    # replace exact SVELTE_KIT_PROJECT_PATH string in file .vscode/settings.json with project $name
    # https://askubuntu.com/a/1007368
    sed -i "s/SVELTE_KIT_PROJECT_PATH/$name/g" .vscode/settings.json

    # replace exact \"svelte-kit dev\" string in file package.json with "env-cmd svelte-kit dev"
    # https://askubuntu.com/a/1007368
    env_cmd_sveltekit_dev="\"env-cmd svelte-kit dev\""
    
    sed -i "s/\"svelte-kit dev\"/$env_cmd_sveltekit_dev/g" package.json

    # add .vscode to .gitignore file
    # https://www.cyberciti.biz/faq/linux-append-text-to-end-of-file/

    echo ".vscode" >> .gitignore

    rm -rf .prettierrc


    echo "**************************************************************"
    echo "**************************************************************"
    echo ""
    echo "Done!"
    echo ""
    read -p "Press [Enter] key to EXIT..."
    echo ""
    echo "**************************************************************"
    echo "**************************************************************"
    clear     

else
    # do something else
    exit 1
fi