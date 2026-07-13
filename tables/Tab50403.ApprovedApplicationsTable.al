table 50403 ApprovedApplications
{
    Caption = 'Approved Applications Table';
    DataClassification = AccountData;
    
    fields
    {
        field(1; LeaveNo; Code[20])
        {
            Caption = 'ApplicationNo';
        }
        field(2; Employee; Code[12])
        {
            Caption = 'Employee';
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
        field(7; "No. of days"; Integer)
        {
            Caption = 'No. of days';
            // should be updated by a codeunit
        }
        field(8; Comments; Text[100])
        {
            Caption = 'Comments';
        }
        field(9; Attachments; Media)
        {
            Caption = 'Attachments';
        }
        field(10; LeaveApplicationDate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; ApprovalDate; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; LeaveNo)
        {
            Clustered = true;
        }
    }
}
