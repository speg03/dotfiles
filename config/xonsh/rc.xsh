from pathlib import Path

$COMPLETIONS_CONFIRM = True
$FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE = True
$HISTCONTROL = "ignoredups"
$XONSH_AUTOPAIR = True

$DYNAMIC_CWD_WIDTH = (30, "c")
$PROMPT = "{BOLD_GREEN}{user}@{hostname} {BOLD_BLUE}{cwd}{NO_COLOR} {gitstatus}\n" \
          "{env_name}{prompt_end} "

aliases["e"] = "run-emacs -n"
aliases["t"] = "run-tmux"
aliases["deactivate"] = "source-bash ~/.config/xonsh/deactivate"
aliases["gsync"] = "rsync -rltDcvzCFP --executability --filter=':- /.gitignore'"


@events.on_ptk_create
def custom_keybindings(bindings, **kw):

    @bindings.add("c-@")
    def _change_repository(event):
        repository = $(ghq list -p | peco).strip()
        if repository:
            cd @(repository)
            event.current_buffer.validate_and_handle()

    @bindings.add("c-v")
    def _activate_venv(event):
        venvs = [list((d / ".venv").glob("*")) for d in (Path.cwd() / "_").parents]
        venvs = sum(venvs, [])  # Flatten

        if venvs:
            venvs_str = "\n".join(map(str, venvs))
            selected = $(echo @(venvs_str) | peco --select-1).strip()
            if selected:
                old_path = ${...}.get("_OLD_VIRTUAL_PATH", $PATH)
                source-bash @(selected)/bin/activate  # This script unsets _OLD_VIRTUAL_PATH
                $_OLD_VIRTUAL_PATH = old_path
                event.current_buffer.validate_and_handle()
