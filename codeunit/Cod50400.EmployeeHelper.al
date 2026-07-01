codeunit 50400 "Employee Helper"
{

    procedure RegisterMembers(ApplicationID:Integer)
    var
        EmployeeApplication: Record EmployeeApplicationTable;
        Employee: Record EmployeeTable;
    begin
        if EmployeeApplication.Get(ApplicationID) then begin
            if EmployeeApplication.Status = EmployeeApplication.Status::Approved then begin
                Message('Success!\Application has been approved.\Employee has received confirmation email.');
                // EmployeeApplication.Delete();
            end else if EmployeeApplication.Status= EmployeeApplication.Status::Rejected then begin
                Message('Application has been rejected!\Employee has been notified.');
                // EmployeeApplication.Delete();
            end else begin
                Message('Application is still awaiting approval.\Status: Pending');
            end;
        end;
    end;

    
}