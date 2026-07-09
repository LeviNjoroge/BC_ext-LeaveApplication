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
        field(3; "Junior Employee Leave Days"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Mid Employee Leave Days"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Senior Employee Leave Days"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Maternity Leave Days"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Paternity Leave Days"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Approvals Admin's Email"; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    procedure GetSetup()
    begin
        if not Get('SETUP') then
            Error('Leave setup has not been configured.');
    end;
}
