#!/bin/bash
#
path_init="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

tools=("tmux" "lsd" "nvim" "zsh" "jq" "composer")

function npm_tools() {
	local number=0
	local tools=("npm" "blade-formatter")
	local name="npm"
	for i in "${tools[@]}"; do
		if ! "$i" --help &>/dev/null; then
			((number++))
			if [[ $number == 1 ]]; then
				echo ""
				echo "npm tools:"
			fi
			echo "$number. tools $name $i belum ada"
		fi
	done
}

function cargo_tool() {
	local number=0
	local tools=("cargo" "alacritty" "eza" "rg" "fzf")
	local name="cargo"
	for i in "${tools[@]}"; do
		if ! "$i" --help &>/dev/null; then
			((number++))
			if [[ $number == 1 ]]; then
				echo ""
				echo "cargo tools:"
			fi
			echo "$number. tools cargo $i belum ada"
		fi
	done
}

number=0
for i in "${tools[@]}"; do
	if ! "$i" --help &>/dev/null; then
		((number++))
		if [[ $number == 1 ]]; then
			echo ""
			echo "another tools:"
		fi
		echo "$number. tools $i belum ada"
	fi
done
npm_tools
cargo_tool

mapfile -t init < <(find $path_init -mindepth 1 -maxdepth 1)

for i in "${init[@]}"; do
	if [[ ! -n "$(echo "$i" | grep -Po "^.+/check-tools.sh")" ]]; then
		cp -r "$i" $HOME &>/dev/null
	fi
done
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custome/plugins/zsh-autosuggestions
