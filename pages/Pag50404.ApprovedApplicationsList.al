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
    actions
    {
        area(Promoted)
        {
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
        }
    }
}
