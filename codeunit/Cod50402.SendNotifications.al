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
        EmailMessage.Create(EmailAddress, 'Successful Registration!',StrSubstNo('Dear %1, your application to join the Coretec Leave Application Management System (CoLAMS) has been approved!. <br>Your employee number is %1',Name, EmployeeNumber),true);
        Email.Send(EmailMessage);
    end;

    procedure RejectedRegistrationEmail(EmailAddress: Text; Name: Text)
    begin
        EmailMessage.Create(EmailAddress, 'Unsuccessful Registration!',StrSubstNo('Dear %1, we regret to inform you that your application to join the Coretec Leave Application Management System (CoLAMS) was rejected.<br>Please contact the system admin for further information and assistance.<br>Thank you!', Name),true);
        Email.Send(EmailMessage);
    end;

    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
}