repo=$(cat repos-location.txt)

list_webapps() {
    ls ~/$repo/
    echo "ls ~/"$repo"/"
    echo "Enter the name of the webapp you want to update"
    read webapp
    # Check if webapp exists
    if [ -d ~/$repo/$webapp ]; then
        echo "Updating "$webapp
        cd ~/$repo/$webapp
	git pull
	npm i
	npm run build
	pm2 restart $webapp
    else
        echo "Webapp $webapp does not exist"
    fi
}
list_webapps
