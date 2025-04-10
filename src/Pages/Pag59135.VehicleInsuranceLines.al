

page 59135 "Vehicle Insurance Lines"
{
    PageType = ListPart;
    SourceTable = "Vehicle Insurance Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                }
                field("Type of Body"; Rec."Type of Body")
                {
                    ApplicationArea = Basic;
                }
                field("Engine No"; Rec."Engine No")
                {
                    ApplicationArea = Basic;
                }
                field("Chassis Noi"; Rec."Chassis Noi")
                {
                    ApplicationArea = Basic;
                    Caption = 'Chassis No';
                }
                field("Year of Manufacture"; Rec."Year of Manufacture")
                {
                    ApplicationArea = Basic;
                }
                field("Seat Capacity"; Rec."Seat Capacity")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cover Type';
                }
                field("Your Estimated Cost Value(Ksh)"; Rec."Your Estimated Cost Value(Ksh)")
                {
                    ApplicationArea = Basic;
                }
                field("Entertainment Equipmemt"; Rec."Entertainment Equipmemt")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Premium Per Vehicle"; Rec."Basic Premium Per Vehicle")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
    }
}

#pragma implicitwith restore

