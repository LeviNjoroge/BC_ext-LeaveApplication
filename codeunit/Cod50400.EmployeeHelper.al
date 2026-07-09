codeunit 50400 "EmployeeHelper"
{
    procedure UpdateLeaveTaken(ID: Code[12]; Days: Integer)
    var
        Employee : Record EmployeeTable;
    begin
        if Employee.Get(ID) then begin
            // Employee.Leave_Taken := Employee.Leave_Taken + Days;
            Employee.Validate(Leave_Taken, Employee.Leave_Taken + Days);
            Employee.Modify();
        end;
    end;
    
    procedure RegisterMembers(ApplicationID:Integer)
    var
        EmployeeApplication: Record EmployeeApplicationTable;
        Employee: Record EmployeeTable;
        Setup : Record SetupTable;
        SendNotification: Codeunit SendNotifications;
    begin
        if EmployeeApplication.Get(ApplicationID) then begin
            if EmployeeApplication.Status = EmployeeApplication.Status::Approved then begin
                // transfer data
                Employee.Init();
                Employee.EmployeeNo := EmployeeNoGenerator();
                Employee."First Name" := EmployeeApplication."First Name";
                Employee.Surname := EmployeeApplication.Surname;
                Employee."Date of Birth" := EmployeeApplication."Date of Birth";
                Employee.Gender := EmployeeApplication.Gender;
                Employee."Telephone Number" := EmployeeApplication."Telephone Number";
                Employee."Email Address" := EmployeeApplication."Email Address";
                Employee."Physical Address" := EmployeeApplication."Physical Address";
                Employee."National ID/ Passport No." := EmployeeApplication."National ID/ Passport No.";
                Employee."Marital Status" := EmployeeApplication."Marital Status";
                Employee."Date of Joining" := EmployeeApplication."Date of Joining";
                Employee."Job Title" := EmployeeApplication."Job Title";
                Employee.Validate(Employee."Employment Tier", EmployeeApplication."Employment Tier");
                Employee.Department := EmployeeApplication.Department;
                Employee.Insert();
                // send email
                SendNotification.SuccessfulRegistrationEmail(Employee."Email Address", Employee.EmployeeNo, Employee."First Name");
                Message('Success!\Application has been approved.\Employee has received confirmation email.');
                EmployeeApplication.Delete();
            end else if EmployeeApplication.Status= EmployeeApplication.Status::Rejected then begin
                SendNotification.RejectedRegistrationEmail(EmployeeApplication."Email Address", EmployeeApplication."First Name");
                Message('Application has been rejected!\Employee has been notified.');
            end else begin
                Message('Application is still awaiting approval.\Status: Pending');
            end;
        end;
    end;

    local procedure EmployeeNoGenerator(): Code[20]
    var
        Employee : Record EmployeeTable;
        EmployeeCount : Integer;
    begin
        EmployeeCount := Employee.Count + 1;
        exit('EMP-'+Format(Today, 0, '<Year, 2><Month, 2>')+PadStr('', 4-StrLen(Format(EmployeeCount)), '0')+Format(EmployeeCount));
    end;
    
}