scriptPath=$(realpath $0)
configPath=$(dirname $scriptPath)

OPTS=$(getopt -o pfasmt \
	--long output:,plugins,file-types,minimal,functions,all,secret \
	-n 'parse-options' -- "$@")

if [ $? != 0 ]; then
	printf "Failed parsing options." >& 2
	exit 1
fi

eval set -- "$OPTS"

OUTPUT_FILE="$HOME/.vimrc"
PLUGINS=false
FILE_TYPES=false
FUNCTIONS=false
SECRET=false
ALL=false
MINIMAL=false

while true; do
	case "$1" in
		--output ) OUTPUT_FILE="$2"; shift; shift ;;
		-p | --plugins ) PLUGINS=true; shift ;;
		-f | --functions ) FUNCTIONS=true; shift ;;
		-s | --secret ) SECRET=true; shift ;;
		-t | --file-types ) FILE_TYPES=true; shift ;;
		-a | --all ) ALL=true; shift ;;
		-m | --minimal ) MINIMAL=true; shift ;;
		-- ) shift; break ;;
		* ) break ;;
	esac
done

FTPLUGIN=(
"blade.vim"
"markdown.vim"
"gitcommit.vim"
"haskell.vim"
"htmldjango.vim"
"javascript.vim"
"make.vim"
"netrw.vim"
"php.vim"
"scss.vim"
"tex.vim"
"vue.vim"
)

create_file_types_links() {
	if [ ! -d "$HOME/.vim/ftplugin" ] ; then
		printf "Creating ftplugin directory... "
		mkdir -p $HOME/.vim/ftplugin
	fi

	printf "Creating soft links... "
	for f in "${FTPLUGIN[@]}"
	do
		if [ -e $HOME/.vim/ftplugin/$f ] ; then
			create_back_up_file $HOME/.vim/ftplugin/$f
		fi

		ln -s $configPath/$f $HOME/.vim/ftplugin
	done
	printf "Soft links created\n\n"
}

create_back_up_file() {
	if [ -e $1 ] ; then
		printf "Creating backup for $1... "
		mv $1 $1.bk
		printf "Backup created\n\n"
	fi
}

if [ "$MINIMAL" = true ] ; then
	create_back_up_file $OUTPUT_FILE

	if [ "$FILE_TYPES" = true ] || [ "$ALL" = true ] ; then
		create_file_types_links
	fi

	echo "so $configPath/.minvimrc" > $OUTPUT_FILE
	printf "Minimal setup ready"
else
	create_back_up_file $OUTPUT_FILE

	if [ "$FILE_TYPES" = true ] || [ "$ALL" = true ] ; then
		create_file_types_links
	fi

	if [ -n $OUTPUT_FILE ] ; then
		if [ ! -e $OUTPUT_FILE ] || [ "$FORCE" = true ] ; then
			echo "let configPath = \"$configPath\"" > $OUTPUT_FILE
			echo "so $configPath/.vimrc" >> $OUTPUT_FILE
			echo "" >> $OUTPUT_FILE

			if [ "$PLUGINS" = true ] || [ "$ALL" = true ] ; then
				printf "Adding plugins.vim..."
				if [ ! -e ~/.vim/autoload/plug.vim ] ; then
					printf "Installing vim plug..."
					curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
						https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

					printf "Vim plug installed\n\n"
				fi

				echo "so $configPath/plugins.vim" >> $OUTPUT_FILE
				printf "plugins.vim added\n\n"
			fi

			if [ "$FUNCTIONS" = true ] || [ "$ALL" = true ] ; then
				printf "Adding functions.vim... "
				echo "so $configPath/functions.vim" >> $OUTPUT_FILE
				printf "functions.vim added\n\n"
			fi

			if [ "$SECRET" = true ] || [ "$ALL" = true ] ; then
				printf "Adding secret.vim... "
				echo "so $HOME/.vim/secret.vim" >> $OUTPUT_FILE
				printf "secret.vim added\n\n"
			fi

			printf "$OUTPUT_FILE written\n"
		fi
	fi
fi
