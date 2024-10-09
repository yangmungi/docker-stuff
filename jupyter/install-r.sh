set -xe

python -m venv --system-site-packages kernel-r
(
    . ./kernel-r/bin/activate 

    # r-e1071: dependency of the caret R package
    mamba install -y \
        'r-base' \
        'r-caret' \
        'r-crayon' \
        'r-devtools' \
        'r-e1071' \
        'r-forecast' \
        'r-hexbin' \
        'r-htmltools' \
        'r-htmlwidgets' \
        'r-irkernel' \
        'r-nycflights13' \
        'r-randomforest' \
        'r-rcurl' \
        'r-rmarkdown' \
        'r-rodbc' \
        'r-rsqlite' \
        'r-shiny' \
        'r-tidyverse' \
        'unixodbc' 

    mamba install -y \
        'rpy2' \
        'r-tidymodels'
)
