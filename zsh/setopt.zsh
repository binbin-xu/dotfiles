# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# tricks to combine oh-my-zsh with dotfiles
ZSH_CUSTOM=$HOME/.zsh

# ===== Basics
setopt no_beep # don't beep on error
setopt interactive_comments # Allow comments even in interactive shells (especially for Muness)


# ===== Changing Directories
# auto cd: If you type blabla, and it isn't a command, and it is a directory in your cdpath, go there
setopt auto_cd
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:cd:*' ignore-parents parent pwd


# ===== Completion 
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word    
setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
unsetopt menu_complete # do not autoselect the first completion entry
setopt complete_in_word # Allow completion from within a word/phrase
setopt auto_param_slash  # If a parameter is completed whose content is the name of a directory, then add a trailing slash instead of a space.
setopt list_types  # When listing files that are possible completions, show the type of each file with a trailing identifying mark.
setopt auto_param_keys # If a parameter name was completed and a following character (normally a space) automatically inserted, and the next character typed is one of those that have to come directly after the name (like '}', ':', etc.),
setopt magic_equal_subst  # All unquoted arguments of the form 'anything=expression' appearing after the command name have filename expansion (that is, where expression has a leading '~' or '=') performed on expression as if it were a parameter assignment.
setopt always_last_prompt  # If unset, key functions that list completions try to return to the last prompt if given a numeric argument. 


# ===== Expansion and Globbing
setopt mark_dirs  # Append a trailing '/' to all directory names resulting from filename generation
# setopt print_eight_bit  # Print eight bit characters literally in completion lists, etc. This option is not necessary if your system correctly returns the printability of eight bit characters
setopt no_hup

# history option
setopt hist_ignore_dups
setopt hist_ignore_space
setopt histignorealldups
autoload history-search-end

setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack