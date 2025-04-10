// Page 52193446 "Share Transfer Header"
// {
//     PageType = Card;
//     SourceTable = "Share Transfer Header";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field(No;"No.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Date;Date)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description;Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Posted;Posted)
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//             part(Control1000000005;"Share Transfer Lines")
//             {
//                 SubPageLink = Code=field("No.");
//             }
//         }
//         area(factboxes)
//         {
//             systempart(Control1000000008;Links)
//             {
//                 Visible = true;
//             }
//             systempart(Control1000000007;Notes)
//             {
//                 Visible = true;
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             action(Post)
//             {
//                 ApplicationArea = Basic;
//                 Image = Post;

//                 trigger OnAction()
//                 begin
//                     PaymentMgt.PostShareTransfer(Rec);
//                 end;
//             }
//         }
//         area(Promoted)
//         {
//             group(Category_Process)
//             {
//                 actionref(Post_Promoted; Post)
//                 {
//                 }
//             }
//         }
//     }

//     var
//         PaymentMgt: Codeunit "Payment Management";
// }

