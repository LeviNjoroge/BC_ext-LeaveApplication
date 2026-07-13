page 50405 AttachmentsPart
{
    Caption = 'Attachments';
    PageType = Cardpart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = LeaveApplicationsTable;
    
    layout
    {
        area(Content)
        {
            group("")
            {
                field(Attachments; Rec.Attachments)
                {
                    ApplicationArea = All;
                }
                
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(AddAttachment)
            {
                Caption = 'Upload';
                Image = Add;
                trigger OnAction()
                var
                    InS : InStream;
                    FileName: Text;
                begin
                    if UploadIntoStream('Select', '', 'Pdf File (*.pdf)|*.pdf', FileName, InS) then begin
                        Rec.Attachments.ImportStream(InS, FileName);
                        Rec.Modify();
                        Message('Attachment uploaded successfully!');
                    end;
                end;
            }
            action(DownloadAttachment)
            {
                Caption = 'Download';
                Image = Download;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    Ins: InStream;
                    FileName: Text;
                begin
                    if Rec.Attachments.HasValue then begin
                        FileName := Format(Rec.Employee)+'-'+Format(Rec."Leave Type")+'-AttachmentFile.pdf';
                        TempBlob.CreateOutStream(OutS);
                        Rec.Attachments.ExportStream(OutS);
                        TempBlob.CreateInStream(Ins);
                        DownloadFromStream(Ins, '', '', '', FileName);
                    end;
                end;
            }
            action(RemoveAttachment)
            {
                Caption = 'Delete';
                image = Delete;
                trigger OnAction()
                begin
                    if Rec.Attachments.HasValue then begin
                        Clear(Rec.Attachments);
                        Rec.Modify();
                    end;
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}