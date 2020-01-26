$COMPLETIONS_CONFIRM = True
$FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE = True
$HISTCONTROL = "ignoredups"
$XONSH_AUTOPAIR = True

$DYNAMIC_CWD_WIDTH = (30, "c")
$PROMPT = "{BOLD_GREEN}{user}@{hostname} {BOLD_BLUE}{cwd}{NO_COLOR} {gitstatus}\n" \
          "{env_name}{prompt_end} "

aliases["e"] = "run-emacs -n"
aliases["t"] = "run-tmux"
aliases["gsync"] = "rsync -rltDcvzCFP --executability --filter=':- /.gitignore'"


@events.on_ptk_create
def custom_keybindings(bindings, **kw):

    @bindings.add("c-@")
    def _change_repository(event):
        repository = $(ghq list -p | peco).strip()
        if repository:
            cd @(repository)
            event.current_buffer.validate_and_handle()
