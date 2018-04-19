import os

c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.token = ''

c.NotebookApp.kernel_spec_manager_class = 'environment_kernels.EnvironmentKernelSpecManager'

c.EnvironmentKernelSpecManager.display_name_template = "Env ({})"
c.EnvironmentKernelSpecManager.virtualenv_prefix_template = "{}"

c.EnvironmentKernelSpecManager.virtualenv_env_dirs = [
    os.path.join(os.environ['SRC_HOME'],
                 'github.com/riywo/anyenv/envs/pyenv/versions')
]
c.EnvironmentKernelSpecManager.find_conda_envs = False

c.EnvironmentKernelSpecManager.blacklist_envs = ['jupyter']
