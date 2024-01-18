#!/bin/ash


DATA_DIR="/data"
UPLOAD_DIR="$DATA_DIR/upload"
UPLOAD_TMP_DIR="/lighttpd"


uploadcleansing() {
  mkdir -p $UPLOAD_DIR
  mkdir -p $UPLOAD_TMP_DIR

  rm -rf $DATA_DIR/*.pgu
  rm -rf $UPLOAD_DIR/*
}
