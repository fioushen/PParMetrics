file(REMOVE_RECURSE
  "npbparams.h"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/BasicBitcodeGen-install.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()