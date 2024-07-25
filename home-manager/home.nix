{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
	home.username = "raphael";
	home.homeDirectory = "/home/raphael";

	home.activation = {
		init = ''
			${pkgs.waybar}/bin/waybar &
			${pkgs.swaybg}/bin/swaybg -i /home/raphael/.config/home-manager/style/wallpaper.jpg &
		'';
	};

	# This value determines the Home Manager release that your configuration is
	# compatible with. This helps avoid breakage when a new Home Manager release
	# introduces backwards incompatible changes.
	#
	# You should not change this value, even if you update Home Manager. If you do
	# want to update the value, then make sure to first check the Home Manager
	# release notes.
	home.stateVersion = "23.11"; # Please read the comment before changing.

	# The home.packages option allows you to install Nix packages into your
	# environment.
	home.packages = with pkgs; [
		alacritty
		brightnessctl
		btop
		cargo
		clang
		docker
		eza
		fzf
		git
		grim
		htop
		lazygit
		lldb
		llvm
		norminette
		ncdu
		neofetch
		neovim
		nerdfonts
		pamixer
		playerctl
		python3
		ripgrep
		rustc
		slurp
		starship
		swaybg
		tmux
		valgrind
		vesktop
		vlc
		wl-clipboard
		wofi
		zed-editor
		zoxide
		zsh
	];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/raphael/etc/profile.d/hm-session-vars.sh
  #

#  home.packages = with pkgs; [
#  #  (pkgs.nerdfonts.override { fonts = [ "Hack" ]; })
#  ];

	fonts = {
		fontconfig = {
			defaultFonts = {
				serif = ["Hack Nerd Font Mono"];
				sansSerif = ["Hack Nerd Font Mono"];
				monospace = ["Hack Nerd Font Mono"];
			};
		};
	};

programs.wofi.enable = true;

	home.sessionVariables = {
		EDITOR = "nvim";
	};


	wayland.windowManager.sway = {
		enable = true;
		config = {
			modifier = "Mod4";
			terminal = "alacritty"; 
			startup = [{
				command = "swaybg -i /home/raphael/style/wallpaper.jpg";
			}];
			keybindings = {
				"Mod4+q" = "kill";
				"Mod4+return" = "exec alacritty";
				"Mod4+w" = "exec firefox";
				"Mod4+Left" = "focus left";
				"Mod4+Space" = "exec wofi --show drun";
				"Mod4+Right" = "focus right";
				"Mod4+Up" = "focus up";
				"Mod4+Down" = "focus down";
				"Mod4+h" = "focus left";
				"Mod4+l" = "focus right";
				"Mod4+k" = "focus up";
				"Mod4+j" = "focus down";
				"Mod4+Shift+Left" = "move left";
				"Mod4+Shift+Right" = "move right";
				"Mod4+Shift+Up" = "move up";
				"Mod4+Shift+Down" = "move down";
				"Mod4+Shift+h" = "move left";
				"Mod4+Shift+l" = "move right";
				"Mod4+Shift+k" = "move up";
				"Mod4+Shift+j" = "move down";
				"Mod4+1" = "workspace number 1";
				"Mod4+2" = "workspace number 2";
				"Mod4+3" = "workspace number 3";
				"Mod4+4" = "workspace number 4";
				"Mod4+5" = "workspace number 5";
				"Mod4+6" = "workspace number 6";
				"Mod4+7" = "workspace number 7";
				"Mod4+8" = "workspace number 8";
				"Mod4+9" = "workspace number 9";
				"Mod4+Shift+1" = "move container to workspace number 1";
				"Mod4+Shift+2" = "move container to workspace number 2";
				"Mod4+Shift+3" = "move container to workspace number 3";
				"Mod4+Shift+4" = "move container to workspace number 4";
				"Mod4+Shift+5" = "move container to workspace number 5";
				"Mod4+Shift+6" = "move container to workspace number 6";
				"Mod4+Shift+7" = "move container to workspace number 7";
				"Mod4+Shift+8" = "move container to workspace number 8";
				"Mod4+Shift+9" = "move container to workspace number 9";
				"Mod4+Shift+s" = "exec grim -g \"$(slurp)\" - | wl-copy";
				"Mod4+v" = "splith";
				"Mod4+g" = "layout tabbed";
				"Mod4+Shift+v" = "splitv";
				"Mod4+Shift+e" = "layout toggle split";
				"XF86AudioRaiseVolume" = "exec pamixer -ui 10";
				"XF86AudioLowerVolume" = "exec pamixer -ud 10";
				"XF86AudioMute" = "exec pamixer --toggle-mute";
				"Mod4+Shift+space" = "focus mode_toggle";
				"XF86AudioPlay" = "exec playerctl play";
				"XF86AudioPause" = "exec playerctl pause";
				"XF86AudioNext" = "exec playerctl next";
				"XF86AudioPrev" = "exec playerctl previous";
				"XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
				"XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
			};
		};
	};

	programs.alacritty = {
		enable = true;
	};

	programs.git = {
		enable = true;
		userName = "Raphael";
		userEmail = "raphael@enium.eu";
	};

	programs.waybar = {
		enable = true;
		style = builtins.readFile ./style/waybar.css;
		settings = [{
			layer = "top";
			position = "top";
			modules-left = [
				"sway/workspaces"
				"sway/mode"
			];
			modules-center = ["clock"];
			modules-right = [
				"network#wifi"
				"pulseaudio"
				"battery"
			];
			"sway/workspaces" = {
				persistent_workspaces = {
					"" = [];
					"" = [];
					"1:" = [];
				};
				numeric-first = true;
			};
			"network#wifi" = {
				interface = "wlp1s0";
				format-wifi = "{signalStrength}%";
				# format-wifi = "{essid} ({signalStrength}%) ";
			};
			pulseaudio = {
				format = " {volume}%";
				on-click = "pavucontrol";
			};
			cpu = {
				format = "󰘚 {load}";
			};
			memory = {
				format = " {used:.0f}G/{total:.0f}G";
			};
			"sway/window" = {
				max-length = 50;
			};
			"disk#home" = {
				path = "/home";
				format = " {free}";
			};
			"battery" = {
				format = " {icon} {capacity}%";
				format-icons = ["" "" "" "" ""];
			};
			"clock" = {
				format-alt = "{:%a, %d. %b  %H:%M}";
			};
		}];
	};


	programs.zoxide = {
		enable = true;
	};

  programs.zsh = {
	enable = true;
	autosuggestion = {
		enable = true;
	};
	shellAliases = {
		"cls" = "clear";
		"vim" = "nvim";
		"gcl" = "git clone";
		"gs" = "git status";
		"gm" = "git commit -m";
		"gc" = "git commit -m";
		"gp" = "git push";
		"gpp" = "git pull";
		"ga" = "git add .";
		"gr" = "git restore .";
		"ls" = "eza -h --icons=always";
		"ll" = "ls -l";
		"l" = "ls -l";
		"la" = "ls -la";
		"vg" = "valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes --track-fds=yes --track-origins=yes --show-reachable=yes";
	};
	enableCompletion = true;
	autocd = true;
	};

	programs.starship = {
		enableZshIntegration = true;
		enable = true;
		settings = {
			add_newline = true;
			command_timeout = 1000;
			format = " | \($directory\) $git_branch$git_status$git_commit : $cmd_duration \n$character";
			character = {
				success_symbol = "[󰯙 ](yellow)";
				error_symbol = "[󰯙 ](#ff7700)";
			};
			username = {
				style_user = "red";
				style_root = "dark-red";
				format = "[$username]($style)";
				disabled = false;
				show_always = true;
			};
			hostname = {
				ssh_only = false;
				format = "[$hostname](bold yellow) ";
				disabled = false;
			};
			directory = {
				home_symbol = "󰋞 ~";
				read_only_style = "197";
				read_only = "  ";
				format = "\([$path]($style)[$read_only]($read_only_style)\)";
			};
			git_branch = {
				symbol = " ";
				format = "[$symbol$branch]($style) ";
				style = "bold green";
			};
			git_status = {
				format = "[\($all_status$ahead_behind\)]($style) ";
				style = "bold green";
				conflicted = "🏳";
				up_to_date = " ";
				untracked = " ";
				ahead = "⇡\${count}";
				diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
				behind = "⇣\${count}";
				stashed = " ";
				modified = " ";
				staged = "[++\($count\)](green)";
				renamed = "襁 ";
				deleted = " ";
			};
		};
	};

	home.file.".zshrc".text = ''
	 [ -f "$HOME/.zshenv" ] && source "$HOME/.zshenv";
		[ -f "$HOME/.zvars"  ] && source "$HOME/.zvars";

		export ZINIT_HOME="''${XDG_DATA_HOME:-''${HOME}/.cache/}/zinit/zinit.git"
		export MANPAGER="/bin/sh -c 'col -bx | bat -l man --style=plain --paging=always'"
		export MANROFFOPT="-c"
		export EDITOR=nvim

		[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
		[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
		source "''${ZINIT_HOME}/zinit.zsh"

		[ -f /etc/zshenv ] && source /etc/zshenv

		mkdir -p "$HOME/.zfunc"
		fpath+="$HOME/.zfunc"
		path+="${pkgs.comma}/bin/"

		[ ! -f "$HOME/.zfunc/_rustup" ] && { rustup completions zsh rustup |> "$HOME/.zfunc/_rustup" }
		[ ! -f "$HOME/.zfunc/_cargo" ] && { rustup completions zsh cargo |> "$HOME/.zfunc/_cargo" }


		zinit ice wait lucid; zinit light Aloxaf/fzf-tab
		zinit ice wait lucid; zinit light nix-community/nix-zsh-completions
		zinit ice wait lucid; zinit light z-shell/F-Sy-H
		zinit ice wait lucid; zinit light zsh-users/zsh-autosuggestions
		zinit ice wait lucid; zinit light zsh-users/zsh-syntax-highlighting

		zinit ice wait lucid; zinit snippet OMZP::git
		zinit ice wait lucid as'completions'; zinit snippet OMZP::sudo
		zinit ice wait lucid as'completions'; zinit snippet OMZP::rust

		bindkey '^[[A' history-search-backward
		bindkey '^[[B' history-search-forward

		bindkey '^[[1;5C' forward-word
		bindkey '^[[1;5D' backward-word
		bindkey '^[Oc' forward-word
		bindkey '^[Od' backward-word

		bindkey '^[[1;2D' beginning-of-line
		bindkey '^[[1;2C' end-of-line
		bindkey '^[[1;3D' beginning-of-line
		bindkey '^[[1;3C' end-of-line

		bindkey '^H' backward-kill-word


		bindkey -r '^['

		HISTSIZE=5000
		SAVEHIST=$HISTSIZE

		HISTFILE="$HOME/.zsh_history"
		mkdir -p "$(dirname "$HISTFILE")"
		HISTDUP=erase
		setopt SHARE_HISTORY
		setopt HIST_FCNTL_LOCK
		setopt HIST_IGNORE_SPACE
		setopt HIST_IGNORE_DUPS
		setopt HIST_IGNORE_ALL_DUPS
		unsetopt HIST_EXPIRE_DUPS_FIRST
		unsetopt EXTENDED_HISTORY

		zi for \
		  atload"zicompinit; zicdreplay" \
		  blockf \
		  lucid \
		  wait \
		zsh-users/zsh-completions

		zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
		zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
		zstyle ':completion:*' menu no
		zstyle ':fzf-tab:complete:cd:*' fzf-preview '${pkgs.eza}/bin/eza -a --icons --color $realpath'
		zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview '${pkgs.eza}/bin/eza -a --icons --color $realpath'

		eval "$(${pkgs.starship}/bin/starship init zsh)"
	'';
 
  # Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
