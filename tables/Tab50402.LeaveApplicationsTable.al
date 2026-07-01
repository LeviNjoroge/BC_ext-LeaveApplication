table 50402 LeaveApplicationsTable
{
    Caption = 'LeaveApplicationsTable';
    DataClassification = AccountData;
    
    fields
    {
        field(1; ApplicationNo; Integer)
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
    }
    keys
    {
        key(PK; ApplicationNo)
        {
            Clustered = true;
        }
    }
}
