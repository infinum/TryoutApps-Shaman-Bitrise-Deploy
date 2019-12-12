#!/bin/bash
set -ex

gem install shaman_cli
shaman -v
export SHAMAN_TOKEN=${shaman_token}

if [[ "${changelog_message}" ]]; then
	CHANGELOG_MESSAGE="${changelog_message}"
else
	CHANGELOG_MESSAGE=" "
fi

if [[ "${file_path}" ]]; then
	FILE_PATH="-f"
	FILE_PATH_NAME="${file_path}"
fi

if [[ "${release_name}" ]]; then
	REL_PARAM="-n"
	REL_PARAM_NAME="${release_name}"
fi

shaman deploy "${environment_name}" -t -c "${shaman_config_path}" $FILE_PATH "${FILE_PATH_NAME}" -m "${CHANGELOG_MESSAGE}" $REL_PARAM "${REL_PARAM_NAME}"

#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.
