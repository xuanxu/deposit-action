# Open Journals :: Deposit

This action deposit an accepted paper with Open Journals and Crossref

## Usage

Usually this action is used as a step in a workflow after the paper's pdf and xml files are already accepted into the papers repository.

### Inputs

The action accepts the following inputs:

- **journal_url**: Required. The url of the journal.
- **journal_secret**: Required. The access token to be used to upload files
- **issue_id**: Required. The issue number of the submission
- **crossref_filepath**: Required. The complete filepath of the Crossref XML file
- **crossref_username**: Required. Crossref username doing the deposit
- **crossref_password**: Required. Crossref password

### Example

Use it adding it as a step in a workflow `.yml` file in your repo's `.github/workflows/` directory and passing your custom input values (here's an example showing how to pass input values from diferent sources: workflow inputs, secrets or directly).

````yaml
on:
  workflow_dispatch:
   inputs:
      issue_id:
        description: 'The issue number of the submission'
jobs:
  processing:
    runs-on: ubuntu-latest
    steps:
      - name: Deposit
        id: deposit
        uses: xuanxu/deposit-action@main
        with:
          journal_url: https://joss.theoj.org/
          journal_secret: ${{ secrets.JOURNAL_SECRET }}
          issue_id: ${{ github.event.inputs.issue_id }}
          crossref_filepath: ./paper.crossref.xml
          crossref_username: ${{ secrets.CROSSREF_USER }}
          crossref_password: ${{ secrets.CROSSREF_PASS }}
```
