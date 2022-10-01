if status is-interactive
    # Commands to run in interactive sessions can go here
    # name: sashimi
    function fish_prompt
      set -l last_status $status
      set -l cyan (set_color -o cyan)
      set -l yellow (set_color -o yellow)
      set -g red (set_color -o red)
      set -g blue (set_color -o blue)
      set -l green (set_color -o green)
      set -g normal (set_color normal)

      set -l ahead (_git_ahead)
      set -g whitespace ' '

      if test $last_status = 0
        set initial_indicator "$blue "
        set status_indicator "$yellow❯"
      else
        set initial_indicator "$red✖ $last_status"
        set status_indicator "$red❯"
      end
      set -l cwd $cyan(basename (prompt_pwd))

      if [ (_git_branch_name) ]

        if test (_git_branch_name) = 'master'
          set -l git_branch (_git_branch_name)
          set git_info "$normal git:($red$git_branch$normal)"
        else
          set -l git_branch (_git_branch_name)
          set git_info "$normal git:($blue$git_branch$normal)"
        end

        if [ (_is_git_dirty) ]
          set -l dirty "$yellow ✗"
          set git_info "$git_info$dirty"
        end
      end

      # Notify if a command took more than 5 minutes
      if [ "$CMD_DURATION" -gt 300000 ]
        echo The last command took (math "$CMD_DURATION/1000") seconds.
      end

      echo -n -s $initial_indicator $whitespace $cwd $git_info $whitespace $ahead $status_indicator $whitespace
    end

    function _git_ahead
      set -l commits (command git rev-list --left-right '@{upstream}...HEAD' 2>/dev/null)
      if [ $status != 0 ]
        return
      end
      set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
      set -l ahead  (count (for arg in $commits; echo $arg; end | grep -v '^<'))
      switch "$ahead $behind"
        case ''     # no upstream
        case '0 0'  # equal to upstream
          return
        case '* 0'  # ahead of upstream
          echo "$blue↑$normal_c$ahead$whitespace"
        case '0 *'  # behind upstream
          echo "$red↓$normal_c$behind$whitespace"
        case '*'    # diverged from upstream
          echo "$blue↑$normal$ahead $red↓$normal_c$behind$whitespace"
      end
    end

    function _git_branch_name
      echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
    end

    function _is_git_dirty
      echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
    end
end
abbr -a -U grep 'grep --color=auto'
abbr -a -U fgrep 'fgrep --color=auto'
abbr -a -U egrep 'egrep --color=auto'
abbr -a -U ls 'exa --oneline --icons' #"exa" is version of "ls" rewritten in Rust
abbr -a -U ll 'exa -al --icons'
abbr -a -U myip 'curl ifconfig.co'
abbr -a -U tftp 'atftp'
abbr -a -U suspend 'sudo systemctl suspend'
abbr -a -U homepi 'ssh -p 6435 mark@192.168.0.100 -i ~/.ssh/id_ed25519'
abbr -a -U weather 'curl wttr.in'
abbr -a -U rsync 'rsync -av --info=progress2 --info=name0'
abbr -a -U fd 'fd --hidden'
abbr -a -U rg 'rg --hidden'
abbr -a -U mkdir 'mkdir -p'
abbr -a -U alacrittyconf 'nvim ~/.dotfiles/.config/alacritty/alacritty.yml'
abbr -a -U nvimconf 'nvim ~/.dotfiles/.config/nvim/init.vim'
abbr -a -U qtileconf 'nvim ~/.dotfiles/.config/qtile/config.py'
abbr -a -U picomconf 'nvim ~/.dotfiles/.config/picom/picom.conf'
abbr -a -U myip 'curl ifconfig.co'
abbr -a -U homepi 'ssh -p 6435 mark@192.168.0.100 -i ~/.ssh/id_ed25519'
abbr -a -U telnet 'rlwrap nc'
abbr -a -U ptc05_server 'ssh matija@192.168.35.30'
abbr -a -U ptc05 'rlwrap nc 192.168.0.10 2001'
abbr -a -U ptc05_build 'docker run --rm -v ~/.ssh/:/root/.ssh/ -v $PWD:/root/project dryodon/stm32:1.1.0 bash -c "cd /root/project; make clean all"'
abbr -a -U flash_ptc05 'STM32_Programmer_CLI -c port=swd -d ~/Melexis/PTC05_PXI/Release-NoBL/PTC05_DEV_NOBL.hex -vb 3 -rst'
abbr -a -U mlxdev 'cd ~/Melexis/PTC05_PXI & nvim'
abbr -a -U ef 'find ./ | fzf -e -x | xargs -r -o vim'
abbr -a -U mntnextcloud 'rclone mount --daemon nextcloud:/ ~/Nextcloud'
abbr -a -U gd 'git diff'
abbr -a -U gs 'git status'
abbr -a -U gaa 'git add .'
abbr -a -U sp 'sudo pacman'
abbr -a -U p 'sudo pacman'
abbr -a -U pi 'sudo pacman -Sy'
abbr -a -U pu 'sudo pacman -Syu'
abbr -a -U pr 'sudo pacman -Rns'
abbr -a -U pc 'sudo pacman -Scc'
abbr -a -U ps 'sudo pacman -S'
abbr -a -U pqs 'sudo pacamn -Qs'
abbr -a -U pss 'sudo pacman -Ss'
abbr -a -U psy 'sudo pacman -Sy'
abbr -a -U psyu 'sudo pacman -Syu'
abbr -a -U prns 'sudo pacman -Rns'
abbr -a -U pscc 'sudo pacman -Scc'
abbr -a -U flash_ptc05 'STM32_Programmer_CLI -c port=swd -d ~/Melexis/PTC05_PXI/Release-NoBL/PTC05_DEV_NOBL.hex -rst'
