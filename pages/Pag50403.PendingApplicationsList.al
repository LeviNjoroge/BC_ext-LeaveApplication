page 50403 "Pending Applications List"
{
    ApplicationArea = All;
    Caption = 'Pending Applications List';
    PageType = List;
    SourceTable = LeaveApplicationsTable;
    UsageCategory = Lists;
    CardPageId = "Leave Application";
    
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
                field(EmployeeID; Rec.Employee)
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
    actions
    {
        area(Promoted)
        {
            actionref("Approves"; Approve) { }
            actionref("Rejects"; Reject) { }
            actionref("Submits"; Submit) { }
            group(Employee)
            {
                actionref(Register; Registration) { }
                actionref(List; Employees) { }
            }
            group(Applications)
            {
                actionref(Apply; Application) { }
                actionref(Pendings; Pending) { }
                actionref(Approvals; Approved) { }
            }
            group(Other)
            {
                actionref(Setting; Settings) { }
            }
        }
        area(Navigation)
        {
            action(Registration)
            {
                Image = Employee;
                trigger OnAction()
                var
                    EmployeeReg: Page "Employee Registration Card";
                begin
                    EmployeeReg.Run();
                end;
            }
            action(Employees)
            {
                Image = CustomerList;
                trigger OnAction()
                var
                    Employees: Page "Registered Employees List";
                begin
                    Employees.Run();
                end;
            }
            action(Application)
            {
                Image = ApplyTemplate;
                trigger OnAction()
                var
                    ApplicationPage: Page "Leave Application";
                begin
                    ApplicationPage.Run();
                end;
            }
            action(Pending)
            {
                Caption = 'Pending Approval';
                Image = Approvals;
                trigger OnAction()
                var
                    PendingList: Page "Pending Applications List";
                begin
                    PendingList.Run();
                end;
            }
            action(Settings)
            {
                image = Administration;
                trigger OnAction()
                var
                    setup: Page "Leave Application Setup";
                begin
                    setup.Run();
                end;
            }
            action(Approved)
            {
                Caption = 'Approved Applications';
                Image = ReleaseDoc;
                trigger OnAction()
                var
                    ApprovalsList: Page "Approved Applications List";
                begin
                    ApprovalsList.Run();
                end;
            }
            action(Approve)
            {
                Image = Approval;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Approved;
                    Rec."Approval Date" := CurrentDateTime.Date;
                end;
            }
            action(Reject)
            {
                Image = Reject;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Rejected;
                    Clear(Rec."Approval Date");
                end;
            }
            action(Submit)
            {
                Image = Completed;
                trigger OnAction()
                var
                    LeaveApplicationHelper: Codeunit "Leave Application Helper";
                begin
                    LeaveApplicationHelper.Submit(Rec.ApplicationNo);
                end;
            }
        }
    }
}
