table 50402 LeaveApplicationsTable
{
    Caption = 'Leave Applications Table';
    DataClassification = AccountData;
    
    fields
    {
        field(1; ApplicationNo; Integer)
        {
            Caption = 'ApplicationNo';
            AutoIncrement = true;
            MinValue = 1001;
        }
        field(2; Employee; Code[12])
        {
            Caption = 'Employee';
            TableRelation = EmployeeTable;
        }
        field(3; "Leave Type"; Enum "Leave Application Types")
        {
            Caption = 'Leave Type';
        }
        field(4; "Start date"; Date)
        {
            Caption = 'Start date';
        }
        field(5; "End date"; Date)
        {
            Caption = 'End date';
        }
        field(6; "No. of days"; Integer)
        {
            Caption = 'No. of days';
            // should be updated by a codeunit
        }
        field(7; Comments; Text[100])
        {
            Caption = 'Comments';
        }
        field(8; Attachments; Media)
        {
            Caption = 'Attachments';
        }
        field(9; "Approval Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Rejection Reason"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Pending, Approved, Rejected;
        }
        field(12; "Expected Return Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; ApplicationNo)
        {
            Clustered = true;
        }
    }
}
