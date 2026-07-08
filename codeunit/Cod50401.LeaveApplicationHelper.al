codeunit 50401 "Leave Application Helper"
{
    procedure RefreshLeaveDays()
    var
        Employee: Record EmployeeTable;
        ID: Code[12];
    begin
        if Employee.FindSet() then
            repeat
                Employee."Leave Balance" := Employee."Leave Balance" + Employee."Annual Leave Entitlement";
                Employee.Modify();
            until Employee.Next() = 0;
    end;

    // Total Days Requested: A calculated field (End Date minus Start Date). You may need to build logic to exclude weekends and public holidays.
    procedure CalculateAnnualLeaveEnd(EmployeeID: Code[12];
        StartDate: Date;
        Days: Integer): Date
    var
        Employee: Record EmployeeTable;
        EndDate: Date;
        CalenderManager : Codeunit "Calendar Management";
        CalenderChange: Record "Customized Calendar Change";
        CustomCalender : array[2] of Record "Customized Calendar Change";
        CompanyInfo: Record "Company Information";
    begin
        CompanyInfo.Get();
        CalenderManager.SetSource(CompanyInfo, CalenderChange);
        CustomCalender[1] := CalenderChange;
        if Employee.Get(EmployeeID) then begin
            if Employee."Leave Balance" >= Days then begin
                EndDate:= CalenderManager.CalcDateBOC(StrSubstNo('%1D', Days), StartDate, CustomCalender, true);
            end else begin
                Error('Requested leave exceeds the available balance!\The current leave balance is: %1', Employee."Leave Balance");
            end;
        end else begin
            Error('Employee ID %1 was not found!\Contact system admin promptly.', EmployeeID);
        end;
        exit(EndDate);
    end;

    procedure CalculateOtherLeaveEnd(StartDate: Date; Days: Integer): Date
    var
        EndDate: Date;
    begin
        exit(EndDate);
    end;

    // procedure TestCalendar()
    //     var
    //         CompanyInfo: Record "Company Information";
    //         CalendarManagement: Codeunit "Calendar Management";
    //         CalendarChange: Record "Customized Calendar Change";
    //         TestDate: Date;
    //     begin
    //         CompanyInfo.Get();

    //         CalendarManagement.SetSource(CompanyInfo, CalendarChange);

    //         TestDate := DMY2Date(12, 7, 2026); // Sunday

    //         if CalendarManagement.IsNonworkingDay(TestDate, CalendarChange) then
    //             Message('%1 is a non-working day.', TestDate)
    //         else
    //             Message('%1 is a working day.', TestDate);
    //     end;

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
                ApprovedApplications."No. of days" := LeaveApplications."No. of days";
                ApprovedApplications.Comments := LeaveApplications.Comments;
                ApprovedApplications.Attachments := LeaveApplications.Attachments;
                ApprovedApplications.ApprovalDate := LeaveApplications."Approval Date";
                ApprovedApplications.Insert();
                // deduct the remaining leave days
                EmployeeHelper.UpdateLeaveTaken(ApprovedApplications.Employee, ApprovedApplications."No. of days");
                // send email: - dear employee, your request to go on [type] leave from start date to end date has been approved. you are set to resume your duties on extected return date
                SendNotifications.ApprovedLeaveApplicationEmail(ApprovedApplications.Employee, ApprovedApplications."Leave Type", ApprovedApplications."Start date", ApprovedApplications."End date");
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
        EmployeeHelper: Codeunit EmployeeHelper;
}