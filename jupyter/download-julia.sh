set -xe

julia_arch=$(uname -m) 
julia_short_arch="${julia_arch}" 

if [ "${julia_short_arch}" == "x86_64" ]; then 
  julia_short_arch="x64"
fi

julia_installer="julia-${JULIA_VERSION}-linux-${julia_arch}.tar.gz"

julia_major_minor=$(echo "${JULIA_VERSION}" | cut -d. -f 1,2)

mkdir "/opt/julia-${JULIA_VERSION}" 
wget -q "https://julialang-s3.julialang.org/bin/linux/${julia_short_arch}/${julia_major_minor}/${julia_installer}"
