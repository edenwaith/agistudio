include(GetGitRevisionDescription)
git_describe(GIT_VERSION --tags --dirty=-d)

if (NOT ${GIT_VERSION} MATCHES "-NOTFOUND$")
	string(REGEX REPLACE "^v([0-9]+)\\..*" "\\1" PROJECT_VERSION_MAJOR "${GIT_VERSION}")
	string(REGEX REPLACE "^v[0-9]+\\.([0-9]+).*" "\\1" PROJECT_VERSION_MINOR "${GIT_VERSION}")
	string(REGEX REPLACE "^v[0-9]+\\.[0-9]+\\.([0-9]+).*" "\\1" PROJECT_VERSION_PATCH "${GIT_VERSION}")
	string(REGEX REPLACE "^v[0-9]+\\.[0-9]+\\.[0-9]+(.*)" "\\1" GIT_VERSION_SHA1 "${GIT_VERSION}")
else ()
	set(PROJECT_VERSION_MAJOR "1")
	set(PROJECT_VERSION_MINOR "3")
	set(PROJECT_VERSION_PATCH "0")
	set(GIT_VERSION_SHA1 "+unversioned")
endif ()

set(PROJECT_VERSION_FULL ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}${GIT_VERSION_SHA1})