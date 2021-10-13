# Open Journals :: Deposit with Crossref

This action deposit an accepted paper with [Crossref](https://www.crossref.org/)

## Usage

Usually this action is used as a step in a workflow after the paper's pdf and xml files are already accepted into the papers repository.

### Inputs

The action requires the following inputs:

- **crossref_filepath**: Required. The complete filepath of the Crossref XML file
- **crossref_username**: Required. Crossref username doing the deposit
- **crossref_password**: Required. Crossref password

### Example

Use it adding it as a step in a workflow `.yml` file in your repo's `.github/workflows/` directory and passing your custom input values.

````yaml
on:
  workflow_dispatch:
    ...
jobs:
  processing:
    runs-on: ubuntu-latest
    steps:
      - name: Deposit with Crossref
        uses: xuanxu/deposit-with-crossref-action@main
        with:
          crossref_filepath: ./paper.crossref.xml
          crossref_username: ${{ secrets.CROSSREF_USER }}
          crossref_password: ${{ secrets.CROSSREF_PASS }}
```
