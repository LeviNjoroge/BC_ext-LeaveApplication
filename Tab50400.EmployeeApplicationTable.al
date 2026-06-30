table 50400 EmployeeApplicationTable
{
    Caption = 'EmployeeApplicationTable';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "ApplicationNo."; Integer)
        {
            Caption = 'ApplicationNo.';
            AutoIncrement = true;
            MinValue = 1;
        }
        field(2; "First Name"; Text[20])
        {
            Caption = 'First Name';
        }
        field(3; Surname; Text[20])
        {
            Caption = 'Surname';
        }
        field(4; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
        }
        field(5; Gender; Enum "Employee Gender")
        {
            Caption = 'Gender';
        }
        field(6; "Telephone Number"; Text[13])
        {
            Caption = 'Telephone Number';
            ExtendedDatatype = PhoneNo;
        }
        field(7; "Email Address"; Text[50])
        {
            Caption = 'Email Address';
            ExtendedDatatype = EMail;
        }
        field(8;"Physical Address"; Text[30])
        {
            Caption = 'Address';
        }
        field(9; "National ID/ Passport No."; Code[10])
        {
            Caption = 'National ID/ Passport No.';
        }
        field(10; "Marital Status"; Option)
        {
            Caption = 'Marital Status';
            OptionMembers = "Single", "Married","Separated","Divorced";
        }
        field(11; "Date of Joining"; Date)
        {
            Caption = 'Date of Joining';
        }
        field(12; "Job Title"; Text[20])
        {
            Caption = 'Job Title';
        }
        field(13; "Employment Tier"; Enum "Employee Gender")
        {
            Caption = 'Employment Tier';
        }
        field(14; Department; Enum Departments)
        {
            Caption = 'Department';
        }
    }
    keys
    {
        key(PK; "ApplicationNo.")
        {
            Clustered = true;
        }
    }
}
