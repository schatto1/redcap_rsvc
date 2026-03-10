Feature: Executed EIC Form Storage: The Backup storage shall have data encryption enabled for all files.
FRS: The Backup storage location will have data encryption enabled.
CS: Storage systems use self-encrypting drives (SED) to encrypt the data at rest. These systems come from multiple vendors; Dell, Supermicro, Toshiba, and Seagate.
Storage arrays are all configured with redundancy, either RAID6 or 6+3 erasure coding. Drive vendor encryption meets FIPS 140-2 certification.

SED Drive Vendors:
Toshiba SED NIST certification:
https://csrc.nist.gov/projects/cryptographic-module-validation-program/Certificate/2082
Seagate SED NIST certification:
https://csrc.nist.gov/projects/cryptographic-module-validation-program/certificate/4141



  As a REDCap end user
  I want to see that the Backup storage shall have data encryption enabled for all files.

  #This feature test is REDUNDANT and can be viewed in Feature: D.100.1.1700 - Standard encryption
  #Scenario: D.100.1.1700.100 Backup storage location encryption