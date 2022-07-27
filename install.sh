#!/bin/sh

BINDIR=/usr/local/bin
ETCDIR=/usr/local/etc

cp safe_add.sh $BINDIR
cp safe_del.sh $BINDIR
cp safe_run.sh $BINDIR
cp safe_setup.sh $BINDIR
cp safe_unsetup.sh $BINDIR
rm -r $ETCDIR/safe-template
cp -r template $ETCDIR/safe-template


echo "export BINDIR=$BINDIR" > $BINDIR/safe-config
echo "export ETCDIR=$ETCDIR" >> $BINDIR/safe-config
