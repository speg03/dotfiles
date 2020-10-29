from pathlib import Path

# ------------------------------
# Environment Variables
# ------------------------------

$COMPLETIONS_CONFIRM = True
$HISTCONTROL = "ignoredups"
$XONSH_AUTOPAIR = True

$DYNAMIC_CWD_WIDTH = (30, "c")
$PROMPT = (
    "{BOLD_GREEN}{user}@{hostname} {BOLD_BLUE}{cwd}{RESET} {gitstatus}\n"
    "{env_name}{prompt_end} "
)

# ------------------------------
# Aliases
# ------------------------------

aliases["gsync"] = "rsync -rltDcvzCFP --executability --filter=':- /.gitignore'"

# ------------------------------
# Xontribs
# ------------------------------

xontrib load vox

# ------------------------------
# Keybindings
# ------------------------------

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
        venvs = [list(d.glob(".venv/*")) for d in (Path.cwd() / "_").parents]
        venvs = sum(venvs, [])  # Flatten

        if venvs:
            venvs_str = "\n".join(map(str, venvs))
            selected = $(echo @(venvs_str) | peco --select-1).strip()
            if selected:
                vox activate @(selected)
                event.current_buffer.validate_and_handle()
