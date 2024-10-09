set -xe
# Add Julia packages.
# Install IJulia as jovyan and then move the kernelspec out
# to the system share location. Avoids problems with runtime UID change not
# taking effect properly on the .local folder in the jovyan home dir.
julia -e 'import Pkg; Pkg.update()' 
julia -e 'import Pkg; Pkg.add("HDF5")' 
julia -e 'using Pkg; pkg"add IJulia"; pkg"precompile"' 
# move kernelspec out of home \
mv "${HOME}/.local/share/jupyter/kernels/julia"* "${CONDA_DIR}/share/jupyter/kernels/" 
chmod -R go+rx "${CONDA_DIR}/share/jupyter" 
rm -rf "${HOME}/.local" 
