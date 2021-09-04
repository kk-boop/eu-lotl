#!/bin/sh

if [ "$(curl -o eu-lotl.xml -f -w "%{http_code}" "https://ec.europa.eu/tools/lotl/eu-lotl.xml" 2>/dev/null)" = "200" ]; then
	seqn="$(xq -r '.TrustServiceStatusList.SchemeInformation.TSLSequenceNumber' < ./eu-lotl.xml)"
#	vern="$(xq -r '.TrustServiceStatusList.SchemeInformation.TSLVersionIdentifier' < ./eu-lotl.xml)"
	echo "TSL sequence number: $seqn"
else
	echo "curl failed" >&2

fi

