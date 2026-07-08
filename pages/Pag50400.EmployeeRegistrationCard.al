page 50400 "Employee Registration Card"
{
    ApplicationArea = All;
    Caption = 'Employee Registration Card';
    PageType = Card;
    SourceTable = EmployeeApplicationTable;

    layout
    {
        area(Content)
        {
            group("General Information")
            {
                field("ApplicationNo."; Rec."ApplicationNo.")
                {
                    ToolTip = 'Specifies the value of the ApplicationNo. field.', Comment = '%';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                    Editable = false;
                }
            }
            group("Personal Information")
            {

                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.', Comment = '%';
                }
                field(Surname; Rec.Surname)
                {
                    ToolTip = 'Specifies the value of the Surname field.', Comment = '%';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ToolTip = 'Specifies the value of the Date of Birth field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field("National ID/ Passport No."; Rec."National ID/ Passport No.")
                {
                    ToolTip = 'Specifies the value of the National ID/ Passport No. field.', Comment = '%';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ToolTip = 'Specifies the value of the Marital Status field.', Comment = '%';
                }
            }
            group("Contact Information")
            {
                field("Telephone Number"; Rec."Telephone Number")
                {
                    ToolTip = 'Specifies the value of the Telephone Number field.', Comment = '%';
                }
                field("Email Address"; Rec."Email Address")
                {
                    ToolTip = 'Specifies the value of the Email Address field.', Comment = '%';
                }
                field("Physical Address"; Rec."Physical Address")
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
            }
            group("Employment Information")
            {
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ToolTip = 'Specifies the value of the Date of Joining field.', Comment = '%';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ToolTip = 'Specifies the value of the Job Title field.', Comment = '%';
                }
                field("Employment Tier"; Rec."Employment Tier")
                {
                    ToolTip = 'Specifies the value of the Employment Tier field.', Comment = '%';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
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
                end;
            }
            action(Reject)
            {
                Image = Reject;
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Rejected;
                end;
            }
            action(Submit)
            {
                Image = Completed;
                Enabled = not isEnabled;
                Caption = 'Submit Application';
                trigger OnAction()
                var
                    EmployeeRegisteration: Codeunit EmployeeHelper;
                begin

                    EmployeeRegisteration.RegisterMembers(Rec."ApplicationNo.");
                end;
            }
        }
    }

    var
        isEnabled: Boolean;
}

