#!/bin/sh

echo 'Updating website based on environment variables..'
echo ''

# Update TITLE environment variable
if [[ -z "$TITLE" ]]
then
  echo "[WARN]: No TITLE given, using the default one"
  TITLE='Our website is launching soon..'
fi;

echo "Updating TITLE to $TITLE ..."
sed -i "s/ENV_TITLE/$TITLE/" "$BASE_DIR/index.html"


# Update META_TITLE environment variable
if [[ -z "$META_TITLE" ]]
then
  echo "[WARN]: No META_TITLE given, using the default one"
  META_TITLE='Launching soon!'
fi;

echo "Updating META_TITLE to $META_TITLE ..."
sed -i "s/ENV_META_TITLE/$META_TITLE/" "$BASE_DIR/index.html"


# Update SUBTITLE environment variable
if [[ -z "$SUBTITLE" ]]
then
  echo "[WARN]: No SUBTITLE given, using the default one"
  SUBTITLE='We are working hard to finish the development of this site.'
fi;

echo "Updating SUBTITLE to $SUBTITLE ..."
sed -i "s/ENV_SUBTITLE/$SUBTITLE/" "$BASE_DIR/index.html"


# Update FOOTER environment variable
if [[ -z "$FOOTER" ]]
then
  echo "[WARN]: No FOOTER given, using the default one"
  FOOTER="<a href='mailto:info@example.com'>info@example.com</a> | <a href='https://www.example.com'>www.example.com</a> | <a href='tel:0123456789'>+01 234 56789</a>"
fi;

echo "Updating FOOTER to $FOOTER ..."
sed -i "s/ENV_FOOTER/$(printf '%s\n' "$FOOTER" | sed -e 's/[\/&]/\\&/g')/" "$BASE_DIR/index.html"


# Update OVERLAY_COLOR environment variable
if [[ -z "$OVERLAY_COLOR" ]]
then
  echo "[WARN]: No OVERLAY_COLOR given, using the default one"
  OVERLAY_COLOR='rgba(0, 0, 0, 0.8)'
fi;

echo "Updating OVERLAY_BG_COLOR to $OVERLAY_COLOR ..."
sed -i "s/ENV_OVERLAY_COLOR/$OVERLAY_COLOR/" "$BASE_DIR/index.html"

# Update BACKGROUND_COLOR environment variable
if [[ -z "$BACKGROUND_COLOR" ]]
then
  echo "[WARN]: No BACKGROUND_COLOR given, using the default one"
  BACKGROUND_COLOR='#455A64'
fi;

echo "Updating BACKGROUND_COLOR to $BACKGROUND_COLOR ..."
sed -i "s/ENV_BACKGROUND_COLOR/$BACKGROUND_COLOR/" "$BASE_DIR/index.html"


# Start and run nginx in foreground
nginx -g 'daemon off;'
