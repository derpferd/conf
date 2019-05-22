zsh_version=$(/apollo/env/envImprovement/bin/zsh --version | cut -d ' ' -f 2)
my_path=/apollo/env/envImprovement/var/lib/zsh/$zsh_version/
if [[ -d $my_path && ${module_path[(I)$my_path]} -eq 0 ]]; then
    module_path[$(($#module_path+1))]=$my_path
fi
