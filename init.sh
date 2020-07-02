function showMessage(){
    echo "*************"
    echo "************* $1"
    echo "*************"
}

showMessage "Let's init a new custom theme based on ScandiPWA"

CWD=`pwd`
THEME_NAMESPACE=Scandiweb
THEME_NAME=pwa
CUSTOM_THEME_PATH=app/design/frontend/$THEME_NAMESPACE/$THEME_NAME

git init

showMessage "Clone base-theme as base for our custom theme"
git clone -b 2.x-stable --depth=1 git@github.com:scandipwa/base-theme.git $CUSTOM_THEME_PATH

rm -rf $CUSTOM_THEME_PATH/.git
rm -rf $CUSTOM_THEME_PATH/.github
rm -rf $CUSTOM_THEME_PATH/.vscode
rm -rf $CUSTOM_THEME_PATH/.all-contributorsrc
rm -rf $CUSTOM_THEME_PATH/.babelrc
rm -rf $CUSTOM_THEME_PATH/.graphqlconfig
rm -rf $CUSTOM_THEME_PATH/composer.json
rm -rf $CUSTOM_THEME_PATH/EmptyModule.js
rm -rf $CUSTOM_THEME_PATH/LICENSE
rm -rf $CUSTOM_THEME_PATH/process-core.yml
rm -rf $CUSTOM_THEME_PATH/src/app
rm -rf $CUSTOM_THEME_PATH/src/sw

cat > $CUSTOM_THEME_PATH/README.md << EOF
# Custom theme $1/$2
EOF

cd $CUSTOM_THEME_PATH
npm ci
cd $CWD

showMessage "Add reverse proxy project"
git submodule add --force -b reverse-proxy git@github.com:astik/scandipwa-init-front.git reverse-proxy
cd reverse-proxy
npm ci
cd $CWD

showMessage "Add base-theme for codefallback"
git submodule add --force -b 2.x-stable git@github.com:scandipwa/base-theme.git vendor/scandipwa/source

showMessage "Everything ready, please refer to README.md for the next steps"
