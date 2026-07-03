codeunit 50402 SendNotifications
{
    // the notifications emails sent from this application include:
    // 1. Successful registration
    // 2. Unsuccessful registration
    // 3. Successful application
    // 4. Unsuccessful/rejected application
    procedure SuccessfulRegistrationEmail(EmailAddress: Text; EmployeeNumber: Code[20]; Name: Text)
    // This sends users an email once their account is verified/approved
    begin
        EmailMessage.Create(EmailAddress, 'Successful Registration!',StrSubstNo('Dear %1, your application to join the Coretec Leave Application Management System (CoLAMS) has been approved!. <br>Your employee number is %2',Name, EmployeeNumber),true);
        Email.Send(EmailMessage);
    end;

    procedure RejectedRegistrationEmail(EmailAddress: Text; Name: Text)
    begin
        EmailMessage.Create(EmailAddress, 'Unsuccessful Registration!',StrSubstNo('Dear %1, we regret to inform you that your application to join the Coretec Leave Application Management System (CoLAMS) was rejected.<br>Please contact the system admin for further information and assistance.<br>Thank you!', Name),true);
        Email.Send(EmailMessage);
    end;

    procedure ApprovedLeaveApplicationEmail(EmployeeID: Code[20]; LeaveType: Enum "Leave Application Types"; StartDate : Date; EndDate: Date; ReturnDate: Date)
    var
        Employee: Record EmployeeTable;
    begin
        if Employee.Get(EmployeeID) then begin
            EmailMessage.Create(Employee."Email Address", 'Approved Leave Application', StrSubstNo('Dear %1, your request to go on %2 from %3 to %4 has been <b>Approved!</b><br>You are expected to resume your duties on %5.<br>Enjoy your leave!', Employee."First Name", LeaveType, StartDate, EndDate, ReturnDate), true);
            Email.Send(EmailMessage);
        end else begin
            Error('Email not sent as Employee with ID %1 was not found', EmployeeID);
        end;
    end;

    procedure RejectedLeaveApplicationEmail(EmployeeID: Code[20]; LeaveType: Enum "Leave Application Types"; StartDate : Date; EndDate: Date; Reason: Text)
    var
        Employee: Record EmployeeTable;
        varReason: Text[100];
    begin
        if Reason <> '' then begin
            varReason := StrSubstNo('because <i>%1</i>', Reason)
        end else begin
            varReason := '';
        end;
        if Employee.Get(EmployeeID) then begin
            EmailMessage.Create(Employee."Email Address", 'Rejected Leave Application', StrSubstNo('Dear %1, your request to go on %2 from %3 to %4 was rejected %5!<br>Please contact your supervisor for further assistance.<br>Thank you!', Employee."First Name", LeaveType, StartDate, EndDate, varReason), true);
            Email.Send(EmailMessage);
        end else begin
            Error('Email not sent as Employee with ID %1 was not found', EmployeeID);
        end;
    end;

    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
}