// pageextension 50409 NavigationPagePart extends "Registered Employees List" 
// {

//     actions
//     {
//         area(Promoted)
//         {
//             group(Employee)
//             {
//                 actionref(Register; Registration) { }
//                 actionref(List; Employees) { }
//             }
//             group(Applications)
//             {
//                 actionref(Apply; Application) { }
//                 actionref(Pendings; Pending) { }
//                 actionref(Approvals; Approved) { }
//             }
//         }
//         area(Navigation)
//         {
//             action(Registration)
//             {
//                 Image = Employee;
//                 trigger OnAction()
//                 var
//                     EmployeeReg: Page "Employee Registration Card";
//                 begin
//                     EmployeeReg.Run();
//                 end;
//             }
//             action(Employees)
//             {
//                 Image = CustomerList;
//                 trigger OnAction()
//                 var
//                     Employees: Page "Registered Employees List";
//                 begin
//                     Employees.Run();
//                 end;
//             }
//             action(Application)
//             {
//                 Image = ApplyTemplate;
//                 trigger OnAction()
//                 var
//                     ApplicationPage: Page "Leave Application";
//                 begin
//                     ApplicationPage.Run();
//                 end;
//             }
//             action(Pending)
//             {
//                 Caption = 'Pending Approval';
//                 Image = Approvals;
//                 trigger OnAction()
//                 var
//                     PendingList: Page "Pending Applications List";
//                 begin
//                     PendingList.Run();
//                 end;
//             }
//             action(Settings)
//             {
//                 image = Administration;
//                 trigger OnAction()
//                 var
//                     setup: Page "Leave Application Setup";
//                 begin
//                     setup.Run();
//                 end;
//             }
//             action(Approved)
//             {
//                 Caption = 'Approved Applications';
//                 Image = ReleaseDoc;
//                 trigger OnAction()
//                 var
//                     ApprovalsList: Page "Approved Applications List";
//                 begin
//                     ApprovalsList.Run();
//                 end;
//             }
//         }
//     }


//     var
//         myInt: Integer;
// }