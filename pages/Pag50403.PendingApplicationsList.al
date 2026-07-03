page 50403 "Pending Applications List"
{
    ApplicationArea = All;
    Caption = 'Pending Applications List';
    PageType = List;
    SourceTable = LeaveApplicationsTable;
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ApplicationNo; Rec.ApplicationNo)
                {
                    ToolTip = 'Specifies the value of the ApplicationNo field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Application Date"; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
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
                field("Approval Date"; Rec."Approval Date")
                {
                    ToolTip = 'Specifies the value of the Approval Date field.', Comment = '%';
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                    ToolTip = 'Specifies the value of the Rejection Reason field.', Comment = '%';
                }
            }
        }
    }
}
