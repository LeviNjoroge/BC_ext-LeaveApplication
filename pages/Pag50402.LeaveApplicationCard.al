page 50405 "Leave Application"
{
    ApplicationArea = All;
    Caption = 'Leave Application Card';
    PageType = Card;
    SourceTable = LeaveApplicationsTable;
    
    layout
    {
        area(Content)
        {
            group("General Information")
            {   
                field(ApplicationNo; Rec.ApplicationNo)
                {
                    ToolTip = 'Specifies the value of the ApplicationNo field.', Comment = '%';
                    Editable = false;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt.Date)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Application Details")
            {
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
                field("Expected Return Date"; Rec."Expected Return Date")
                {
                    ApplicationArea = All;
                }
                
                field(Comments; Rec.Comments)
                {
                    ToolTip = 'Specifies the value of the Comments field.', Comment = '%';
                }
                field(Attachments; Rec.Attachments)
                {
                    ToolTip = 'Specifies the value of the Attachments field.', Comment = '%';
                }
            }
            group("Approval Information")
            {
                field("Approval Date"; Rec."Approval Date")
                {
                    ToolTip = 'Specifies the value of the Approval Date field.', Comment = '%';
                    Editable = false;
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                    ToolTip = 'Specifies the value of the Rejection Reason field.', Comment = '%';
                    Editable = Rec.Status = Rec.Status::Rejected;
                }
            }
        }
    }
        actions
    {
        area(Promoted){
            actionref("Approves"; Approve){}
            actionref("Rejects"; Reject){}
            actionref("Finish"; "Submit Application"){}
        }
        
        area(Processing)
        {
            action(Approve){
                Image = Approval;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Approved;
                    Rec."Approval Date" := CurrentDateTime.Date;
                end;
            }
            action(Reject){
                Image = Reject;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Rejected;
                    Clear(Rec."Approval Date");
                end;
            }

            action("Submit Application")
            {
                Image = Completed;
                Enabled = not isEnabled;
                trigger OnAction()
                var
                    LeaveApplicationHelper: Codeunit "Leave Application Helper";
                begin
                    LeaveApplicationHelper.Submit(Rec.ApplicationNo);
                    isEnabled:= true;
                end;
            }
        }
    }

    var
        isEnabled:Boolean;
}
