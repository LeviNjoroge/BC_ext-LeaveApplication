codeunit 50400 "EmployeeRegistration"
{

    procedure RegisterMembers(ApplicationID:Integer)
    var
        EmployeeApplication: Record EmployeeApplicationTable;
        Employee: Record EmployeeTable;
        Setup : Record SetupTable;
    begin
        Setup.Get('SETUP1');
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
                Employee."Employment Tier" := EmployeeApplication."Employment Tier";
                Employee.Department := EmployeeApplication.Department;
                if Employee."Employment Tier" = Employee."Employment Tier"::Junior then begin
                    Employee."Annual Leave Entitlement" := Setup."Junior Employee Leave Days";
                end else if Employee."Employment Tier" = Employee."Employment Tier"::Mid then begin
                    Employee."Annual Leave Entitlement" := Setup."Mid Employee Leave Days";
                end else if Employee."Employment Tier" = Employee."Employment Tier"::Senior then begin
                    Employee."Annual Leave Entitlement" := Setup.;
                end;
                Employee.Insert();
                // send email
                Message('Success!\Application has been approved.\Employee has received confirmation email.');
                // EmployeeApplication.Delete();
            end else if EmployeeApplication.Status= EmployeeApplication.Status::Rejected then begin
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