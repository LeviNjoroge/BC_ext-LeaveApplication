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
                field(EmployeeID; Rec.Employee)
                {
                    ToolTip = 'Specifies the value of the Employee field.', Comment = '%';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ToolTip = 'Specifies the value of the Leave Type field.', Comment = '%';
                    trigger OnValidate()
                    var
                        Setup: Record SetupTable;
                    begin
                        Setup.Get('SETUP');
                        if Rec."Leave Type" = Rec."Leave Type"::"Maternity Leave" then begin
                            Rec."No. of days" := Setup."Maternity Leave Days";
                            Rec."End date" := rec."Start date" + Rec."No. of days";
                        end else if Rec."Leave Type" = Rec."Leave Type"::"Paternity Leave" then begin
                            Rec."No. of days" := Setup."Paternity Leave Days";
                            Rec."End date" := rec."Start date" + Rec."No. of days";
                        end;
                    end;
                }
                field("Start date"; Rec."Start date")
                {
                    ToolTip = 'Specifies the value of the Start date field.', Comment = '%';
                }
                field("No. of days"; Rec."No. of days")
                {
                    Editable = (Rec."Leave Type" <> Rec."Leave Type"::"Maternity Leave") and (Rec."Leave Type" <> Rec."Leave Type"::"Paternity Leave");
                    ToolTip = 'Specifies the value of the No. of days field.', Comment = '%';
                    trigger OnValidate()
                    var
                        LeaveApplicationHelper: Codeunit "Leave Application Helper";
                    begin
                        if Rec."Leave Type" = Rec."Leave Type"::"Annual Leave" then begin
                            Rec."End date" := LeaveApplicationHelper.CalculateAnnualLeaveEnd(Rec.Employee, rec."Start date", rec."No. of days");
                        end else
                            Rec."End date" := rec."Start date" + Rec."No. of days";
                    end;
                }
                field("End date"; Rec."End date")
                {
                    ToolTip = 'Specifies the value of the End date field.', Comment = '%';
                    Editable = false;
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
