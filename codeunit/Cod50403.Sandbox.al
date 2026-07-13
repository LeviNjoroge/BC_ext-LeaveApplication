codeunit 50403 SandboxCodeunit
{
    procedure DownloadAdminBC()
    var
        InS: InStream;
        Setup: Record SetupTable;
        FileName: text;
    begin
        Setup.GetSetup();
        FileName := 'Admin''sBC.png';

        Setup.CalcFields("Admin's Business Card");

        if not Setup."Admin's Business Card".HasValue then
            Error('No value.');

        Setup."Admin's Business Card".CreateInStream(InS);

        Setup."Admin's Business Card".CreateInStream(InS);
        DownloadFromStream(InS, '', '', '', fileName);
        Message('%1 downloaded!', FileName);
    end;

    procedure DownloadAdminBC2()
    var
        TempBlob: Codeunit "Temp Blob";
        InS: InStream;
        OutS: OutStream;
        Setup: Record SetupTable;
        FileName: Text;
    begin
        Setup.GetSetup();
        Setup.CalcFields("Admin's Business Card");

        Setup."Admin's Business Card".CreateInStream(InS);

        TempBlob.CreateOutStream(OutS);
        CopyStream(OutS, InS);

        TempBlob.CreateInStream(InS);
        FileName := 'Test.png';
        DownloadFromStream(InS, '', '', '', FileName);
    end;

    procedure SendEmailWAttachment()
    var
       Email: Codeunit Email;
       EmailMessage: Codeunit "Email Message";
       InS: InStream;
    begin
        EmailMessage.Create('junelee205@gmail.com', 'EmailAttachmentTest', 'Sending an email w an attachment!', true);
        EmailMessage.AddAttachment('hr bc', '', InS);
        Email.Send(EmailMessage);
    end;

    procedure TestAttachment()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        BlobIn: InStream;
        BlobOut: OutStream;
        EmailIn: InStream;
        Setup: Record SetupTable;
    begin
        Setup.GetSetup();
        Setup.CalcFields("Admin's Business Card");

        Setup."Admin's Business Card".CreateInStream(BlobIn);

        TempBlob.CreateOutStream(BlobOut);
        CopyStream(BlobOut, BlobIn);

        TempBlob.CreateInStream(EmailIn);

        Clear(EmailMessage);

        EmailMessage.Create(
            'junelee205@gmail.com',
            'Successful Registration!',
            'Test',
            true);

        EmailMessage.AddAttachment(
            'AdminBusinessCard.png',
            'image/png',
            EmailIn);

        Email.Send(EmailMessage);
    end;
}