page 50404 "Approved Applications List"
{
    ApplicationArea = All;
    Caption = 'Approved Applications List';
    PageType = List;
    SourceTable = ApprovedApplications;
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(LeaveNo; Rec.LeaveNo)
                {
                    ToolTip = 'Specifies the value of the ApplicationNo field.', Comment = '%';
                }
                field(Employee; Rec.Employee)
                {
                    ToolTip = 'Specifies the value of the Employee field.', Comment = '%';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ToolTip = 'Specifies the value of the Leave Type field.', Comment = '%';
                }
                field("Start date"; Rec."Start date")
                {
                    ToolTip = 'Specifies the value of the Start date field.', Comment = '%';
                }
                field("End date"; Rec."End date")
                {
                    ToolTip = 'Specifies the value of the End date field.', Comment = '%';
                }
                field("Expected return date"; Rec."Expected return date")
                {
                    ToolTip = 'Specifies the value of the Expected return date field.', Comment = '%';
                }
                field("No. of days"; Rec."No. of days")
                {
                    ToolTip = 'Specifies the value of the No. of days field.', Comment = '%';
                }
                field(Comments; Rec.Comments)
                {
                    ToolTip = 'Specifies the value of the Comments field.', Comment = '%';
                }
                field(Attachments; Rec.Attachments)
                {
                    ToolTip = 'Specifies the value of the Attachments field.', Comment = '%';
                }
                field(LeaveApplicationDate; Rec.LeaveApplicationDate)
                {
                    ToolTip = 'Specifies the value of the LeaveApplicationDate field.', Comment = '%';
                }
                field(ApprovalDate; Rec.ApprovalDate)
                {
                    ToolTip = 'Specifies the value of the ApprovalDate field.', Comment = '%';
                }
            }
        }
    }
}
