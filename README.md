# Filecoin PDP Sandbox

This is a sandbox repository to explore Filecoin's Proof of Data Possession. You can play with it in GitHub Codespaces.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/davidgasquez/filecoin-pdp-sandbox)

## Quickstart

Let's upload your first file to Filecoin PDP! You'll need some environment variables.

```bash
export SERVICE_URL=https://yablu.net
export SERVICE_NAME=pdp-sandbox
export RECORD_KEEPER=0x0000000000000000000000000000000000000000
```

Now we can add a file.

```bash
pdptool upload-file --service-url $SERVICE_URL --service-name $SERVICE_NAME data/awesome.png
baga6ea4seaqo7hfd3ejsah5wkbhlgsdpohj42dmyzk2tztk122mlzdvemg5eoha:baga6ea4seaqo7hfd3ejsah5wkbhlgsdpohj42dmyzk2tztk242mlzdvemg5eoha
```

The `upload-file` command output is the `$ROOT`.

Then, get a proof set ID.

```bash
pdptool create-proof-set --service-url $SERVICE_URL --service-name $SERVICE_NAME --recordkeeper $RECORD_KEEPER
```

It'll give you a transaction hash. You can monitor the creation with:

```bash
pdptool get-proof-set-create-status --service-url $SERVICE_URL --service-name $SERVICE_NAME --tx-hash $TX_HASH
```

Finally, add the roots with:

```bash
pdptool add-roots --service-url $SERVICE_URL --service-name $SERVICE_NAME --proof-set-id $PROOF_SET_ID --root $ROOT
```

## Resources

- [PDP Getting Started Guide](https://docs.google.com/document/d/1EDIIFJEfOTFuw1WEC2WcJdVaZ9agNUHKEqTCtJPVMCA)
- [PDP Explorer](https://calibration.pdp-explorer.eng.filoz.org/)
- [PDP Contracts](https://github.com/FilOzone/pdp?tab=readme-ov-file#contracts)

## License

MIT.
