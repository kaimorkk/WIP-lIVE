// page 50221 "Airtime Allowance list"
// {
//     Caption = 'Airtime Allowance list';
//     PageType = List;
//     SourceTable = "Airtime Allocation Header";
//     CardPageId = "Airtime Allowance Card";

//     SourceTableView = where(Status = filter("Open" | "Pending Approval"));

//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {

//                 field(No; Rec.No)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the No field.';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Description field.';
//                 }
//                 field("Document Date"; Rec."Document Date")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Document Date field.';
//                 }
//                 field("Employee No"; Rec."Employee No")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Employee No field.';
//                 }
//                 field("Employee Name"; Rec."Employee Name")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Employee Name field.';
//                 }
//                 field("Requestor ID"; Rec."Requestor ID")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Requestor ID field.';
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Status field.';
//                 }
//             }
//         }
//     }
// }
