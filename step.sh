#!/bin/bash
set -ex

echo "This is the value specified for the input 'example_step_input': ${example_step_input}"

gem install shaman_cli
shaman -v
export SHAMAN_TOKEN=${shaman_token}
PARAMS=""${environment_name}" -t -c "${shaman_config_path}" -f "${file_path}""

if [[ "${changelog_message}" ]]; then
	PARAMS="$PARAMS -m "${changelog_message}""
fi

shaman deploy $PARAMS

#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.
