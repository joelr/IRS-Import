**Download IRS Revocation list and mark charities as inactive**

http://apps.irs.gov/app/eos/forwardToRevokeDownload.do

Notes on revocation list format: http://apps.irs.gov/app/eos/forwardToRevokeDownloadLayout.do

Rake task should:

- Download IRS Revocation List
- Extract list
- Parse list (*test data only uses the first ~300 rows*)


Exemption Reinstatement Date is NULL: Charity should be inactive

Exemption Reinstatement Date is not NULL: Charity should be active

- If the charity is **active in the DB**:
  - **has pages**, make no changes. Email for manual confirmation to make inactive.
  - **has no pages**, mark as inactive. Add to email for reference.
- If a charity is **inactive in the DB**:
  - is **active in Exemption List**, Email for manual confirmation to make active.
  - is **inactive in Exemption List**, do nothing.
- If a charity cannot be found in DB, do nothing.

**One email should be sent including a list of**:
- Charities that require manual confirmation to make inactive
- Charities that require manual confirmation to make active
- Charities that have been automatically removed
- Confirmation that the import was successful if the above lists are empty

**To get started**
This will drop and reseed the local database with test data, from seeds.yml

  rake db:seed

**Expected:**

Manually confirmed charities to make inactive:
  - PTA FLORIDA CONGRESS
  - WEBB RIVER VALLEY SPORTSMENS CLUB

Manually confirmed charities to make active:
  - MASSACHUSETTS MODERATORS
  - BEARNSTOW

Automatically marked as inactive:
 - THE PUMPKIN PATCH FOR KIDS
 - COUNCIL OF CHURCHES OF THE ISLANDS



*Nice to haves:*

- Speed of processing, processing ~600k records and counting not ideal
