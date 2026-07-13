page 50411 "Employee Single"
{
    ApplicationArea = All;
    Caption = 'Employee Single';
    PageType = Card;
    SourceTable = EmployeeTable;

    layout
    {
        area(Content)
        {
            group("General Information")
            {
                field(EmployeeNo; Rec.EmployeeNo)
                {
                    ApplicationArea = All;
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
            group("Leave days")
            {
                field("Annual Leave Entitlement"; Rec."Annual Leave Entitlement")
                {
                    ApplicationArea = All;
                }
                field(Leave_Taken; Rec.Leave_Taken)
                {
                    ApplicationArea = All;
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = All;
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
        area(Processing)
        {
            action("SandBox:testingBlobInS")
            {
                trigger OnAction()
                var
                    Sandbox: Codeunit SandboxCodeunit;
                begin
                    Sandbox.DownloadAdminBC();
                end;
            }
            action("TestAttachment")
            {
                trigger OnAction()
                var
                    Sandbox: Codeunit SendNotifications;
                begin
                    Sandbox.SuccessfulRegistrationEmail('junelee205@gmail.com', '34234', 'Jay');
                end;
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

    var
        isEnabled: Boolean;
}

