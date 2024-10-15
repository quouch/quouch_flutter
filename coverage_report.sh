# This script is used to generate and show the coverage report for the project
# Since we have multiple packages, we need a flag to specify the package we want to generate the coverage report for.
# Usage: ./coverage_report.sh -p <package_name>
# If no flag is added, we assume we want the general coverage, which is the coverage of all packages.

# Parse the arguments
while getopts p: flag; do
  case "${flag}" in
  p) package=${OPTARG} ;;
  *)
    echo "usage: $0 [-p package_name]" >&2
    exit 1
    ;;
  esac
done

# Determine the path to the lcov.info file
if [ -z "$package" ]; then
  echo "Generating coverage report for all packages"
else
  cd packages/$package || exit
  echo "Generating coverage report for package $package"
fi

# Generate the coverage report
genhtml coverage/lcov.info -o coverage/html
# shellcheck disable=SC2086
open coverage/html/index.html
