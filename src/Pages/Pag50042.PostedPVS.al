namespace ALProjectLIWPA.ALProjectLIWPA;


page 50042 "Posted PV Lines"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "PV Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Applies to Doc. No"; Rec."Applies to Doc. No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Rate"; Rec."VAT Rate")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Six % Rate"; Rec."VAT Six % Rate")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("VAT Withheld Amount"; Rec."VAT Withheld Amount")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Budgetary Control A/C"; Rec."Budgetary Control A/C")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Retention  Amount"; Rec."Retention  Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Claim Doc No."; Rec."Claim Doc No.")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("W/Tax Code"; Rec."W/Tax Code")
                {
                    ApplicationArea = Basic;
                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("W/T VAT Code"; Rec."W/T VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("W/Tax Amount"; Rec."W/Tax Amount")
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Total Net Pay"; Rec."Total Net Pay")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Payee Bank Code"; "Payee Bank Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Payee Bank Name"; "Payee Bank Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Payee Bank Branch Code"; "Payee Bank Branch Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Payee Bank Branch Name"; "Payee Bank Branch Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Payee Bank Account No."; "Payee Bank Account No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Payee Bank Acc Name"; "Payee Bank Acc Name")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            group("Additional Info.")
            {
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        // DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                        RecRef2: RecordRef;
                    // PurchInvHeader: Record "Purch. Inv. Header";
                    begin
                        // if PurchInvHeader.Get(Rec."Applies to Doc. No") then begin
                        //     RecRef.GetTable(PurchInvHeader);
                        //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        //     DocumentAttachmentDetails.RunModal;
                        // end;
                    end;
                }
            }
        }
    }
}
