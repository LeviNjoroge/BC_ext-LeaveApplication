page 50401 "Registered Employees List"
{
    ApplicationArea = All;
    Caption = 'Registered Employees List';
    PageType = List;
    SourceTable = EmployeeTable;
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(EmployeeNo; Rec.EmployeeNo)
                {
                    ToolTip = 'Specifies the value of the ApplicationNo. field.', Comment = '%';
                    Editable = fa
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.', Comment = '%';
                }
                field(Surname; Rec.Surname)
                {
                    ToolTip = 'Specifies the value of the Surname field.', Comment = '%';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ToolTip = 'Specifies the value of the Date of Birth field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field("Telephone Number"; Rec."Telephone Number")
                {
                    ToolTip = 'Specifies the value of the Telephone Number field.', Comment = '%';
                }
                field("Email Address"; Rec."Email Address")
                {
                    ToolTip = 'Specifies the value of the Email Address field.', Comment = '%';
                }
                field("Physical Address"; Rec."Physical Address")
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field("National ID/ Passport No."; Rec."National ID/ Passport No.")
                {
                    ToolTip = 'Specifies the value of the National ID/ Passport No. field.', Comment = '%';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ToolTip = 'Specifies the value of the Marital Status field.', Comment = '%';
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ToolTip = 'Specifies the value of the Date of Joining field.', Comment = '%';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ToolTip = 'Specifies the value of the Job Title field.', Comment = '%';
                }
                field("Employment Tier"; Rec."Employment Tier")
                {
                    ToolTip = 'Specifies the value of the Employment Tier field.', Comment = '%';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field("Annual Leave Entitlement"; Rec."Annual Leave Entitlement")
                {
                    ToolTip = 'Specifies the value of the Annual Leave Entitlement field.', Comment = '%';
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ToolTip = 'Specifies the value of the Leave Balance field.', Comment = '%';
                }
            }
        }
    }
}
