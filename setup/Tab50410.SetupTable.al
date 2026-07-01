table 50410 SetupTable
{
    Caption = 'SetupTable';
    DataClassification = OrganizationIdentifiableInformation;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Member No. Prefix"; Code[10])
        {
            Caption = 'Member No. Prefix';
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
