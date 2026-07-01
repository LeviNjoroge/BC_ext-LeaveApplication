table 50401 EmployeeTable
{
    Caption = 'EmployeeApplicationTable';
    DataClassification = EndUserIdentifiableInformation;
    
    fields
    {
        field(1; "EmployeeNo"; Code[12])
        {
            Caption = 'ApplicationNo.';
            
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
        field(13; "Employment Tier"; Enum "Employment Tier")
        {
            Caption = 'Employment Tier';
            trigger OnValidate()
            var
            Setup: Record SetupTable;
            begin
                Setup.Get('SETUP1');
                if Rec."Employment Tier" = Rec."Employment Tier"::Junior then begin
                    Rec."Annual Leave Entitlement" := Setup."Junior Employee Leave Days";
                end else if Rec."Employment Tier" = Rec."Employment Tier"::Mid then begin
                    Rec."Annual Leave Entitlement" := Setup."Mid Employee Leave Days";
                end else if Rec."Employment Tier" = Rec."Employment Tier"::Senior then begin
                    Rec."Annual Leave Entitlement" := Setup."Senior Employee Leave Days";
                end;
            end;
        }
        field(14; Department; Enum Departments)
        {
            Caption = 'Department';
        }
        field(15; "Annual Leave Entitlement"; Integer)
        {
        }
        field(16; "Leave Balance"; Integer)
        {
            // FieldClass = FlowField;
            // CalcFormula = sum();
        }
        
    }
    keys
    {
        key(PK; "EmployeeNo")
        {
            Clustered = true;
        }
    }
}
