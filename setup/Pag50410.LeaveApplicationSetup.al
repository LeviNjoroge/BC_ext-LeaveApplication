page 50410 "Leave Application Setup"
{
    ApplicationArea = All;
    Caption = 'Leave Application Setup';
    PageType = Card;
    SourceTable = SetupTable;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Primary Key"; Rec."Primary Key")
                {
                }
                field("Member No. Prefix"; Rec."Member No. Prefix")
                {
                }
            }
            group("Leave Days"){
                group("Annual Leave"){
                    field("Junior Employee Leave Days"; Rec."Junior Employee Leave Days")
                    {
                    }
                    field("Mid Employee Leave Days"; Rec."Mid Employee Leave Days")
                    {
                    }
                    field("Senior Employee Leave Days"; Rec."Senior Employee Leave Days")
                    {
                    }
                }
                field("Maternity Leave Days"; Rec."Maternity Leave Days")
                {
                }
                field("Paternity Leave Days"; Rec."Paternity Leave Days")
                {
                }
            }
            group("Admin")
            {
                field("Approvals Admin's Email"; Rec."Approvals Admin's Email")
                {
                    ApplicationArea = All;
                }
                field("Admin's Business Card"; Rec."Admin's Business Card")
                {
                    ApplicationArea = All;
                }


            }
            group("Log info"){
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                }
            }
        }
    }
}
