codeunit 50401 "Leave Application Helper"
{
    // Total Days Requested: A calculated field (End Date minus Start Date). You may need to build logic to exclude weekends and public holidays.
    procedure LeaveDaysCalculator(EmployeeID: Integer; StartDate: Date; Days: Integer): Date
    var
        Employee: Record EmployeeTable;
        EndDate: Date;
        CalenderManager : Codeunit "Calendar Management";
        CustomCalender : array[2] of Record "Customized Calendar Change";
    begin
        CustomCalender.
        if Employee.Get(EmployeeID) then begin
            if Employee."Leave Balance" >= Days then begin
                EndDate:= CalenderManager.CalcDateBOC(StrSubstNo('%1D', Days), StartDate, CustomCalender, true);
            end else begin
                Error('Requested leave exceeds the available balance by %1 days!', Employee."Leave Balance");
            end;
        end else begin
            Error('Employee ID %1 was not found!\Contact system admin promptly.', EmployeeID);
        end;
        exit(EndDate);
    end;


    procedure Submit(ID: Integer)
    begin
        if LeaveApplications.Get(ID) then begin
            if LeaveApplications.Status = LeaveApplications.Status::Approved then begin
                ApprovedApplications.Init();
                ApprovedApplications.LeaveNo := LeaveNoGenerator();
                ApprovedApplications.Employee := LeaveApplications.Employee;
                ApprovedApplications.LeaveApplicationDate := LeaveApplications.SystemCreatedAt.Date;
                ApprovedApplications."Leave Type" := LeaveApplications."Leave Type";
                ApprovedApplications."Start date" := LeaveApplications."Start date";
                ApprovedApplications."End date" := LeaveApplications."End date";
                ApprovedApplications."Expected return date" := LeaveApplications."Expected Return Date";
                ApprovedApplications."No. of days" := LeaveApplications."No. of days";
                ApprovedApplications.Comments := LeaveApplications.Comments;
                ApprovedApplications.Attachments := LeaveApplications.Attachments;
                ApprovedApplications.ApprovalDate := LeaveApplications."Approval Date";
                ApprovedApplications.Insert();
                // send email: - dear employee, your request to go on [type] leave from start date to end date has been approved. you are set to resume your duties on extected return date
                SendNotifications.ApprovedLeaveApplicationEmail(ApprovedApplications.Employee, ApprovedApplications."Leave Type", ApprovedApplications."Start date", ApprovedApplications."End date", ApprovedApplications."Expected return date");
            end else if LeaveApplications.Status = LeaveApplications.Status::Rejected then begin
                SendNotifications.RejectedLeaveApplicationEmail(LeaveApplications.Employee, LeaveApplications."Leave Type", LeaveApplications."Start date", LeaveApplications."End date", LeaveApplications."Rejection Reason");
            end;
        end;
    end;

    local procedure LeaveNoGenerator(): Code[20]
    var
        ApprovedAppsCount : Integer;
    begin
        ApprovedAppsCount := ApprovedApplications.Count + 1;
        exit('APR-'+Format(Today, 0, '<Year, 2><Month, 2>')+PadStr('', 4-StrLen(Format(ApprovedAppsCount)), '0')+Format(ApprovedAppsCount));
    end;

    var
        LeaveApplications: Record LeaveApplicationsTable;
        ApprovedApplications: Record ApprovedApplications;
        SendNotifications: Codeunit SendNotifications;
}