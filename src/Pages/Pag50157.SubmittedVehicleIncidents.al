// page 50157 "Submitted Vehicle Incidents"
// {
//     ApplicationArea = All;
//     Caption = 'Vehicle Incident List';
//     PageType = List;
//     SourceTable = "Vehicle Incident";
//     CardPageId = "Vehicle Incident Card";
//     UsageCategory = Lists;
//     InsertAllowed = false;
//     ModifyAllowed = false;
//     DeleteAllowed = false;
//     SourceTableView = where(Status = filter(Open | Pending), Submitted = const(true));

//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("Incident No."; Rec."Incident No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Incident No. field.';
//                 }
//                 field("Incident Date"; Rec."Incident Date")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Incident Date field.';
//                 }
//                 field("Incident Time"; Rec."Incident Time")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Incident Time field.';
//                 }
//                 field("Incident Description"; Rec."Incident Description")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Incident Description field.';
//                 }
//                 field("Driver ID"; Rec."Driver ID")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Driver ID field.';
//                 }
//                 field("Driver Name"; Rec."Driver Name")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Driver Name field.';
//                 }
//                 field(Location; Rec.Location)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Location field.';
//                 }
//                 field(Recommendations; Rec.Recommendations)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Recommendations field.';
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

