az afd origin update \
  --enabled-state enabled \
  --origin-group-name doc \
  --profile-name rifiel-me \
  -n doc-ne \
  -g core

az afd origin update \
  --enabled-state disabled \
  --origin-group-name doc \
  --profile-name rifiel-me \
  -n doc-we \
  -g core