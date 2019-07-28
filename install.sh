scriptPath=`realpath $0`
configPath=`dirname $scriptPath`

OPTS=$(getopt -o pfas \
	--long output:,plugins,functions,all,secret \
	-n 'parse-options' -- "$@")

if [ $? != 0 ]; then
	echo "Failed parsing options." >& 2
	exit 1
fi

eval set -- "$OPTS"

OUTPUT_FILE="$HOME/.vimrc"
PLUGINS=false
FUNCTIONS=false
SECRET=false
ALL=false

while true; do
	case "$1" in
		--output ) OUTPUT_FILE="$2"; shift; shift ;;
		-p | --plugins ) PLUGINS=true; shift ;;
		-f | --functions ) FUNCTIONS=true; shift ;;
		-s | --secret ) SECRET=true; shift ;;
		-a | --all ) ALL=true; shift ;;
		-- ) shift; break ;;
		* ) break ;;
	esac
done

if [ -e $OUTPUT_FILE ] ; then
	echo "Renaming $OUTPUT_FILE to $OUTPUT_FILE.bk"
	mv $OUTPUT_FILE $OUTPUT_FILE.bk
fi

if [ -n $OUTPUT_FILE ] ; then
	if ! [ -e $OUTPUT_FILE ] || [ "$FORCE" = true ] ; then
		echo "let configPath = \"$configPath\"" > $OUTPUT_FILE
		echo "so $configPath/.vimrc" >> $OUTPUT_FILE
		echo "" >> $OUTPUT_FILE

		if [ "$PLUGINS" = true ] || [ "$ALL" = true ] ; then
			echo "Adding plugins.vim"
			if ! [ -e ~/.vim/autoload/plug.vim ] ; then
				echo "Installing vim plug..."
				curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
					https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

			fi

			echo "so $configPath/plugins.vim" >> $OUTPUT_FILE
		fi

		if [ "$FUNCTIONS" = true ] || [ "$ALL" = true ] ; then
			echo "Adding functions.vim"
			echo "so $configPath/functions.vim" >> $OUTPUT_FILE
		fi

		if [ "$SECRET" = true ] || [ "$ALL" = true ] ; then
			echo "Adding secret.vim"
			echo "so $HOME/.vim/secret.vim" >> $OUTPUT_FILE
		fi

		echo "$OUTPUT_FILE written"
	fi
fi
