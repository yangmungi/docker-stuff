set -xe

julia_arch=$(uname -m) 
julia_short_arch="${julia_arch}" 

if [ "${julia_short_arch}" == "x86_64" ]; then 
  julia_short_arch="x64"
fi

julia_installer="julia-${JULIA_VERSION}-linux-${julia_arch}.tar.gz"

tar xzf "${julia_installer}" -C "/opt/julia-${JULIA_VERSION}" --strip-components=1
rm "${julia_installer}"
ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia

# Show Julia where conda libraries are

mkdir /etc/julia 
echo "push!(Libdl.DL_LOAD_PATH, \"${CONDA_DIR}/lib\")" >> /etc/julia/juliarc.jl 

# Create JULIA_PKGDIR
mkdir "${JULIA_PKGDIR}"
chown "${NB_USER}" "${JULIA_PKGDIR}"

