

page 75219 "EOI Response Card"
{
    PageType = Card;
    SourceTable = "RFI Response";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("RFI Document No."; Rec."RFI Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFI Document No. field.';
                }
                field("Vendor Representative Name"; Rec."Vendor Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Representative Name field.';
                }
                field("Vendor Repr Designation"; Rec."Vendor Repr Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Representative Designation field.';
                }
                field("Vendor Address"; Rec."Vendor Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Address field.';
                }
                field("Vendor Address 2"; Rec."Vendor Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Special Group Vendor"; Rec."Special Group Vendor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Group Vendor field.';
                }
                field("Special Group Category"; Rec."Special Group Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Group Category field.';
                }
                field("Final Evaluation Score"; Rec."Final Evaluation Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Evaluation Score field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Date Submitted"; Rec."Date Submitted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Submitted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
            part(Control31; "RFI Response Line")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
                action(DocAttach)
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
                action("Filed Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    RunObject = Page "RFI Response Filed Document";
                    RunPageLink = "Document No" = field("Document No.");
                    ToolTip = 'Executes the Filed Documents action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                actionref("Filed Documents_Promoted"; "Filed Documents")
                {
                }
            }
            group(Category_Category8)
            {
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

